all: squares_cubes

squares_cubes: squares_cubes.o
	 gcc -g -o $@ $+

squares_cubes.o: squares_cubes.s
	 as -g -o $@ $<

clean:
	 rm -rf squares_cubes *.o
