#!/usr/bin/env bash
################################################################################
#                                   Commbase                                   #
#                                                                              #
# AI Powered Conversational Assistant for Computers and Droids                 #
#                                                                              #
# Change History                                                               #
# 04/29/2023  Esteban Herrera Original code.                                   #
#                           Add new history entries as needed.                 #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (c) 2022-present Esteban Herrera C.                               #
#  stv.herrera@gmail.com                                                       #
#                                                                              #
#  This program is free software; you can redistribute it and/or modify        #
#  it under the terms of the GNU General Public License as published by        #
#  the Free Software Foundation; either version 3 of the License, or           #
#  (at your option) any later version.                                         #
#                                                                              #
#  This program is distributed in the hope that it will be useful,             #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
#  GNU General Public License for more details.                                #
#                                                                              #
#  You should have received a copy of the GNU General Public License           #
#  along with this program; if not, write to the Free Software                 #
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #

# set_app_root_directory_and_app_directory.sh
# Allows the user to rename a directory and update the environment variables
# accordingly. The script prompts the user to enter the current location and
# name of the directory they want to rename, and also to enter a new name and
# location for the directory.

# Prompt user to enter the current location of the Commbase repository directory,
# and set the default location to $HOME if no input is provided.
read -r -p "👉️ Enter the current location of the Commbase repository directory (press enter for default '$HOME'): " DIR_TO_RENAME_PATH

if [[ -z "$DIR_TO_RENAME_PATH" ]]; then
    DIR_TO_RENAME_PATH="$HOME"
fi

# Prompt user to enter the current name of the Commbase repository directory,
# and repeat the prompt until a non-empty input is provided.
read -r -p "👉️ Enter the current name of the Commbase repository directory (for example, commbase or commbase-main): " DIR_TO_RENAME

while [[ -z "$DIR_TO_RENAME" ]]; do
    read -r -p "👉️ Please enter a non-empty name of the Commbase repository directory: " DIR_TO_RENAME
done

# Prompt user to enter a new location for their app, and set the default
# location to $HOME if no input is provided.
read -r -p "👉️ Enter a new location for your app (press enter for default '$HOME'): " NEW_DIR_PATH

if [[ -z "$NEW_DIR_PATH" ]]; then
    NEW_DIR_PATH="$HOME"
fi

# Prompt user to enter the name for their new app, and repeat the prompt until a
# non-empty input is provided.
read -r -p "👉️ Enter your new app's name: " NEW_DIR_NAME

while [[ -z "$NEW_DIR_NAME" ]]; do
    read -r -p "👉️ Please enter a non-empty name for the new app: " NEW_DIR_NAME
done

# Rename the app directory
mv "$DIR_TO_RENAME_PATH/$DIR_TO_RENAME" "$NEW_DIR_PATH/$NEW_DIR_NAME"

# Overwrite the line in .bashrc if it exists
if grep -q "COMMBASE_APP_DIR" ~/.bashrc; then
    sed -i "s#COMMBASE_APP_DIR=.*#COMMBASE_APP_DIR=\"$NEW_DIR_PATH\/$NEW_DIR_NAME\"#" ~/.bashrc
else
    {
      echo ""
      echo "# The Commbase App directory for the Bash shell"
      echo "export COMMBASE_APP_DIR=\"$NEW_DIR_PATH/$NEW_DIR_NAME\""
    } >> ~/.bashrc  # using a (multiline) command grouping construct
fi

# Overwrite the line in .zshrc if it exists
if grep -q "COMMBASE_APP_DIR" ~/.zshrc; then
    sed -i "s#COMMBASE_APP_DIR=.*#COMMBASE_APP_DIR=\"$NEW_DIR_PATH\/$NEW_DIR_NAME\"#" ~/.zshrc
else
    { echo ""
      echo "# The Commbase App directory for the Z shell"
      echo "export COMMBASE_APP_DIR=\"$NEW_DIR_PATH/$NEW_DIR_NAME\""
		} >> ~/.zshrc  # using a (multiline) command grouping construct
fi

# Set the APP_DIR variable to the new directory
APP_DIR="$NEW_DIR_PATH/$NEW_DIR_NAME"

# Print the new app directory path
echo -e "🎉️ Yor new app directory is: \033[31m$APP_DIR\033[0m"

exit 99
