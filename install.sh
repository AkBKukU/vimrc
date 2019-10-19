#!/bin/bash

# getYesNo
# Asks the user the given question and returns a 1 for yes and a 0 for no
function getYesNo ()
{	
	output=2
	message=$1
	valid=false
	until [ $valid == true ]
	do
	
	echo -n "$message (y/n): "
	read choice
	choice=$(echo "${choice^^}" )
		case $choice in
			"Y"|"YES")
				output=1
				valid=true
				;;

			"N"|"NO")
				output=0
				valid=true
				;;
		esac
	done

	return $output
}

getYesNo "Do you want to copy the vimrc files to your home directory?"

if [ "$?" == "1" ]
then
	cp -r .vim* ~/
fi


getYesNo "Do you want tabs to replace spaces for indents?"

if [ "$?" == "1" ]
then
	rm ~/.vimrc
	mv ~/.vimrc-tabs ~/.vimrc

else
	rm ~/.vimrc-tabs
fi
