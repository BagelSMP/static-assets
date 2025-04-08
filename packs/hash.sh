#!/bin/bash

echo "Generating SHA-1 Hashes"
for file in *.zip; do
    if [ -f "$file" ]; then
        echo "Processing file"
        hash=$(sha1sum "$file" | cut -d' ' -f1)
        #echo "$file: $hash" >> hashes.txt
        echo "$hash" > "${file%.zip}.sha1"
    fi
done

echo "Completed"