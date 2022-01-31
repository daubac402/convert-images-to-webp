#!/bin/bash

# Prerequisites
# sudo apt install -y webp

# Avoid expanding to non existing files
shopt -s nullglob

rm -Rf output_images
mkdir -p output_images

# Convert all .jpg, .jpeg, .png files to .webp file
for  path in *.{JPG,jpg,JPEG,jpeg,PNG,png}; do
    basename="${path##*/}"
    filename="${basename%.*}"
    
    echo "-- Begin Converting: \"$basename\" --> \"$filename.webp\""
    
    # Convert to webp
    cwebp "$path" -o "output_images/$filename.webp"
    
    rm -f "$path"
done

echo "-- Success! --"