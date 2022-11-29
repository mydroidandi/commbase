#!/bin/bash
# File: desktop-shark-copy-single-file-to-server-shark2.sh
# Description: Script to ssh copy a file to the server in the user's home directory
# from the relative directory. For example, copy a .zip file from 
# source to destiny

# The configuration file.
source $COMMBASE_ROOT_DIR/commbase/config/commbase.conf

REMOTEUSER=$REMOTE_USER_NAME
REMOTEHOST=$SERVER_HOST_001_IP_ADDRESS
#REMOTEHOST="shark2"

FILE="ProtonVPN_server_configs.zip"
REMOTEDIRECTORY=$HOME

scp $FILE $REMOTEUSER@$REMOTEHOST:$REMOTEDIRECTORY
#scp ProtonVPN_server_configs.zip esteban@192.168.100.45:~/
