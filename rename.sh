#!/bin/bash
#Bash script to shorten all file names in each directory to 5 characters, while keeping the file extension 
for dir in `find . -type d`
do
	rename 's/^(.{5}).*(\..*)$/$1$2/' *
done
