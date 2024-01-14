#!/bin/bash

#  ____        _    __ _ _           _ 
# |  _ \  ___ | |_ / _(_) | ___  ___| |
# | | | |/ _ \| __| |_| | |/ _ \/ __| |
# | |_| | (_) | |_|  _| | |  __/\__ \_|
# |____/ \___/ \__|_| |_|_|\___||___(_)
#  ____           _                   ____            _       _   
# |  _ \ ___  ___| |_ ___  _ __ ___  / ___|  ___ _ __(_)_ __ | |_ 
# | |_) / _ \/ __| __/ _ \| '__/ _ \ \___ \ / __| '__| | '_ \| __|
# |  _ <  __/\__ \ || (_) | | |  __/  ___) | (__| |  | | |_) | |_ 
# |_| \_\___||___/\__\___/|_|  \___| |____/ \___|_|  |_| .__/ \__|
#                                                      |_|        
# Author: Zachary Blundell
# This script restores files from the backup to their original locations.
# This is a work in progress use at your own risk!
# might be simpler to use meld or diff 
# Backup directory
backupDir="./theDots"

# Function to clear the line and show new content
clearLine() {
  echo -e "\e[1A\e[K$1"
}

# Step 1: Starting the restore process.
echo "🔄 Starting restore process..."

# Looping through the list of backed-up files
for backedUpFile in "$backupDir"/*; do
  # Get the filename without the path
  fileName=$(basename "$backedUpFile")

  # Step 2: Restoring files.
  clearLine "⏳ Restoring: $fileName"

  # Restore the file to its original location
  cp "$backedUpFile" "$HOME/$fileName"
done

# Step 3: Displaying completion message.
clearLine "🎉 Restore process completed!"
