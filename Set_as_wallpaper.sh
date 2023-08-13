#!/bin/bash

if [ "$XDG_SESSION_DESKTOP" = "gnome" ]; then
	gsettings set org.gnome.desktop.background picture-uri-dark "$1"
else
	feh --bg-fill "$1"
fi
