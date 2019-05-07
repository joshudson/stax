#!/bin/sh

if [ $# -eq 0 ]
then	echo "Usage: mkmakefile triplet > Makefile"
fi

case $1 in
	x86_64-linux-gnu)
		[ -z "$CFLAGS" ] && CFLAGS="-O3 -std=c11"
		DEFINES="-Dnoreturn='__attribute__((noreturn)) void'"
		DIRS="libstax libstax/any libstax/unix libstax/linux libstax/linux/x86_64-linux-gnu"
		LIBOUT=libstax/linux/x86_64-linux-gnu ;;
	*)	cat 1>&2 <<!
Unknown triplet $1
Supported triplets:
  x86_64-linux-gnu
!
		exit 3 ;;
esac

echo "CC = $1-gcc $CFLAGS $DEFINES"
echo "AS = $1-as"
echo "LD = $1-ld"
echo "AR = $1-ar"
echo
echo "all: $LIBOUT/libstax-static.a xstaxc1 bootstrap/x86_64-linux-gnu/staxc1.s staxc1"
echo
echo "clean:"
echo "	rm -f $LIBOUT/*.o $LIBOUT/*.a bootstrap/*/pass* xstaxc1 staxc1"
echo

LIBOBJ=
for DIR in $DIRS
do
	for FILE in $DIR/*.[cs]
	do
		BASE=`basename $FILE`
		case $BASE in
			*.s)	LIBOBJ=`echo $LIBOBJ $LIBOUT/$BASE.o`
				echo "$LIBOUT/$BASE.o: $FILE"
				echo "	\$(AS) -o $LIBOUT/$BASE.o $FILE"
				echo ;;
			*.c)	LIBOBJ=`echo $LIBOBJ $LIBOUT/$BASE.o`
				echo "$LIBOUT/$BASE.o: $FILE"
				echo "	\$(CC) -c -o $LIBOUT/$BASE.o $FILE"
				echo ;;
		esac
	done
done

echo "$LIBOUT/libstax-static.a: $LIBOBJ"
echo "	rm -f $LIBOUT/libstax-static.a"
echo "	\$(AR) r $LIBOUT/libstax-static.a $LIBOBJ"
echo
# TODO check with CC -dumpmachine if we are building a cross and don't even generate this target
echo "bootstrap/$1/staxc1.s: staxc1.stax $LIBOUT/libstax-static.a"
echo "	./xstaxc1 $1 < staxc1.stax > bootstrap/$1/pass1.S"
echo "	\$(CC) -o bootstrap/$1/pass1 bootstrap/$1/pass1.S $LIBOUT/libstax-static.a"
echo "	bootstrap/$1/pass1 $1 < staxc1.stax > bootstrap/$1/pass2.S"
echo "	\$(CC) -o bootstrap/$1/pass2 bootstrap/$1/pass2.S $LIBOUT/libstax-static.a"
echo "	bootstrap/$1/pass2 $1 < staxc1.stax > bootstrap/$1/pass3.S"
echo "	diff --brief bootstrap/$1/pass2.S bootstrap/$1/pass3.S"
echo "	diff -q bootstrap/$1/staxc1.s bootstrap/$1/pass3.S >/dev/null 2>&1 || cp bootstrap/$1/pass3.S bootstrap/$1/staxc1.s"
echo
echo "xstaxc1: $LIBOUT/libstax-static.a"
echo "	\$(CC) -o xstaxc1 bootstrap/$1/staxc1.s $LIBOUT/libstax-static.a"
echo
echo "staxc1: bootstrap/$1/staxc1.s $LIBOUT/libstax-static.a"
echo "	\$(CC) -o staxc1 bootstrap/$1/staxc1.s $LIBOUT/libstax-static.a"

echo
