#!/usr/bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 05/16/2024  Esteban Herrera Original code.                                   #
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

# terminal_request_user_password_and_execute.sh
# Description: This script prompts the user for their password and, if
# validated, executes the given command with optional parameters.

# Function to request the user's password and validate it
terminal_request_user_password_and_execute() {
  local command="$1"
  local parameter_1="$2"
  local parameter_2="$3"
  local username

  # Get the current username
  username=$(whoami)

  # Prompt for the user's password
  echo -n "Please enter your password: "
  read -r -s user_password
  echo

  # Validate the password using 'su'
  echo "$user_password" | su -c "exit" "$username" >/dev/null 2>&1
  local su_exit_status=$?

  if [ $su_exit_status -eq 0 ]; then
    echo "Password validated."
    # Execute the command with parameters
    (eval "$command" "$parameter_1" "$parameter_2")
  else
    echo "Incorrect password or permission denied."
    exit 1
  fi

  exit 99
}

# Call terminal_request_user_password_and_execute if the script is run directly
# (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (terminal_request_user_password_and_execute "$1" "$2" "$3")
fi

exit 99
