#!/bin/bash
#ES Conversione MP3->Mono WAV

for dir in *; do
	cd $dir;
	pwd;
	for f in *.mp3; do 
		#CMD='ffmpeg -i '$f' -acodec pcm_s16le -ac 1 '${f/%mp3/wav}'';
		#echo $CMD;
		#ffmpeg -i "$f" -acodec pcm_s16le -ac 1 "${f/%mp3/wav}"
		rm "$f"
	done;
	cd ..;
done

