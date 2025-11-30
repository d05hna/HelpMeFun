# HelpMeFun
Helper Functions for my PC 

# b function 
b -n {name} -p {path} 
creates a bookmark to cd into a path quick 
once created b -n {name} or b {name} will call the bookmark 

Runs on zsh, but compatible with bash ( i think references of ["${(P)bookname}"] just needs to change to ["${!bookname}"] and it will work )

creates a reference file of all the bookmarks in ~/.config/

