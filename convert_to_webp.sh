#!/bin/bash

# Prerequisites
# sudo apt install -y webp

# Avoid expanding to non existing files
shopt -s nullglob

# Convert all .jpg, .jpeg, .png files to .webp file
for  path in *.{jpg,jpeg,png}; do
    basename="${path##*/}"
    filename="${basename%.*}"
    
    mkdir -p converted_images
    echo "-- Begin Converting: \"$basename\" --> \"$filename.webp\""
    
    # Convert to webp
    cwebp "$path" -o "converted_images/$filename.webp"
done
