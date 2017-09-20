﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Numerics;
using System.Text.RegularExpressions;

namespace StaxLang {
    /* To add:
     *     exponent
     *     log
     *     invert
     *     arbitrary range
     *     eval
     *     palindromize
     *     prefix / suffixes
     *     recursion (call into newline, conditional call into newline, conditional self-call)
     *     gunzip base 85
     *     
     */

    public class Executor {
        private bool OutputWritten = false;
        public TextWriter Output { get; private set; }

        private static IReadOnlyDictionary<char, object> Constants = new Dictionary<char, object> {
            ['A'] = S2A("ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
            ['a'] = S2A("abcdefghijklmnopqrstuvwxyz"),
            ['d'] = S2A("0123456789"),
            ['W'] = S2A("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
            ['w'] = S2A("0123456789abcdefghijklmnopqrstuvwxyz"),
            ['s'] = S2A(" \t\r\n\v"),
            ['n'] = S2A("\n"),
        };

        private BigInteger Index = BigInteger.Zero; // loop iteration
        private dynamic X = BigInteger.Zero; // register - default to numeric value of first input
        private dynamic Y = BigInteger.Zero; // register - default to first input
        private dynamic Z = S2A(""); // register - default to empty string
        private dynamic _ = BigInteger.Zero; // implicit iterator

        private Stack<dynamic> MainStack;
        private Stack<dynamic> SideStack;

        public Executor(TextWriter output = null) {
            Output = output ?? Console.Out;
        }

        public void Run(string program, string[] input) {
            Z = S2A("");

            if (input.Length > 0) {
                Y = S2A(input[0]);
                if (BigInteger.TryParse(input[0], out var d)) X = d;
            }

            MainStack = new Stack<dynamic>();
            SideStack = new Stack<dynamic>(input.Reverse().Select(S2A));
            try {
                Run(program);
            }
            catch (InvalidOperationException) { }
            catch (ArgumentOutOfRangeException) { }
            if (!OutputWritten) Print(Pop());
        }

        private dynamic Pop() => MainStack.Any() ? MainStack.Pop() : SideStack.Pop();

        private dynamic Peek() => MainStack.Any() ? MainStack.Peek() : SideStack.Peek();

        private void Push(dynamic arg) => MainStack.Push(arg);

        private int TotalSize => MainStack.Count + SideStack.Count;

        private void Run(string program) {
            int ip = 0;

            if (program.Length > 0) switch (program[0]) {
                case 'm': // line-map
                    Run("L{" + program.Substring(1) + "PF");
                    return;
                case 'f': // line-filter
                    Run("L{d{}{_P}_" + program.Substring(1) + "?F");
                    return;
                case 'F': // line-for
                    Run("L{" + program.Substring(1) + "F");
                    return;
            }

            while (ip < program.Length) {
                switch (program[ip++]) {
                    case '`':
                        DoDump(program, ip);
                        break;
                    case '0':
                        Push(BigInteger.Zero);
                        break;
                    case '1':
                    case '2':
                    case '3':
                    case '4':
                    case '5':
                    case '6':
                    case '7':
                    case '8':
                    case '9':
                        --ip;
                        Push(ParseNumber(program, ref ip));
                        break;
                    case ' ':
                    case '\n':
                    case '\r':
                        break;
                    case ';': // peek from side stack
                        Push(SideStack.Peek());
                        break;
                    case ',': // pop from side stack
                        Push(SideStack.Pop());
                        break;
                    case '~': // push to side stack
                        SideStack.Push(Pop());
                        break;
                    case '"': // "literal"
                        --ip;
                        Push(ParseString(program, ref ip));
                        break;
                    case '\'': // single char 'x
                        Push(S2A(program.Substring(ip++, 1)));
                        break;
                    case '{': // block
                        --ip;
                        Push(ParseBlock(program, ref ip));
                        break;
                    case '}': // do-over
                        ip = 0;
                        break;
                    case '!': // not
                        Push(IsTruthy(Pop()) ? BigInteger.Zero : BigInteger.One);
                        break;
                    case '+':
                        DoPlus();
                        break;
                    case '-':
                        DoMinus();
                        break;
                    case '*':
                        DoStar();
                        break;
                    case '/':
                        DoSlash();
                        break;
                    case '%':
                        DoPercent();
                        break;
                    case '@': // read index
                        DoReadIndex();
                        break;
                    case '&': // assign index
                        DoAssignIndex();
                        break;
                    case '#': // to number
                        Push(ToNumber(Pop()));
                        break;
                    case '$': // to string
                        Push(ToString(Pop()));
                        break;
                    case '<':
                        DoLessThan();
                        break;
                    case '>':
                        DoGreaterThan();
                        break;
                    case '=':
                        DoEqual();
                        break;
                    case 'v':
                        if (IsNumber(Peek())) Push(Pop() - 1); // decrement
                        else if (IsArray(Peek())) Push(S2A(A2S(Pop()).ToLower())); // lower
                        else throw new Exception("Bad type for v");
                        break;
                    case '^':
                        if (IsNumber(Peek())) Push(Pop() + 1); // increment
                        else if (IsArray(Peek())) Push(S2A(A2S(Pop()).ToUpper())); // uppper
                        else throw new Exception("Bad type for ^");
                        break;
                    case '(':
                        PadRight();
                        break;
                    case ')':
                        PadLeft();
                        break;
                    case ']': // singleton
                        Push(new List<object> { Pop() });
                        break;
                    case '?': // if
                        DoIf();
                        break;
                    case 'A': // 10 (0xA)
                        Push(BigInteger.One * 10);
                        break;
                    case 'B': // batch
                        Run("ss ~ c;v( 1D;vN) {+;)cm sdsd ,d");
                        break;
                    case 'c': // copy
                        Push(Peek());
                        break;
                    case 'd': // discard
                        Pop();
                        break;
                    case 'D': // dig
                        {
                            int n = (int)Pop();
                            var temp = new Stack<dynamic>();
                            for (int i = 0; i < n; i++) temp.Push(Pop());
                            var target = Peek();
                            while (temp.Any()) Push(temp.Pop());
                            Push(target);
                        }
                        break;
                    case 'E': // explode (de-listify)
                        DoExplode();
                        break;
                    case 'f': // filter
                        DoFilter();
                        break;
                    case 'F': // for loop
                        if (IsNumber(Peek())) {
                            BigInteger n = Pop();
                            for (Index = 0; Index < n; Index++) Run(program.Substring(ip));
                            return;
                        }
                        DoFor();
                        break;
                    case 'h':
                        if (IsNumber(Peek())) Push(Pop() / 2); // half
                        if (IsArray(Peek())) Push(Pop()[0]); // head
                        break;
                    case 'H':
                        if (IsNumber(Peek())) Push(Pop() * 2); // BigInteger
                        if (IsArray(Peek())) Push(Peek()[Pop().Count - 1]); // last
                        break;
                    case 'i': // iteration index
                        Push(Index);
                        break;
                    case 'I': // get index
                        DoGetIndex();
                        break;
                    case 'L': // listify stack
                        var newList = new List<object>();
                        while (TotalSize > 0) newList.Add(Pop());
                        Push(newList);
                        break;
                    case 'm': // do map
                        DoMap();
                        break;
                    case 'M': // transpose
                        DoTranspose();
                        break;
                    case 'n': // get number from input
                        DoGetNumber();
                        break;
                    case 'N': // negate
                        DoNegate();
                        break;
                    case 'O': // order
                        DoOrder();
                        break;
                    case 'p': // print inline
                        Print(Pop(), false);
                        break;
                    case 'P': // print
                        Print(Pop());
                        break;
                    case 'q': // shy print inline
                        Print(Peek(), false);
                        break;
                    case 'Q': // print
                        Print(Peek());
                        break;
                    case 'r': // 0 range
                        if (IsNumber(Peek())) Push(Enumerable.Range(0, (int)Pop()).Select(i => new BigInteger(i)).Cast<object>().ToList());
                        else if (IsArray(Peek())) {
                            var result = new List<object>(Pop());
                            result.Reverse();
                            Push(result); 
                        }
                        else throw new Exception("Bad type for r");
                        break;
                    case 'R': // 1 range
                        Push(Enumerable.Range(1, (int)Pop()).Select(i => new BigInteger(i)).Cast<object>().ToList());
                        break;
                    case 's': // swap
                        {
                            var top = Pop();
                            var bottom = Pop();
                            Push(top);
                            Push(bottom);
                        }
                        break;
                    case 'S': // show array
                        foreach (var e in Pop()) Print(e);
                        break;
                    case 't': // trim left
                        if (IsArray(Peek())) Push(S2A(A2S(Pop()).TrimStart()));
                        else if (IsNumber(Peek())) Run("ss~ c%,-)");
                        else throw new Exception("Bad types for trimleft");
                        break;
                    case 'T': // trim right
                        if (IsArray(Peek())) Push(S2A(A2S(Pop()).TrimEnd()));
                        else if (IsNumber(Peek())) Run("ss~ c%,-(");
                        else throw new Exception("Bad types for trimright");
                        break;
                    case 'u': // unique
                        DoUnique();
                        break;
                    case 'U': // negative Unit
                        Push(BigInteger.MinusOne);
                        break;
                    case 'V': // constant value
                        Push(Constants[program[ip++]]);
                        break;
                    case 'w': // while
                        DoWhile();
                        break;
                    case '_':
                        Push(_);
                        break;
                    case 'x': // read;
                        Push(X);
                        break;
                    case 'X': // write
                        X = Peek();
                        break;
                    case 'y': // read;
                        Push(Y);
                        break;
                    case 'Y': // write
                        Y = Peek();
                        break;
                    case 'z': // read;
                        Push(Z);
                        break;
                    case 'Z': // write
                        Z = Peek();
                        break;
                    case '|': // extended operations
                        switch (program[ip++]) {
                            case '%': // div mod
                                Run("ss1C1C%~/,");
                                break;
                            case '~': // bitwise not
                                Push(~Pop());
                                break;
                            case '&': // bitwise and
                                Push(Pop() & Pop());
                                break;
                            case '|': // bitwise or
                                Push(Pop() | Pop());
                                break;
                            case '^': // bitwise xor
                                Push(Pop() ^ Pop());
                                break;
                            case '*': // exponent
                                Run("s");
                                Push(BigInteger.Pow(Pop(), (int)Pop()));
                                break;
                            case '/': // repeated divide
                                Run("ss~;*{;/c;%!w,d");
                                break;
                            case ')': // rotate right
                                Run("cHsU(+");
                                break;
                            case '(': // rotate left
                                Run("cU)sh+");
                                break;
                            case 'a': // absolute value
                                Push(BigInteger.Abs(Pop()));
                                break;
                            case 'A': // 10 ** x
                                Push(BigInteger.Pow(10, (int)Pop()));
                                break;
                            case 'b': // base convert
                                DoBaseConvert();
                                break;
                            case 'd': // depth of stack
                                Push(new BigInteger(MainStack.Count));
                                break;
                            case 'D': // depth of side stack
                                Push(new BigInteger(SideStack.Count));
                                break;
                            case 'e': // is even
                                Push(Pop() % 2 ^ 1);
                                break;
                            case 'f': // prime factorize
                                Push(PrimeFactors(Pop()));
                                break;
                            case 'g': // gcd
                                DoGCD();
                                break;
                            case 'l': // lcm
                                Run("c2D|g~*,/");
                                break;
                            case 'm': // min
                                Push(BigInteger.Min(Pop(), Pop()));
                                break;
                            case 'M': // max
                                Push(BigInteger.Max(Pop(), Pop()));
                                break;
                            case 'p': // is prime
                                Run("|f%1=");
                                break;
                            case 'P': // print blank newline
                                Print("");
                                break;
                            case 'r': // regex replace
                                DoReplace();
                                break;
                            case 's': // sum
                                Run("0s{+F");
                                break;
                            case 'x': // decrement X, push
                                Push(--X);
                                break;
                            case 'X': // increment X, push
                                Push(++X);
                                break;
                            case 't': // translate
                                DoTranslate();
                                break;
                            default: throw new Exception($"Unknown extended character '{program[ip-1]}'");
                        }
                        break;
                    default: throw new Exception($"Unknown character '{program[ip-1]}'");
                }
            }
        }

        private void DoGetNumber() {
            while(IsArray(SideStack.Peek())) {
                var matches = Regex.Matches((string)A2S(SideStack.Pop()), @"-?\d+");
                for (int i = matches.Count - 1; i >= 0; i--) {
                    SideStack.Push(BigInteger.Parse(matches[i].Value));
                }
            }

            Push(SideStack.Pop());
        }

        private void DoReplace() {
            var replace = Pop();
            var search = Pop();
            var text = Pop();

            if (IsArray(text) && IsArray(search)) {
                string ts = A2S(text), ss = A2S(search);
                if (IsArray(replace)) {
                    Push(S2A(Regex.Replace(ts, ss, A2S(replace))));
                    return;
                }
                else if (IsBlock(replace)) {
                    var initial = _;
                    string result = "";
                    var matches = Regex.Matches(ts, ss);
                    int consumed = 0;
                    foreach (Match match in matches) {
                        result += ts.Substring(consumed, match.Index - consumed);
                        Push(_ = S2A(match.Value));
                        Run(replace.Program);
                        result += A2S(Pop());
                        consumed = match.Index + match.Length;
                    }
                    result += ts.Substring(consumed);
                    Push(S2A(result));
                    _ = initial;
                    return;
                }
                else {
                    throw new Exception("Bad types for replace");
                }
            }
            else {
                throw new Exception("Bad types for replace");
            }
        }

        private void DoTranslate() {
            var translation = Pop();
            var input = Pop();

            if (IsArray(input) && IsArray(translation)) {
                var result = new List<object>();
                var map = new Dictionary<char, char>();
                var ts = A2S(translation);

                for (int i = 0; i < ts.Length; i += 2) map[ts[i]] = ts[i + 1];
                foreach (var e in A2S(input)) result.AddRange(S2A("" + (map.ContainsKey(e) ? map[e] : e)));
                Push(result);
            }
            else {
                throw new Exception("Bad types for translate");
            }
        }

        private void DoNegate() {
            var arg = Pop();

            if (IsNumber(arg)) {
                Push(-arg);
            }
            else {
                throw new Exception("Bad type for negate");
            }
        }

        private void DoDump(string program, int ip) {
            int i = 0;
            Output.WriteLine("program: {0}", program.Substring(ip));
            foreach (var e in MainStack) {
                var formatted = e;
                if (IsArray(e)) {
                    formatted = '"' + A2S(e) + '"';
                    if (((string)formatted).Any(char.IsControl)) formatted = '[' + string.Join(", ", e) + ']';
                }
                Output.WriteLine("{0:##0}: {1}", i++, formatted);
            }
            Output.WriteLine();
        }

        private void DoUnique() {
            var arg = Pop();

            if (IsArray(arg)) {
                var result = new List<object>();
                var seen = new HashSet<object>();
                foreach (var e in arg) {
                    var key = IsArray(e) ? A2S(e) : e;
                    if (!seen.Contains(key)) {
                        result.Add(e);
                        seen.Add(key);
                    }
                }
                Push(result);
            }
            else {
                throw new Exception("Bad type for unique");
            }
        }

        private void DoLessThan() {
            var b = Pop();
            var a = Pop();

            Push(a < b ? BigInteger.One : BigInteger.Zero);
        }

        private void DoGreaterThan() {
            var b = Pop();
            var a = Pop();

            Push(a > b ? BigInteger.One : BigInteger.Zero);
        }

        private void DoOrder() {
            var arg = Pop();

            if (IsArray(arg)) {
                arg.Sort();
                Push(arg);
            }
            else if (IsBlock(arg)) {
                var list = Pop();
                var combined = new List<(object val, IComparable key)>();

                var initial = (_, Index);
                Index = 0;
                foreach (var e in list) {
                    _ = e;
                    Push(e);
                    Run(arg.Program);
                    combined.Add((e, Pop()));
                    ++Index;
                }
                (_, Index) = initial;

                Push(combined.OrderBy(e => e.key).Select(e => e.val).ToList());
            }
            else {
                throw new Exception("Bad types for order");
            }
        }

        private void DoBaseConvert() {
            int @base = (int)Pop();
            var number = Pop();

            if (IsNumber(number)) {
                long n = (long)number;
                string result = "";
                while (n > 0) {
                    result = "0123456789abcdefghijklmnopqrstuvwxyz"[(int)(n % @base)] + result;
                    n /= @base;
                }
                if (result == "") result = "0";
                Push(S2A(result));
            }
            else if (IsArray(number)) {
                string s = A2S(number).ToLower();
                BigInteger result = 0;
                foreach (var c in s) result = result * @base + "0123456789abcdefghijklmnopqrstuvwxyz".IndexOf(c);
                Push(result);
            }
            else {
                throw new Exception("Bad types for base convert");
            }
        }

        private void DoGetIndex() {
            var element = Pop();
            var list = Pop();

            if (!IsArray(list)) (list, element) = (element, list);

            if (IsArray(list)) {
                for (int i = 0; i < list.Count; i++) {
                    if (IsArray(element)) {
                        bool match = true;
                        for (int j = 0; j < element.Count; j++) {
                            if (!AreEqual(list[i + j], element[j])) {
                                match = false;
                                break;
                            }
                        }
                        if (match) {
                            Push((BigInteger)i);
                            return;
                        }
                    }
                    else if (AreEqual(element, list[i])) {
                        Push((BigInteger)i);
                        return;
                    }
                }
                Push(BigInteger.MinusOne);
                return;
            }
            else {
                throw new Exception("Bad types for get-index");
            }
        }

        private void DoExplode() {
            var arg = Pop();

            if (IsArray(arg)) {
                foreach (var item in arg) Push(item);
            }
        }

        private void DoAssignIndex() {
            var element = Pop();
            var index = (int)Pop();
            var list = Pop();

            if (IsArray(list)) {
                var result = new List<object>(list);
                index = ((index % result.Count) + result.Count) % result.Count;
                result[index] = element;
                Push(result);
            }
            else {
                throw new Exception("Bad type for index assign");
            }

        }

        private void DoReadIndex() {
            var top = Pop();
            var list = Pop();

            if (IsArray(top)) (top, list) = (list, top);

            int index = (int)top;
            if (IsArray(list)) {
                index %= list.Count;
                index += list.Count;
                index %= list.Count;
                Push(list[index]);
            }
            else {
                throw new Exception("Bad type for index");
            }
        }

        private void PadLeft() {
            var b = Pop();
            var a = Pop();

            if (IsNumber(a)) (a, b) = (b, a);

            if (IsArray(a) && IsNumber(b)) {
                a = new List<object>(a);
                if (b < 0) b += a.Count;
                if (a.Count < b) a.InsertRange(0, Enumerable.Repeat((object)new BigInteger(32), (int)b - a.Count));
                if (a.Count > b) a.RemoveRange(0, a.Count - (int)b);
                Push(a);
            }
            else {
                throw new Exception("bad types for padleft");
            }
        }

        private void PadRight() {
            var b = Pop();
            var a = Pop();

            if (IsArray(b)) (a, b) = (b, a);

            if (IsNumber(a)) a = ToString(a);

            if (IsArray(a) && IsNumber(b)) {
                a = new List<object>(a);
                if (b < 0) b += a.Count;
                if (a.Count < b) a.AddRange(Enumerable.Repeat((object)new BigInteger(32), (int)b - a.Count));
                if (a.Count > b) a.RemoveRange((int)b, a.Count - (int)b);
                Push(a);
            }
            else {
                throw new Exception("bad types for padright");
            }
        }

        private void DoWhile() {
            Block block = Pop();
            do Run(block.Program); while (IsTruthy(Pop()));
        }

        private void DoIf() {
            bool condition = IsTruthy(Pop());

            var then = Pop();
            if (condition) {
                Pop();
                Push(then);
            }

            if (IsBlock(Peek())) Run(Pop().Program);
        }

        private void Print(object arg, bool newline = true) {
            OutputWritten = true;
            if (IsArray(arg)) {
                Print(A2S((List<object>)arg).Replace("\n", Environment.NewLine), newline);
                return;
            }

            if (newline) Output.WriteLine(arg);
            else Output.Write(arg);
        }

        private void DoFilter() {
            var b = Pop();
            var a = Pop();

            if (IsArray(a) && IsBlock(b)) {
                var initial = (_, Index);
                Index = 0;
                var result = new List<object>();
                foreach (var e in a) {
                    Push(_ = e);
                    Run(b.Program);
                    Index++;
                    if (IsTruthy(Pop())) result.Add(e);
                }
                Push(result);
                (_, Index) = initial;
            }
            else {
                throw new Exception("Bad types for filter");
            }
        }

        private void DoFor() {
            var b = Pop();
            var a = Pop();

            if (IsArray(a) && IsBlock(b)) {
                var initial = (_, Index);
                Index = 0;
                foreach (var e in a) {
                    Push(_ = e);
                    Run(b.Program);
                    Index++;
                }
                (_, Index) = initial;
            }
            else {
                throw new Exception("Bad types for for");
            }
        }

        private void DoTranspose() {
            var list = Pop();
            var result = new List<object>();

            int? count = null;
            foreach (var series in list) count = Math.Min(count ?? int.MaxValue, series.Count);

            for (int i = 0; i < (count ?? 0); i++) {
                var tuple = new List<object>();
                foreach (var series in list) tuple.Add(series[i]);
                result.Add(tuple);
            }

            Push(result);
        }

        private void DoMap() {
            var b = Pop();
            var a = Pop();

            if (IsArray(b)) (a, b) = (b, a);

            if (IsArray(a) && IsBlock(b)) {
                var initial = (_, Index);
                Index = 0;
                var result = new List<object>();
                foreach (var e in a) {
                    Push(_ = e);
                    Run(b.Program);
                    Index++;
                    result.Add(Pop());
                }
                Push(result);
                (_, Index) = initial;
            }
            else {
                throw new Exception("bad type for map");
            }
        }

        private void DoPlus() {
            var b = Pop();
            var a = Pop();

            if (IsNumber(a) && IsNumber(b)) {
                Push(a + b);
            }
            else if (IsArray(a) && IsArray(b)) {
                var result = new List<object>(a);
                result.AddRange(b);
                Push(result);
            }
            else if (IsArray(a)) {
                var result = new List<object>(a);
                result.Add(b);
                Push(result);
            }
            else if (IsArray(b)) {
                var result = new List<object> { a };
                result.AddRange(b);
                Push(result);
            }
            else {
                throw new Exception("Bad types for +");
            }
        }

        private void DoMinus() {
            var b = Pop();
            var a = Pop();

            if (IsArray(a) && IsArray(b)) {
                a = new List<object>(a);
                a.RemoveAll((Predicate<object>)(e => b.Contains(e)));
                Push(a);
            }
            else if (IsArray(a)) {
                a = new List<object>(a);
                a.RemoveAll((Predicate<object>)(e => AreEqual(e, b)));
                Push(a);
            }
            else if (IsNumber(a) && IsNumber(b)) {
                Push(a - b);
            }
            else {
                throw new Exception("Bad types for -");
            }
        }

        private void DoSlash() {
            var b = Pop();
            var a = Pop();

            if (IsNumber(a) && IsNumber(b)) {
                Push(a / b);
            }
            else if (IsArray(a) && IsNumber(b)) {
                var result = new List<object>();
                for (int i = 0; i < a.Count; i += (int)b) {
                    result.Add(((IEnumerable<object>)a).Skip(i).Take((int)b).ToList());
                }
                Push(result);
            }
            else if (IsArray(a) && IsArray(b)) {
                string[] strings = A2S(a).Split(new string[] { A2S(b) }, 0);
                Push(strings.Select(s => S2A(s) as object).ToList());
            }
            else {
                throw new Exception("Bad types for /");
            }
        }

        private void DoPercent() {
            var b = Pop();
            if (IsArray(b)) {
                Push((BigInteger)b.Count);
                return;
            }

            var a = Pop();

            if (IsNumber(a) && IsNumber(b)) {
                Push(a % b);
            }
            else {
                throw new Exception("Bad types for %");
            }
        }

        private void DoStar() {
            var b = Pop();
            var a = Pop();

            if (IsNumber(a)) (a, b) = (b, a);

            if (IsNumber(b)) {
                if (IsArray(a)) {
                    if (b < 0) {
                        a.Reverse();
                        b *= -1;
                    }
                    var result = new List<object>();
                    for (int i = 0; i < b; i++) result.AddRange(a);
                    Push(result);
                    return;
                }
                else if (IsBlock(a)) {
                    var initial = Index;
                    for (Index = 0; Index < b; Index++) Run(a.Program);
                    Index = initial;
                    return;
                }
            }

            if (IsArray(a) && IsArray(b)) {
                string result = "";
                string joiner = A2S(b);
                foreach (var e in a) {
                    if (result != "") result += joiner;
                    result += IsNumber(e) ? e : A2S(e);
                }
                Push(S2A(result));
                return;
            }

            if (IsNumber(a) && IsNumber(b)) {
                Push(a * b);
                return;
            }

            throw new Exception("Bad types for *");
        }

        private void DoEqual() {
            var b = Pop();
            var a = Pop();
            Push(AreEqual(a, b) ? BigInteger.One : BigInteger.Zero);
        }

        #region support
        private object ToNumber(dynamic arg) {
            if (IsArray(arg)) {
                return BigInteger.Parse(A2S(arg));
            }
            throw new Exception("Bad type for ToNumber");
        }

        private List<object> ToString(dynamic arg) {
            if (IsNumber(arg)) {
                return S2A(arg.ToString());
            }
            else if (IsArray(arg)) {
                string result = "";
                foreach (var e in arg) result += IsNumber(e) ? e : A2S(e);
                return S2A(result);
            }
            throw new Exception("Bad type for ToString");
        }

        private bool AreEqual(dynamic a, dynamic b) {
            if (IsNumber(a) && IsNumber(b)) return a == b;
            if (IsArray(a) && IsArray(b)) return Enumerable.SequenceEqual(a, b);
            else return false;
        }

        private static bool IsNumber(object b) => b is BigInteger;
        private static bool IsArray(object b) => b is List<object>;
        private static bool IsBlock(object b) => b is Block;
        private static bool IsTruthy(dynamic b) => (IsNumber(b) && b != 0) || (IsArray(b) && b.Count != 0);

        private static List<object> S2A(string arg) => arg.ToCharArray().Select(c => (BigInteger)(int)c as object).ToList();
        private static string A2S(List<object> arg) {
            return string.Concat(arg.Select(e => IsNumber(e)
                ? ((char)(int)(BigInteger)e).ToString()
                : A2S((List<object>)e)));
        }

        private object ParseNumber(string program, ref int ip) {
            BigInteger value = 0;

            while (ip < program.Length && char.IsDigit(program[ip]))
                value = value * 10 + program[ip++] - '0';

            if (ip < program.Length && program[ip] == '.') {
                ++ip;
                return double.Parse(value + "." + ParseNumber(program, ref ip));
            }
            return value;
        }

        private List<object> ParseString(string program, ref int ip) {
            string result = "";
            while (ip < program.Length - 1 && program[++ip] != '"') {
                if (program[ip] == '`') ++ip;
                result += program[ip];
            }
            if (ip < program.Length) ++ip; // final quote
            return S2A(result);
        }

        private Block ParseBlock(string program, ref int ip) {
            int depth = 0;
            int start = ip + 1;
            do {
                if (program[ip] == '|' || program[ip] == '\'' || program[ip] == 'V') {
                    ip++; // 2-char tokens
                    continue;
                }

                if (program[ip] == '"') {
                    ParseString(program, ref ip);
                    --ip;
                    continue;
                }

                if (program[ip] == '{') ++depth;
                if (program[ip] == '}' && --depth == 0) return new Block(program.Substring(start, ip++ - start));

                // shortcut block terminators
                if ("wmfFO".Contains(program[ip]) && --depth == 0) return new Block(program.Substring(start, ip - start));
            } while (++ip < program.Length);
            return new Block(program.Substring(start));
        }
        #endregion

        #region extended
        private List<object> PrimeFactors(BigInteger n) {
            var result = new List<object>();
            BigInteger d = 2;
            while (n > 1) {
                while (n % d == 0) {
                    result.Add(d);
                    n /= d;
                }
                ++d;
            }
            return result;
        }

        private void DoGCD() {
            var b = Pop();

            if (IsArray(b)) {
                BigInteger result = 0;
                foreach (BigInteger e in b) result = GCD(result, e);
                Push(result);
                return;
            }

            var a = Pop();
            if (IsNumber(a) && IsNumber(b)) {
                Push(GCD(a, b));
                return;
            }

            throw new Exception("Bad types for GCD");
        }

        private BigInteger GCD(BigInteger a, BigInteger b) {
            if (a == 0 || b == 0) return a + b;
            return GCD(b, a % b);
        }
        #endregion
    }
}
