#!/bin/bash
# File: desktop-shark-browser-vscode.sh
# Description: Opens a specified Project workspace in MS VS Code

# The configuration file.
source $COMMBASE_ROOT_DIR/commbase/config/commbase.conf

# Path to the current/custom project that I am currently working on
PATH_TO_PROJECT=$COMMBASE_ROOT_DIR/$DEV_PROJECT_DIRECTORY_NAME

# Open the project
cd $PATH_TO_PROJECT
(code $DEV_PROJECT_DIRECTORY_NAME.code-workspace)
