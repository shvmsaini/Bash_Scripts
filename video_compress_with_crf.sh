#!/bin/bash
#read crf
 
ffmpeg -i $1  -vcodec libx265 -crf 20 "Compressed-$1"
