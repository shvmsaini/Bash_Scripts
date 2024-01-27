#!/bin/bash

selected_files=("$@")

for i in "${selected_files[@]}"
do
	ffmpeg -nostdin -i $i "./compressed-$i"
done
