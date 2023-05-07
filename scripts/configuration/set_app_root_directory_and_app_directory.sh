#!/usr/bin/env bash
################################################################################
#                                   Commbase                                   #
#                                                                              #
# Conversational AI Assistant and AI Hub for Computers and Droids              #
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
# Prompts the user to enter the name of a new Commbase App directory and 
# optionally the path of the App root directory. If the user enters an empty
# string for the App directory name, it will keep asking until a non-empty 
# string is provided. If the user does not provide a value for the App root
# directory, the default value is set to the $HOME directory. Then the script
# checks whether the directory specified by the variable COMMBASE_APP_DIR 
# exists. If the directory does not exist, the script exports the path to the
# directory to the Bash shell's and the Z shell's configuration files (.bashrc
# and .zshrc). Finally, the script exits with a status code of 99.
# Remove the lines from the files ~/.bashrc and ~/.zshrc before rerun this 
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

