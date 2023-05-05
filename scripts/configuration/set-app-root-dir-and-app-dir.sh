#!/bin/env bash
# set-app-root-dir-and-app-dir.sh.
# Prompts the user to enter the name of a new Commbase App directory and 
# optionally the path of the App root directory. If the user enters an empty
# string for the App directory name, it will keep asking until a non-empty 
# string is provided. If the user does not provide a value for the App root
# directory, the default value is set to the $HOME directory. Then the script
# checks whether the directory specified by the variable COMMBASE_APP_DIR 
# exists. If the directory does not exist, the script exports the path to the
# directory to the Bash shell's and the Z shell's configuration files (.bashrc
# and .zshrc). Finally, the script exits with a status code of 99.
# Remove the  lines from the files ~/.bashrc and ~/.zshrc before rerun this 
# setup.

read -p "Enter the name of the App directory: " APP

while [[ -z "$APP" ]]; do
    read -p "Please enter a non-empty name for the App directory: " APP
done

read -p "Enter the path of the App root directory (press enter for default '$HOME'): " APP_ROOT_DIR

if [[ -z "$APP_ROOT_DIR" ]]; then
    APP_ROOT_DIR="$HOME"
fi

# Check whether the directory specified by the variable does not exist
if [[ ! -d "$COMMBASE_APP_DIR" ]]; then 
    echo "" >> ~/.bashrc
    echo "# The Commbase App directory for the Bash shell" >> ~/.bashrc
    echo "export COMMBASE_APP_DIR=\"$APP_ROOT_DIR/$APP\"" >> ~/.bashrc
    echo "" >> ~/.zshrc
    echo "# The Commbase App directory for the Z shell" >> ~/.zshrc
    echo "export COMMBASE_APP_DIR=\"$APP_ROOT_DIR/$APP\"" >> ~/.zshrc
fi

echo -e "Don't forget to rename the directory of the app as: \033[31m$APP\033[0m"

exit 99

