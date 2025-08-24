# ubuntu-download-server

Solution on Ubuntu for downloading content

## References

- Install guide: https://itsfoss.com/download-youtube-linux/#download-youtube-videos-in-various-formats-and-quality-size
- Source code: https://github.com/ytdl-org/ytdl-nightly/releases

## Installation

This installation guide will use **Ubuntu-24.04**.

1. wsl --install "Ubuntu-24.04"
2. wsl -d "Ubuntu-24.04"

Install packages:

- sudo apt update -y && sudo apt upgrade -y
- sudo apt install -y build-essential git wget nano make ffmpeg

Clone repo:

- cd ~
- git clone https://github.com/sealonthemoon/ubuntu-download-server.git

### Setup

- cd ~/ubuntu-download-server
- sudo cp youtube-dl /usr/local/bin/
- sudo chmod a+rx /usr/local/bin/youtube-dl
- alias youtube-dl='python3 /usr/local/bin/youtube-dl'
- youtube-dl -U

### Usage

cleardl.sh : clear 'dl' download folder

clearlist.sh : clear 'dllist' entries

clearplaylist.sh : clear 'dlplaylist' entries

dl : download folder

dllist : list of youtube URLS (videos/music)

dlplaylist : list of youtube URLS (playlists)

execlist.sh : download URLS in dllist

execplaylist.sh : download URLS in dlplaylist

youtube-dl : python script used for downloading

#### Change Path

Scripts to edit:

- execlist.sh
- execplaylist.sh

Steps:

1. sudo nano execlist.sh
2. INPUT_FILE="/home/seal/dllist" -> INPUT_FILE="YOUR/PATH/dllist"
3. DOWNLOAD_FOLDER="/home/seal/dl" -> DOWNLOAD_FOLDER="YOUR/PATH/dl"
4. CTRL + S, CTRL X

Scripts to edit:

- cleardl.sh
- clearlist.sh
- clearplaylist.sh

Steps:

1. sudo nano cleardl.sh
2. FOLDER="/home/seal/dl" -> FOLDER="YOUR/PATH/dl"
3. USER="seal" -> USER="USERNAME"
4. CTRL + S, CTRL X

Make executable:

Scripts: 

- execlist.sh
- execplaylist.sh
- cleardl.sh
- clearlist.sh
- clearplaylist.sh

Command:

- sudo chmod +x execlist.sh

#### Execute script

To download youtube audio files, paste the urls in dllist. Next, execute the script

- sudo echo "URL" >> dllist
- sudo ./execlist.sh

To download a playlist, paste the url(s) in dlplaylist.

- sudo echo "URL" >> dlplaylist
- sudo ./execplaylist.sh

All downloads will be saved in dl.

#### Clear scripts

- Clear dl folder : sudo ./cleardl.sh
- Clear dllist entries : sudo ./clearlist.sh
- Clear dlplaylist entries : sudo ./clearplaylist.sh