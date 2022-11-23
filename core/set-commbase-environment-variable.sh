#!/bin/env bash

# To permanently add a new environment variable in Ubuntu (tested only in 14.04), use the following steps:
# Open a terminal (by pressing CtrlAltT)
# sudo -H gedit /etc/environment
# Type your password
# Edit the text file just opened:
# e.g. if you want to add FOO=bar, then just write FOO=bar in a new line
# Save it
# Once saved, logout and login again.
# Your required changes are made.

# Set environment variable permanently, making each user to have a separate setting
if [[ ! -d "$COMMBASE" ]]; then 
    echo "" >> ~/.bashrc
    echo "# The Commbase directory for the Bash shell" >> ~/.bashrc
    echo 'export COMMBASE="$HOME/Developer/mydroidandi"' >> ~/.bashrc
    echo "" >> ~/.zshrc
    echo "# The Commbase directory for the Z shell" >> ~/.zshrc
    echo 'export COMMBASE="$HOME/Developer/mydroidandi"' >> ~/.zshrc
fi

