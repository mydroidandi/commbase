#!/bin/env bash
# set-commbase-root-directory.sh

# Set environment variable permanently, making each user to have a
# separate setting
if [[ ! -d "$COMMBASE" ]]; then 
    echo "" >> ~/.bashrc
    echo "# The Commbase directory for the Bash shell" >> ~/.bashrc
    echo 'export COMMBASE="$HOME/Developer/mydroidandi"' >> ~/.bashrc
    echo "" >> ~/.zshrc
    echo "# The Commbase directory for the Z shell" >> ~/.zshrc
    echo 'export COMMBASE="$HOME/Developer/mydroidandi"' >> ~/.zshrc
fi

