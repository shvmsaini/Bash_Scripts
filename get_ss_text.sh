#! /bin/sh

filename=$(uuidgen)

flameshot gui -p ~/.${filename}.jpg

tesseract ~/.${filename}.jpg ~/.temp_${filename}

cat ~/.temp_${filename}.txt | xclip -selection clipboard

rm ~/.temp_${filename}.txt
