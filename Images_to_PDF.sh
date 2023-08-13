#!/bin/bash

# Check if any files are selected
if [ $# -eq 0 ]; then
    notify-send "PDF Conversion" "No files provided."
    exit 1
fi

# Create a timestamp for the output PDF filename
timestamp=$(date +'%Y%m%d%H%M%S')

# Specify the output PDF filename
output_pdf="output_${timestamp}.pdf"

# Use convert command to create PDF
convert "$@" "$output_pdf"

# Check if conversion was successful
if [ $? -eq 0 ]; then
    notify-send "PDF Conversion" "PDF created: $output_pdf"
else
    notify-send "PDF Conversion" "PDF creation failed."
fi

exit 0

