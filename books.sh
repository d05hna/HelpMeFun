#!/bin/bash 

b() {
	while getopts "hn:p:" flag; do 
		case $flag in 
			h) # Helper Flag 
			echo "Here is what you do"
            return 0 
			;;
			n) # Name of the Bookmark 
			local bookname="$OPTARG" 
			;; 
			p) # Path Where The Bookmark Points too 
			local pathname="$OPTARG"
			;; 
			\?) 
			echo "You Fucked Up Give Me the Correct Arguments use -h if you need"
			;;
	 	esac
	done
	# If no book mark config file exists make one 
    local config_file="$HOME/.config/books.sh"
    [ -e "$config_file" ] || echo "#!/bin/bash" > "$config_file"
    source "$config_file"
	
    if [ -z "$bookname" ]; then
        echo "Error: You must provide a bookmark name using the -n flag."
        echo "Use 'b -h' for help."
        return 1
    fi
	# check if the bookmark exists or not 
 	if [ -n "$bookname" ]; then # Cool we have a name 
        # Check if we also have a path specified (Creating a new one)
        if [ -n "$pathname" ]; then
            printf '%s=%q\n' "$bookname" "$pathname" >> "$config_file"
            echo "Bookmark '$bookname' created pointing to '$pathname'."
        
        # If we have a name but NO path (Gotta CD)
        else
            # Check if the variable NAMED by $bookname is set and points to a directory
            if [ -d "${(P)bookname}" ]; then
                cd "${(P)bookname}"
            else
                echo "Error: Bookmark '$bookname' not found or path is not a valid directory."
                return 1
            fi
        fi
    else
        # If no -n flag was provided at all
        echo "Hey Dummy, I need to know where to go pass the -n flag"
        echo "Use 'b -h' for help. if you are a dickhead"
        return 1
    fi

}