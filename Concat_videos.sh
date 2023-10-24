#! /bin/sh

for file in "${@}"; do
    echo "file '$file'" >> "/tmp/to_concat.txt"
done

ffmpeg -f concat -safe 0 -i /tmp/to_concat.txt -c copy /tmp/concatenated.mp4
