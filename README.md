# `prog.mk` - GNU Make Convenience Script for simple programs

## Sample usage

Put the following in a Makefile:

    PROG=   demo
    SRCS=   demo.c

    USE_XOPEN= 1

    include prog.mk

Once `prog.mk` has been placed in the same directory, the program can
then be built with a simple:

    $ make
    $ ./demo
    hello, world!

