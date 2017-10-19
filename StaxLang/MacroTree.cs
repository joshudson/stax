﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace StaxLang {
    static class MacroTree {
        public class TreeNode {
            public string Description { get; }
            public string Code { get; }
            public Dictionary<char, TreeNode> Children { get; }
            public bool HasChildren => Children != null;

            public TreeNode(string code, string desc) {
                Code = code;
                Description = desc;
            }

            public TreeNode() {
                Children = new Dictionary<char, TreeNode>();
            }

            public void AddMacro(string types, string code, string desc) {
                // types: (a)rray, (b)lock, (f)raction, (i)nt, (r)eal
                if (types.Length == 0) throw new InvalidOperationException("not enough types");
                if (types.Length == 1) {
                    Children[types[0]] = new TreeNode(code, desc);
                }
                else {
                    var key = types.Last();
                    if (!Children.TryGetValue(key, out var node)) node = Children[key] = new TreeNode();
                    node.AddMacro(types.Substring(0, types.Length - 1), code, desc);
                }
            }
        }

        private static readonly IReadOnlyDictionary<char, TreeNode> MacroTrees;
        static MacroTree() {
            // types: (a)rray, (b)lock, (f)raction, (i)nt, (r)eal
            var macros = new(char alias, string types, string code, string desc)[] {
                ('0', "a", "{Cim", "get indices of falsy elements"),
                ('1', "a", "{!Cim", "get indices of truthy elements"),
                ('1', "i", "2|E1#", "popcount; number of 1s in binary representation"),
                ('2', "i", "2|L@", "floor log base 2"),
                ('2', "f", "2|L@", "floor log base 2"),
                ('2', "r", "2|L@", "floor log base 2"),
                ('3', "a", "Vac13|)\\:fc^+|t", "rot13"),
                (':', "ai", "/{hm", "get every nth element"),
                ('/', "ii", "0~{b%Csn/s,^~Wdd", "how many times will b divide a?"),
                ('/', "ai", "n%%b(aat", "split array at index; push both"),
                ('*', "a", "{*k", "array product"),
                ('[', "aa", "~;%(,=", "starts with"),
                (']', "aa", "~;%),=", "starts with"),
                ('(', "a", "c%r{[|(msd", "all left rotations"),
                (')', "a", "c%r{[|)msd", "all right rotations"),
                ('-', "ii", "-|a", "absolute difference"),
                ('-', "rr", "-|a", "absolute difference"),
                ('-', "ff", "-|a", "absolute difference"),
                ('-', "a", "2B{Es-m", "pairwise difference of array"),
                ('A', "i", "A|L@", "floor log base A"),
                ('A', "f", "A|L@", "floor log base A"),
                ('A', "r", "A|L@", "floor log base A"),
                ('b', "iii", "a~;>s,>!*", "value is in [range)"),
                ('b', "fii", "a~;>s,>!*", "value is in [range)"),
                ('b', "rii", "a~;>s,>!*", "value is in [range)"),
                ('B', "ia", "~;%|E{;@m,d", "number in custom base"),
                ('c', "iii", "a|m|M", "clamp integer to bounds"),
                ('c', "rii", "a|m|M1!*", "clamp float to bounds"),
                ('f', "a", "{+k", "flatten array"),
                ('f', "i", "|f|R", "prime factorization pairs: [factor exponent]"),
                ('F', "i", "|fu", "distinct prime factors"),
                ('I', "aa", "{[Imsd", "get all indexes of"),
                ('J', "a", "c%|Qe~;J(,/", "squarify"),
                ('m', "ai", "0|Mbs%/^a*s(", "repeat array to specified length"),
                ('m', "ii", "~;|%10?+,*", "increase to multiple"),
                ('m', "a", "cr+", "mirror"),
                ('r', "aaa", "aa/s*", "replace all substring occurrences"),
                ('r', "i", "|aNcN^|r", "centered range [-n ... n]"),
                ('S', "aa", "s-!", "is superset of"),
                ('u', "a", "u%1=", "contains exactly 1 unique element?"),
            };

            var trees = new Dictionary<char, TreeNode>();
            foreach (var macro in macros) {
                if (!trees.TryGetValue(macro.alias, out var tree)) tree = trees[macro.alias] = new TreeNode();
                tree.AddMacro(macro.types, macro.code, macro.desc);
            }
            MacroTrees = trees;
        }
        public static TreeNode GetMacroTree(char alias) => MacroTrees[alias];

        private static readonly IReadOnlyDictionary<Type, char> TypeChars = new Dictionary<Type, char> {
            [typeof(List<object>)] = 'a',
            [typeof(Block)] = 'b',
            [typeof(Rational)] = 'f',
            [typeof(BigInteger)] = 'i',
            [typeof(double)] = 'r',
        };
        public static char GetTypeChar(object o) => TypeChars[o.GetType()];
    }
}
