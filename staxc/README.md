# staxc, the Stax compiler (written in Stax)

Welcome to the Stax compiler, an invigorating way to experience Stax. At this time, the compiler
can only handle a subset of the Stax language, sufficient to compile itself.

The compiler has certain principles:

1) The Stax compiler is written in Stax.
2) Only the Stax compiler can compile the Stax compiler.

If you don't already have a copy of staxc1, you can bootstrap it from the included `bootstrap.s`.
If there is no `bootstrap.s` for your architecture, you must cross compile from another architecture.

# Build Instructions

    ./mkmakefile.sh triplet [prefix] > Makefile
    make
    sudo make install

Where prefix is where you want to install (default = `/usr/local`) and triplet is your architecture's
target prefix (such as x86\_64-linux-gnu). The easiest way to get the triplet for your architecture
is to run `gcc -dumpmachine`.

# Using staxc

Compiler invocation: `staxc [-S] [-c] [-a triplet] [-o output] [-static] yourprogram.stax`

Running your program: `./yourpogram`

If your Stax program begins with `i` and is careful to never use `L` or `|D` then it will be interactive.
