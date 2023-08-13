#!/bin/bash
# Check if ImageMagick's convert is installed
if ! command -v convert &> /dev/null; then
    echo "Error: ImageMagick's convert command is not installed. Please install ImageMagick to use this script."
    exit 1
fi

# Check if Zenity is installed
if ! command -v zenity &> /dev/null; then
    echo "Error: Zenity is not installed. Please install Zenity to use this script."
    exit 1
fi

# Prompt user for options
options=$(zenity --forms \
    --title="PDF Compression Options" \
    --text="Enter compression options:" \
    --add-entry="Resolution (DPI):" \
    --add-entry="Quality (%):" \
    --add-combo="Image Type:" --combo-values="jpeg|png")

# Parse user input
resolution=$(echo "$options" | cut -d '|' -f 1)
quality=$(echo "$options" | cut -d '|' -f 2)
image_type=$(echo "$options" | cut -d '|' -f 3)

input_file="$1"

# Check if input file is selected
if [ -z "$input_file" ]; then
    echo "No input file selected. Exiting..."
    exit 1
fi

directory=$(dirname "$input_file")
file_name=$(basename "$input_file")

# Convert PDF to images and compress
convert -density "$resolution" -quality "$quality" -compress "$image_type" "$input_file" "$directory/compressed-$file_name.pdf"

echo "PDF compression complete. Compressed PDF saved as '$directory/compressed-$file_name.pdf'."

