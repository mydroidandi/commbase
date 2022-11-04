#!/bin/bash
# File: desktop-shark-copy-single-file-to-server-shark2.sh
# Description: Script to ssh copy a file to the server in the user's home directory
# from the relative directory. For example, copy a .zip file from 
# source to destiny

REMOTEUSER="esteban"
REMOTEHOST="192.168.100.45"
#REMOTEHOST="shark2"

FILE="ProtonVPN_server_configs.zip"
REMOTEDIRECTORY=$HOME

scp $FILE $REMOTEUSER@$REMOTEHOST:$REMOTEDIRECTORY
#scp ProtonVPN_server_configs.zip esteban@192.168.100.45:~/
