#!/bin/env bash
# set-commbase-root-directory.sh
# Sets the environment variable permanently, making each user to have a separate
# setting.

# This code checks whether the environment variable COMMBASE_ROOT_DIR is not set
# or is empty.
if [[ ! "$COMMBASE_ROOT_DIR" ]]; then 
	echo "" >> ~/.bashrc
	echo "# The Commbase directory for the Bash shell" >> ~/.bashrc
	echo 'export COMMBASE_ROOT_DIR="$HOME/Developer/mydroidandi"' >> ~/.bashrc
	echo "" >> ~/.zshrc
	echo "# The Commbase directory for the Z shell" >> ~/.zshrc
	echo 'export COMMBASE_ROOT_DIR="$HOME/Developer/mydroidandi"' >> ~/.zshrc
fi

exit 99

