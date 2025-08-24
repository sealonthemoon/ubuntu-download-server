#!/bin/bash

FOLDER="/home/seal/dlplaylist"
USER="seal"

echo "Deleting all entries in "$FOLDER"..."
echo "Current entries:"
echo $(cat "$FOLDER")
sudo rm -rf "$FOLDER"
sudo touch "$FOLDER"
sudo chown "$USER":"$USER" "$FOLDER"
echo "Done!"
