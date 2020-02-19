
all: main
# run with ./main

main.o: main.c
	gcc -c -Wall main.c

main: main.o
	gcc -Wall -lpthread main.o -o main

clean:
	rm -rf main.o main
