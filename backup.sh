#!/bin/bash
#  ____        _    __ _ _           _ 
# |  _ \  ___ | |_ / _(_) | ___  ___| |
# | | | |/ _ \| __| |_| | |/ _ \/ __| |
# | |_| | (_) | |_|  _| | |  __/\__ \_|
# |____/ \___/ \__|_| |_|_|\___||___(_)
#  ____             _                  ____            _       _   
# | __ )  __ _  ___| | ___   _ _ __   / ___|  ___ _ __(_)_ __ | |_ 
# |  _ \ / _` |/ __| |/ / | | | '_ \  \___ \ / __| '__| | '_ \| __|
# | |_) | (_| | (__|   <| |_| | |_) |  ___) | (__| |  | | |_) | |_ 
# |____/ \__,_|\___|_|\_\\__,_| .__/  |____/ \___|_|  |_| .__/ \__|
#                             |_|                       |_|        
# Author : Zachary Blundell
# This script copies files mentioned inside `backup-paths.conf` to the root of the project.

# File to look for the paths to backup.
backupPaths="./backup-paths.conf"
# Home directory path.
homeDir=$HOME
# Function to clear the line and show new content.
clearLine() {
  echo -e "\e[1A\e[K$1"
}

# Step 1: Clearing the destination directory.
echo "🛑 Clearing my-dots directory..."
# Removing the folder with exsiting contents. There should be a git version anyway!
rm -rf theDots
# Recreating it for backup.
mkdir theDots
sleep 1
clearLine "🧹 Dotfiles directory cleared."
sleep 1

# Step 2: Starting the backup process.
clearLine "🚀 Starting backup..."
sleep 1

# Looping through the list & avoiding the empty spaces
sed '/^[ \t]*$/d' $backupPaths | while read filePath; do
  # Step 3: Copying files.
  clearLine "⏳ Copying: $filePath"

  # Find & replace for ~ with home path
  findThis="~/"
  replaceWith="$homeDir/"
  fullFilePath="${filePath//${findThis}/${replaceWith}}"

  # Copying the files
  cp --parents --recursive "$fullFilePath" ./theDots
  sleep 0.1
done

# Step 4: Displaying completion message.
clearLine "🎉 Backup finished! You can review & commit your changes."
