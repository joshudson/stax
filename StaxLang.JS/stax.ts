import { Block, Program, parseProgram } from './block';
import * as _ from 'lodash';
import * as bigInt from 'big-integer';
import { Rational } from './rational';

const one = bigInt.one, zero = bigInt.zero, minusOne = bigInt.minusOne;

export class ExecutionState {
    public ip: number;
    public cancel: boolean;

    constructor(ip: number, cancel = false) {
        this.ip = ip;
        this.cancel = cancel;
    }
}

function fail(msg: string): never {
    throw msg;
}

function isFloat(n: any): n is number {
    return typeof n === "number";
}
function isInt(n: any): n is bigInt.BigInteger {
    return bigInt.isInstance(n);
}
function isArray(n: StaxValue | string): n is StaxArray {
    return Array.isArray(n);
}
function isNumber(n: StaxValue): n is StaxNumber {
    return isInt(n) || isFloat(n) || n instanceof Rational;
}

function S2A(s: string): StaxArray {
    let result: StaxArray = [];
    for (let i = 0; i < s.length; i++) result.push(bigInt(s.charCodeAt(i)));
    return result;
}

function A2S(a: StaxArray): string {
    let result = "";
    for (let e of a) {
        if (isInt(e)) result += String.fromCodePoint(e.valueOf());
        else if (isArray(e)) result += A2S(e);
        else throw `can't convert ${e} to string`;
    }
    return result;
}

function floatify(num: StaxNumber): number {
    if (isInt(num)) return num.valueOf();
    if (num instanceof Rational) return num.valueOf();
    return num;
}

function broadenNums(...nums: StaxNumber[]): StaxNumber[] {
    if (_.some(nums, isFloat)) {
        return _.map(nums, floatify);
    }
    if (_.some(nums, n => n instanceof Rational)) {
        return _.map(nums, n => n instanceof Rational ? n : new Rational(n, minusOne));
    }
    return nums;
}

type StaxNumber = number | bigInt.BigInteger | Rational;
type StaxValue = StaxNumber | Block | StaxArray;
interface StaxArray extends Array<StaxValue> { }

export class Runtime {
    private lineOut: (line: string) => void;
    private outBuffer = ""; // unterminated line output
    private mainStack: StaxArray = [];
    private inputStack: StaxArray = [];
    private producedOutput = false;

    constructor(output: (line: string) => void) {
        this.lineOut = output;
    }

    private push(val: StaxValue) {
        this.mainStack.push(val);
    }

    private peek(): StaxValue {
        return _.last(this.mainStack) || _.last(this.inputStack) || fail("peeked empty stacks");
    }

    private pop(): StaxValue {
        return this.mainStack.pop() || this.inputStack.pop() || fail("popped empty stacks");
    }

    private print(val: StaxValue | string, newline = true) {
        this.producedOutput = true;

        if (isInt(val) || typeof val === "number") val = val.toString();
        if (val instanceof Block) val = `Block: ${val.contents}`;
        if (isArray(val)) val = A2S(val);

        if (newline) {
            this.lineOut(this.outBuffer + val);
            this.outBuffer = "";
        }
        else {
            this.outBuffer += val;
        }
    }

    public *runProgram(program: string) {
        for (let s of this.runSteps(parseProgram(program))) yield s;
    }

    private *runSteps(block: Block) {
        if (typeof block === "string") block = parseProgram(block);

        let ip = 0;
        for (let token of block.tokens) {
            yield new ExecutionState(ip);

            if (token instanceof Block) {
                this.push(token);
                continue;
            }
            else {
                if (!!token[0].match(/\d+!/)) this.push(parseFloat(token.replace("!", ".")));
                else if (!!token[0].match(/\d/)) this.push(bigInt(token));
                switch (token) {
                    case ' ':
                        break;

                    case '+':
                        this.doPlus();
                        break;

                    case 'P':
                        this.print(this.pop());
                        break;
                }
            }

            ip += token.length;
        }
    }

    private doPlus() {
        let b = this.pop(), a = this.pop();
        if (isNumber(a) && isNumber(b)) {
            let result: StaxNumber;
            [a, b] = broadenNums(a, b);
            if (isFloat(a) && isFloat(b)) result = a + b;
            else if (a instanceof Rational && b instanceof Rational) throw "todo";
            else if (isInt(a) && isInt(b)) result = a.add(b);
            else throw "weird types or something; can't add?"

            this.push(result);
        }
    }
}