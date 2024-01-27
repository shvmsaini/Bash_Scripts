#!/bin/bash

# Check if imagemagick is installed
if ! command -v magick &> /dev/null; then
    echo "Error: imagemagick is not installed. Please install imagemagick to use this script."
    exit 1
fi

user_input=$(zenity --entry --text="What percentage of original quality do you want?");

if [ $? = 0 ];
then

	if [ "${user_input: -1}" != "%" ];
	then 
		user_input="${user_input}%"
	fi 

 	selected_files=("$@")
	for i in "${selected_files[@]}"
	do
 		magick convert "./$i" -resize $user_input  "./compressed-$i"
	done
fi
