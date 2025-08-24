#!/bin/bash

FOLDER="/home/seal/dl"
USER="seal"

echo "Deleting all files in "$FOLDER"..."
echo "Current files:"
echo $(ls)
sudo rm -rf "$FOLDER"
sudo mkdir "$FOLDER"
sudo chown "$USER":"$USER" "$FOLDER"
echo "Done!"
