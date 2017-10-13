# Stax
Stax Golfing Language

Stax is yet another stack-based programming language, optimized for code golf.  Stax is influenced by [GS2](https://github.com/nooodl/gs2), [05AB1E](https://github.com/Adriandmen/05AB1E), and others.  Stax is written in printable ASCII characters, although it can be optionally packed into bytes.  The language isn't stable yet, and I haven't publicized it much yet.

## Types
Falsy values are numeric zeroes and empty arrays.  All other values are truthy.
 * **Integer** Aribitrary size
 * **Float** Standard double precision
 * **Rational** Fractions of integers
 * **Block** Reference to unexecuted code for map/filter/etc
 * **Array** Heterogeneous lists of any values

Strings are not a type in stax.  Strings are represented as arrays of integer codepoints.  There are specific instructions to treat these as strings.  For instance `P` will output an array as if it was a string, followed by a newline.

## Features
Stax does lots of stuff, but here are the highlights and most interesting.

### Compressed string literals
Stax has a variant of string literals suitable for compressing english like text with no special characters.  It's compressed using huffman codes.  It uses a different set of huffman codes for every pair of preceding characters.  The character weights were derived from a large corpus of English-like text.  `"Hello, World!"` could be written as  `` `jaH1"jS3!` ``.  The language comes with a compression utility.

### Rationals
Stax supports fraction arithmetic.  You can use `u` to turn an integer upside down. So `3u` yields `1/3`.  Fractions are always in reduced terms.  `3u 6*` multiplies 1/3 by 6, but the result will be `2/1`.

### PackedStax
PackedStax is an alternative representation for stax code.  It is never ambiguous with stax, since PackedStax always has the leading bit of the first byte set.  That means the same interpreter can be used for both representations with no extra information.  For ease of clipboard use, PackedStax can be represented using a modified CP437 character encoding.  It yields ~18% savings over ASCII.

### Annotator
Golfing languages are pretty unreadable by their nature.  But Stax comes with an annotation feature to break down a program into individual instructions and explain each one in English.
