#!/bin/bash
# File: desktop-shark-run-sync-custom-directories-in-home-to-external-drives.sh
# Description: Script that synchronizes custom home directories
# to attached external storage drives used for backup copies one
# time.
# Requires 'rsync' already installed.
# Requires a 'Developer' directory with the developer remote user 
# created and set up.
# Requires the package pv to monitor the file transfer with a
# progress bar: Intall pv by running: sudo apt-get install pv 
# Before running this script the first time, paste a copy of every
# directory to sync in its SYNC path to avoid errors that prohibit
# rsync to start syncing or sync well, such as: custom directories
# with wrong permissions, subdirectories or subdirectory files
# with wrong permissions or problems such as file corruption, etc.
# Alternatively, add some code to create the custom directories
# "if not exist" and setup their permissions.

# The Commbase directory.
# Due to the loss of the Commbase application scope here, it must be
# re-assigned.
COMMBASE=$HOME"/Developer"
#COMMBASE=$HOME

# Imports
source $COMMBASE/Commbase/.env

# Assign the current local IP address to a constant
MY_HOST_IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Assign the current hostname to a constant
MY_HOST_NAME=$(hostname | awk '{print $1}')

# Syncing logs file
LOG_FILE=rsync-custom-home-dirs.log

# Clean up a back-up path for every external drive to be used
external_storage_drive_01_backup_path=""
external_storage_drive_02_backup_path=""

# Clean up the log file
echo "" > $LOG_FILE

# Sync information
# It is useful for resolving synchronizing issues or debugging
# modifications to the script
(echo "--------------")
(echo "--------------" >> $LOG_FILE)
(echo "SYNC DETAILS:")
(echo "SYNC DETAILS:" >> $LOG_FILE)
(echo "--------------")
(echo "--------------" >> $LOG_FILE)
(echo "My host ip address:" $MY_HOST_IP_ADDRESS)
(echo "My host ip address:" $MY_HOST_IP_ADDRESS >> $LOG_FILE)
(echo "Desktop Shark ip address:" $DESKTOP_SHARK_IP_ADDRESS)
(echo "Desktop Shark ip address:" $DESKTOP_SHARK_IP_ADDRESS >> $LOG_FILE)
(echo "My host name:" $MY_HOST_NAME)
(echo "My host name:" $MY_HOST_NAME >> $LOG_FILE)
(echo "Desktop Shark hostname:" $DESKTOP_SHARK_HOSTNAME)
(echo "Desktop Shark hostname:" $DESKTOP_SHARK_HOSTNAME >> $LOG_FILE)
(echo "External storage drive 01 tag:" $EXTERNAL_STORAGE_DRIVE_01_TAG)
(echo "External storage drive 02 tag:" $EXTERNAL_STORAGE_DRIVE_01_TAG >> $LOG_FILE)
(echo "External storage drive 01 tag:" $EXTERNAL_STORAGE_DRIVE_02_TAG)
(echo "External storage drive 02 tag:" $EXTERNAL_STORAGE_DRIVE_02_TAG >> $LOG_FILE)
(echo "Log file:" $LOG_FILE)
(echo "Log file:" $LOG_FILE >> $LOG_FILE)
(echo "Directories to sync:")
(echo "Directories to sync:" >> $LOG_FILE)
(echo "~/.config/BraveSoftware/")
(echo "~/.config/BraveSoftware/" >> $LOG_FILE)
(echo "~/config/")
(echo "~/config/" >> $LOG_FILE)
(echo "~/Developer/")
(echo "~/Developer/" >> $LOG_FILE)
(echo "~/Documents/")
(echo "~/Documents/" >> $LOG_FILE)
(echo "~/Downloads/")
(echo "~/Downloads/" >> $LOG_FILE)
(echo "/etc/")
(echo "/etc/" >> $LOG_FILE)
(echo "")
(echo "" >> $LOG_FILE)

# For custom directories with blank spaces, use something like
# this:
# Enable using particular path names with blank spaces.
# Use the PATH in double quotes.
#echo $AAAA"     "$DDDD"         "$MOL_TAG >> "${external_storage_drive_01_backup_path}" &>/dev/null

# Synchronize the custom home directories.
# The IP addresses and hostnames help to make sure that the script
# is executed from the development computer defined in .env.
if [ "$MY_HOST_IP_ADDRESS" != "$DESKTOP_SHARK_IP_ADDRESS" ]; then
	(echo "<> Do not sync from the server. This is only for the Development computer.")
elif [ "$MY_HOST_NAME" == "$DESKTOP_SHARK_HOSTNAME" ]; then
	(echo "<> Press CTRL-c to interrupt")
	(echo "<> Press CTRL-c to interrupt" >> $LOG_FILE)
	(echo "<> Synchronizing custom $HOME directories ...")
	(echo "<> Synchronizing custom $HOME directories ..." >> $LOG_FILE)
	# Set up your custom back-up syncs here
	# The rsync options --progress, --info=progress2, and --stats are unuseful without the option --log-file=$LOG_FILE
	# For more options run: shell> man rsync
	# Sync ~/.config/BraveSoftware/
	external_storage_drive_01_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_01_TAG/SYNC/hosts/$MY_HOST_NAME/.config/BraveSoftware/"
	(echo "<> Syncing the directory: ~/.config/BraveSoftware/ to "$external_storage_drive_01_backup_path" ...")
	(echo "<> Syncing the directory: ~/.config/BraveSoftware/ to "$external_storage_drive_01_backup_path" ..." >> $LOG_FILE)
	(rsync -avh --delete --quiet -e ~/.config/BraveSoftware/* "$external_storage_drive_01_backup_path" 2>&1 | tee -a $LOG_FILE)
	external_storage_drive_02_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_02_TAG/SYNC/hosts/$MY_HOST_NAME/.config/BraveSoftware/"
	(echo "<> Syncing the directory: ~/.config/BraveSoftware/ to "$external_storage_drive_02_backup_path" ...")
	(echo "<> Syncing the directory: ~/.config/BraveSoftware/ to "$external_storage_drive_02_backup_path" ..." >> $LOG_FILE)
	(rsync -avh --delete --quiet -e ~/.config/BraveSoftware/* "$external_storage_drive_02_backup_path" 2>&1 | tee -a $LOG_FILE)
	# Sync ~/config/
	external_storage_drive_01_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_01_TAG/SYNC/hosts/$MY_HOST_NAME/config/"
	(echo "<> Syncing the directory: ~/config/ to "$external_storage_drive_01_backup_path" ...")
	(echo "<> Syncing the directory: ~/config/ to "$external_storage_drive_01_backup_path" ..." >> $LOG_FILE)
	(rsync -avh --delete --quiet -e ~/config/* "$external_storage_drive_01_backup_path" 2>&1 | tee -a $LOG_FILE)
	external_storage_drive_02_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_02_TAG/SYNC/hosts/$MY_HOST_NAME/config/"
	(echo "<> Syncing the directory: ~/config/ to "$external_storage_drive_02_backup_path" ...")
	(echo "<> Syncing the directory: ~/config/ to "$external_storage_drive_02_backup_path" ..." >> $LOG_FILE)
	(rsync -avh --delete --quiet -e ~/config/* "$external_storage_drive_02_backup_path" 2>&1 | tee -a $LOG_FILE)
	# Sync ~/Developer/
	external_storage_drive_01_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_01_TAG/SYNC/hosts/$MY_HOST_NAME/Developer/"
	(echo "<> Syncing the directory: ~/Developer/ to "$external_storage_drive_01_backup_path" ...")
	(echo "<> Syncing the directory: ~/Developer/ to "$external_storage_drive_01_backup_path" ..." >> $LOG_FILE)
	(rsync -avh --delete --quiet -e ~/Developer/* "$external_storage_drive_01_backup_path" 2>&1 | tee -a $LOG_FILE)
	external_storage_drive_02_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_02_TAG/SYNC/hosts/$MY_HOST_NAME/Developer/"
	(echo "<> Syncing the directory: ~/Developer/ to "$external_storage_drive_02_backup_path" ...")
	(echo "<> Syncing the directory: ~/Developer/ to "$external_storage_drive_02_backup_path" ..." >> $LOG_FILE)
	(rsync -avh --delete --quiet -e ~/Developer/* "$external_storage_drive_02_backup_path" 2>&1 | tee -a $LOG_FILE)
	# Sync ~/Documents/
	external_storage_drive_01_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_01_TAG/SYNC/hosts/$MY_HOST_NAME/Documents/"
	(echo "<> Syncing the directory: ~/Documents/ to "$external_storage_drive_01_backup_path" ...")
	(echo "<> Syncing the directory: ~/Documents/ to "$external_storage_drive_01_backup_path" ..." >> $LOG_FILE)
	(rsync -avh --delete --quiet -e ~/Documents/* "$external_storage_drive_01_backup_path" 2>&1 | tee -a $LOG_FILE)
	external_storage_drive_02_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_02_TAG/SYNC/hosts/$MY_HOST_NAME/Documents/"
	(echo "<> Syncing the directory: ~/Documents/ to "$external_storage_drive_02_backup_path" ...")
	(echo "<> Syncing the directory: ~/Documents/ to "$external_storage_drive_02_backup_path" ..." >> $LOG_FILE)
	(rsync -avh --stats --delete --quiet -e ~/Documents/* "$external_storage_drive_02_backup_path" 2>&1 | tee -a $LOG_FILE)
	# Sync ~/Downloads/
	external_storage_drive_01_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_01_TAG/SYNC/hosts/$MY_HOST_NAME/Downloads/"
	(echo "<> Syncing the directory: ~/Downloads/ to "$external_storage_drive_01_backup_path" ...")
	(echo "<> Syncing the directory: ~/Downloads/ to "$external_storage_drive_01_backup_path" ..." >> $LOG_FILE)
	(rsync -avh --delete --quiet -e ~/Downloads/* "$external_storage_drive_01_backup_path" 2>&1 | tee -a $LOG_FILE)
	external_storage_drive_02_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_02_TAG/SYNC/hosts/$MY_HOST_NAME/Downloads/"
	(echo "<> Syncing the directory: ~/Downloads/ to "$external_storage_drive_02_backup_path" ...")
	(echo "<> Syncing the directory: ~/Downloads/ to "$external_storage_drive_02_backup_path" ..." >> $LOG_FILE)
	(rsync -avh --delete --quiet -e ~/Downloads/* "$external_storage_drive_02_backup_path" 2>&1 | tee -a $LOG_FILE)
	# Sync /etc/
	external_storage_drive_01_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_01_TAG/SYNC/hosts/$MY_HOST_NAME/etc/"
	(echo "<> Syncing the directory: /etc/ to "$external_storage_drive_01_backup_path" ...")
	(echo "<> Syncing the directory: /etc/ to "$external_storage_drive_01_backup_path" ..." >> $LOG_FILE)
	(sudo rsync -avh --delete --quiet -e /etc/* "$external_storage_drive_01_backup_path" 2>&1 | tee -a $LOG_FILE)
	external_storage_drive_02_backup_path="/media/$USER/$EXTERNAL_STORAGE_DRIVE_02_TAG/SYNC/hosts/$MY_HOST_NAME/etc/"
	(echo "<> Syncing the directory: /etc/ to "$external_storage_drive_02_backup_path" ...")
	(echo "<> Syncing the directory: /etc/ to "$external_storage_drive_02_backup_path" ..." >> $LOG_FILE)	
	(sudo rsync -avh --delete --quiet -e /etc/* "$external_storage_drive_02_backup_path" 2>&1 | tee -a $LOG_FILE)
	# Log the end of the sync
	(echo "<> Synchronization process completed.")
	(echo "<> Synchronization process completed." >> $LOG_FILE)
	(echo "<> Verify and resolve any sync issue based on the log file and then sync again!")
	(echo "<> Verify and resolve any sync issue based on the log file and then sync again!" >> $LOG_FILE)
else
	(echo "<> Something went wrong! Verify your IP address and hostname in your .env file")
fi

(exit 99)
