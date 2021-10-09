#!/bin/bash
user_input=$(zenity --entry --text="What percentage of original quality do you want?");

if [ $? = 0 ];
then

	if [ "${user_input: -1}" != "%" ];
	then 
		user_input="${user_input}%"
	fi 
 	
 	magick convert "./$1" -resize $user_input  "./compressed-$1"

fi

