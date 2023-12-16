# Makefile
all: Final

Final: Final.o
	 gcc -g -o $@ $+

Final.o: Final.s
	 as -g -o $@ $<

clean:
	 rm -rf Final *.o
