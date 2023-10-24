#!/bin/bash
# Checking required programs are installed
if ! command -v pdfseparate &> /dev/null; then
    echo "Error: pdfseparate command is not installed."
    exit 1
fi

if ! command -v pdfunite &> /dev/null; then
    echo "Error: pdfunite command is not installed."
    exit 1
fi

if ! command -v zenity &> /dev/null; then
    echo "Error: Zenity is not installed."
    exit 1
fi

options=$(zenity --forms \
	--title="Separated and Merge" \
	    	--text="Enter First and Last Page:" \
	    	--add-entry="First Page (Inclusive):" \
	    	--add-entry="Last Page (Inclusive):")

first=$(echo "$options" | cut -d '|' -f 1)
last=$(echo "$options" | cut -d '|' -f 2)

input_file="$1"

# Check if input file is selected
if [ -z "$input_file" ]; then
    echo "No input file selected. Exiting..."
    exit 1
fi

directory=$(dirname "$input_file")
file_name=$(basename "$input_file")

# Convert PDF to images and compress
#pdfseparate -f $first -l $last "$input_file" /tmp/page_%d.pdf
#pdfunite /tmp/page_*.pdf "$directory/separated-$file_name"
#rm /tmp/page_*.pdf

gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dFirstPage=$first -dLastPage=$last -sOutputFile="$directory/separated-$file_name" "$input_file"

echo "PDF Separation is done."

