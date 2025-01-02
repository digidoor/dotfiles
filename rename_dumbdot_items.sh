#!/bin/bash

rename_dumbdot_items() {
    local dir="$1"
    
    # Process files and directories starting with "dot-"
    for item in "$dir"/dot-*; do
	    if [[ -e "$item" && "$(basename "$item")" != "dot-git" ]]; then
            local dir_name=$(dirname "$item")
            local base_name=$(basename "$item")
            local new_name=$(echo "$base_name" | sed 's/^dot-/\./')
            if [[ "$base_name" != "$new_name" ]]; then
                mv "$item" "$dir_name/$new_name"
                echo "Renamed '$item' to '$dir_name/$new_name'"
            fi
        fi
    done

    # Recursively process subdirectories
    for subdir in "$dir"/*/; do
        if [[ -d "$subdir" && "$(basename "$subdir")" != ".git" ]]; then
            rename_dumbdot_items "$subdir"
        fi
    done
}

# Start the renaming process from the current directory
rename_dumbdot_items "."
