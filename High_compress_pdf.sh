#!/bin/bash
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen \
-dNOPAUSE -dQUIET -dBATCH -sOutputFile=$1-compressed.pdf $1

