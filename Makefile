CC = gcc
CFLAGS = -Wall -O2
OBJS = main.o test.o
TARGET = test
VIDEO = video.mp4
GIF = saida.gif

# Nome do executável
all: $(TARGET)

$(TARGET): main.o test.o
	$(CC) $(CFLAGS) -o $(TARGET) main.o test.o

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

test: $(TARGET)
	./$(TARGET)

# Alvo principal
gif: $(GIF)

# Comando para gerar o GIF a partir do vídeo
$(GIF): $(VIDEO)
	ffmpeg -y -ss 00:00:10 -t 5 -i $(VIDEO) \
	-vf "fps=15,scale=1920:-1:flags=lanczos" \
	-c:v gif $(GIF)

# Limpeza
clean:
	rm -f *.o $(TARGET) $(GIF)
