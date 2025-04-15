# Nome do arquivo de entrada e saída
VIDEO = video.mp4
GIF = saida.gif

# Alvo principal
gif: $(GIF)

# Comando para gerar o GIF a partir do vídeo
$(GIF): $(VIDEO)
	ffmpeg -y -ss 00:00:10 -t 5 -i $(VIDEO) \
	-vf "fps=15,scale=1920:-1:flags=lanczos" \
	-c:v gif $(GIF)

# Limpeza
clean:
	rm -f $(GIF)
