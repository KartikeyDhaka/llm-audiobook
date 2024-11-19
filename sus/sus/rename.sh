#!/bin/bash

# Directory containing the .wav files
SOURCE_DIR="./converted"  # Replace with the path to your folder with .wav files

# Loop through all .wav files in the source directory
for file in "$SOURCE_DIR"/*.wav; do
    # Get the base name of the file
    base_name=$(basename "$file")

    # Extract the number from the filename using a regular expression
    number=$(echo "$base_name" | grep -oE '[0-9]+')

    # If a number is found, rename the file
    if [ -n "$number" ]; then
        new_name="${number}.wav"
        mv "$file" "$SOURCE_DIR/$new_name"
        echo "Renamed $base_name to $new_name"
    else
        echo "No number found in $base_name. Skipping."
    fi
done

echo "Renaming process completed."
