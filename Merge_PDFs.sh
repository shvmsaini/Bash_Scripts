#!/bin/bash

# Check if pdfunite is installed
if ! command -v pdfunite &> /dev/null; then
    echo "Error: pdfunite is not installed. Please install poppler-utils package to use this script."
    exit 1
fi

# Check if at least 2 PDF files are selected
if [ $# -lt 1 ]; then
    echo "Usage: $0 input1.pdf input2.pdf"
    exit 1
fi

# Get the output PDF filename
output_filename=merged-$(date +'%Y%m%d%H%M%S').pdf

# Get the selected PDF files from Nemo
selected_files=("$@")

# Merge selected PDF files using pdfunite
pdfunite "${selected_files[@]}" "$output_filename"

echo "PDF files merged successfully into '$output_filename'."

