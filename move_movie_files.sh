#!/bin/bash

# Set the source directory
source_dir="/downloads"

# Set the destination directory (optional)
destination_dir="/movies"

# Check if source directory exists
if [[ ! -d "$source_dir" ]]; then
  echo "Error: Source directory '$source_dir' does not exist."
  exit 1
fi

# Check if destination directory exists and create it if not
if [[ ! -d "$destination_dir" ]]; then
  mkdir -p "$destination_dir"
  echo "Destination directory '$destination_dir' created."
fi

# Find all .movie files in subdirectories recursively
find "$source_dir" -type f -name "*.mp4" -print0 | xargs -0 -I {} mv -v "{}" "$destination_dir"
find "$source_dir" -type f -name "*.mkv" -print0 | xargs -0 -I {} mv -v "{}" "$destination_dir"

echo "Successfully extracted movie files to '$destination_dir'."

rm -rf /downloads/*
