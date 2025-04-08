#!/bin/bash

cd unzip || { echo "/unzip not found"; exit 1; }

if ! ls -d */ >/dev/null 2>&1; then
    echo "No packs found"
    exit 0
fi

echo "Zipping packs"

for folder in */; do
    folder_name="${folder%/}"
    if [ -d "$folder_name" ]; then
        zip_file="${folder_name}.zip"
        echo "Zipping $folder_name into $zip_file"
        zip -r "$zip_file" "$folder_name"
        
        # Move the zip file to /packs
        if [ -f "$zip_file" ]; then
            mv "$zip_file" ../packs/
            echo "Moved $zip_file to /packs/"
        else
            echo "Error: Failed to create $zip_file"
        fi
    fi
done

echo "Completed"