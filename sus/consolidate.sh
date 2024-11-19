#!/bin/bash

# Directory containing the subfolders
SOURCE_DIR="./source"  # Replace with the parent directory of your subfolders

# Target directory to consolidate all files
TARGET_DIR="./consolidated"  # Replace with the path to your target folder

items=("Amused" "Angry" "Sleepy" "Disgusted")

# Loop through the list
for item in "${items[@]}"; do
    echo "Current item: $item"
    mkdir -p "$consilidated"
    find "/gan/final/$item/gan/interspeech2020_codes/vaw-gan/logdir/output" -type f -name "*.wav" -exec mv {} "$TARGET_DIR/" \;
done

# Create the target directory if it doesn't exist
# Find and move all .wav files from subfolders to the target directory


echo "All .wav files have been moved to $TARGET_DIR."
