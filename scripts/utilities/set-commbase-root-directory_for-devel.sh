#!/bin/env bash
# set-commbase-root-directory.sh
# Sets the environment variable permanently, making each user to have a separate
# setting.

# Check whether the directory specified by the variable does not exist
if [[ ! "$COMMBASE_ROOT_DIR" ]]; then 
	echo "" >> ~/.bashrc
	echo "# The Commbase directory for the Bash shell" >> ~/.bashrc
	echo 'export COMMBASE_ROOT_DIR="$HOME/Developer/mydroidandi"' >> ~/.bashrc
	echo "" >> ~/.zshrc
	echo "# The Commbase directory for the Z shell" >> ~/.zshrc
	echo 'export COMMBASE_ROOT_DIR="$HOME/Developer/mydroidandi"' >> ~/.zshrc
fi

exit 99

