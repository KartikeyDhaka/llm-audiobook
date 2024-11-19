#!/bin/bash

# Directory containing the .wav files
SOURCE_DIR="./intermediate"  # Replace with the path to your folder with .wav files

# Define the suffix-to-folder mapping
declare -A SUFFIX_MAPPING=(
    ["angry"]="Angry"
    ["sadness"]="Sleepy"
    ["disgust"]="Disgusted"
    ["frustration"]="Angry"
    ["fear"]="Angry"
    ["surprise"]="Amused"
    ["happiness"]="Amused"
    ["neutral"]="Neutral"
)

# Loop through all .wav files in the source directory
for file in "$SOURCE_DIR"/*.wav; do
    # Get the base name of the file
    base_name=$(basename "$file")

    # Extract the suffix (text after the last underscore "_", without the file extension)
    suffix=$(echo "$base_name" | rev | cut -d'_' -f1 | rev | cut -d'.' -f1)

    # Determine the destination folder based on the mapping
    destination_folder=${SUFFIX_MAPPING[$suffix]}

    # If the suffix is not in the mapping, default to "Neutral"
    if [ -z "$destination_folder" ]; then
        destination_folder="Neutral"
    fi

    # Create the destination folder if it doesn't exist
    # mkdir -p "..//$destination_folder"
    #mkdir -p "/gan/final/$destination_folder/gan/interspeech2020_codes/data/wav/evaluation_set/Neutral"
    # Move the file to the corresponding folder
    # mv "$file" "$SOURCE_DIR/$destination_folder/"
    mv "$file" "/gan/final/$destination_folder/gan/interspeech2020_codes/data/wav/evaluation_set/Neutral"
    echo "Moved $file to /gan/final/$destination_folder/gan/interspeech2020_codes/data/wav/evaluation_set/Neutral"
    # echo "Moved $file to $SOURCE_DIR/$destination_folder/"
done

echo "All files have been moved."

