#!/bin/bash
# Bash script:		writer.sh
# First argument:	full pathto a file (including filename)
# Second argument:	text string which will be written with this file`:w
# Exit (1) + Error:	If any of the argument is not specified
# Exit (1) + Error:	If error if file doen't exist and not able to be created
# Otherwise:		Create a new file with the name and path and content, over
#			writing any existing file and create the path if it doesn't
#			exist.

# Check number of input arguments
if [ "$#" -ne 2 ]
then
	echo 'There should be two input arguments.'
	exit 1
fi


#Get folder from the input file string
folderpath=$(dirname "$1")

# Check if the /tmp/aeld folder exist
if [ ! -d "$folderpath" ]
then
	mkdir -p "$folderpath"
fi	

# Check if the file exist
if [ ! -f "$1" ]
then
	touch "$1"
fi 
echo "$2" > "$1"
