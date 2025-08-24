#!/bin/bash

INPUT_FILE="/home/seal/dlplaylist"
DOWNLOAD_FOLDER="/home/seal/dl"
echo "-----------------------------------------------------"
echo "INPUT_FILE:               $INPUT_FILE"
echo "DOWNLOAD_FOLDER:  $DOWNLOAD_FOLDER"
echo "-----------------------------------------------------"

# Initialize youtube-dl
echo "|YOUTUBE-DL| - Initializing youtube-dl command..."
alias youtube-dl='python3 /usr/local/bin/youtube-dl'
echo "|YOUTUBE-DL| - Done!"

# Change to DL directory
echo "|DIR| - Changing directory..."
cd "$DOWNLOAD_FOLDER"
echo "|DIR| - Path:"
pwd
echo "|DIR| - Contents:"
echo $(ls)
echo "|DIR| - Done!"

# Download playlist
echo "|DL| - Downloading content..."
echo "-----------------------------------------------------"
while IFS= read -r param; do
    echo "URL:  $param"
    sudo python3 /usr/local/bin/youtube-dl --user-agent "Mozilla/5.0""$param" -x --audio-format mp3 -cit "$param"
    echo "Done!"
    echo "-----------------------------------------------------"
done < "$INPUT_FILE"
echo "|DL| - Done!"

# Rename loop
echo "|RENAME| - Renaming files in $DOWNLOAD_FOLDER..."
for file in *.mp3; do
    # Remove the last dash and random string before .mp3
    new_name=$(echo "$file" | sed -E 's/-[^-]+\.mp3$/.mp3/')

    # Rename the file
    if [ "$file" != "$new_name" ]; then
        mv "$file" "$new_name"
        echo "|RENAME| - $file    ----->    $new_name"
    fi
done
echo "|RENAME| - Done!"

echo "|COMPLETE| - Script has completed successfully!"
