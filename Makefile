CC = gcc
CFLAGS = -Wall -O2
VIDEO = video.mp4
GIF = saida.gif

.PHONY: all run test gif clean

all: app test

app: main.o
	$(CC) $(CFLAGS) -o app main.o

test: test.o
	$(CC) $(CFLAGS) -o test test.o
	./test

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

run: app
	./app

gif: $(GIF)

$(GIF): $(VIDEO)
	ffmpeg -y -ss 00:00:10 -t 5 -i $(VIDEO) \
	-vf "fps=15,scale=1920:-1:flags=lanczos" \
	-c:v gif $(GIF)

clean:
	rm -f *.o app test $(GIF)
