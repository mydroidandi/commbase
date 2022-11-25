#!/bin/bash
# File: desktop-shark-browser-vscode.sh
# Description: Opens a specified Project workspace in MS VS Code

# The Commbase directory:
# Due to the loss of the Commbase application scope here, it must be re-assigned
COMMBASE=$HOME"/Developer"
#COMMBASE=$HOME

# Files to import:
source $COMMBASE/Commbase/.env

# Path to the current/custom project that I am currently working on
PATH_TO_PROJECT=$COMMBASE/$DEV_PROJECT_DIRECTORY_NAME

# Open the project
cd $PATH_TO_PROJECT
(code-insiders $DEV_PROJECT_DIRECTORY_NAME.code-workspace --disable-gpu)
