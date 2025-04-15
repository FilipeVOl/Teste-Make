CC = gcc
CFLAGS = -Wall -O2

all: main

main: main.o
	$(CC) $(CFLAGS) -o main main.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

test: test.o
	$(CC) $(CFLAGS) -o test test.o
	./test

clean:
	rm -f main test