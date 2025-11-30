#!/bin/bash 

b() {
	while getopts "hnp:" flag; do 
		case $flag in 
			h) # Helper Flag 
			echo "Here is what you do"
			;;
			n) # Name of the Bookmark 
			bookname = $OPTARG 
			;; 
			p) # Path Where The Bookmark Points too 
			pathname = $OPTARG
			;; 
			\?) 
			echo "You Fucked Up Give Me the Correct Arguments use -h if you need"
			;;
	 	esac
	done
	echo "Name is $bookname"
	echo "Path is $pathname"
}