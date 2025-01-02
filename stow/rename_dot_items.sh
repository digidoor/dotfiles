#!/bin/bash

rename_dot_items() {
    for item in "$1"/.*; do
        if [[ -e "$item" && "$item" != "$1/." && "$item" != "$1/.." ]]; then
            dir_name=$(dirname "$item")
            base_name=$(basename "$item")
            new_name=$(echo "$base_name" | sed 's/^\./dot-/')
            if [[ "$base_name" != "$new_name" ]]; then
                mv "$item" "$dir_name/$new_name"
                echo "Renamed '$item' to '$dir_name/$new_name'"
            fi
        fi
    done

    for dir in "$1"/*/; do
        if [[ -d "$dir" ]]; then
            rename_dot_items "$dir"
        fi
    done
}

rename_dot_items "."
