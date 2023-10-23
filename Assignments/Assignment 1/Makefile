# Makefile
all: twoInt

twoInt: twoInt.o
	gcc -g -o $@ $+

twoInt.o: twoInt.s
	as -g -o $@ $<

clean:
	rm -rf twoInt *.o
