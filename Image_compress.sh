#!/bin/bash
ffmpeg -nostdin -i $1 "./compressed-$1"
