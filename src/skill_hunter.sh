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

# skill_hunter.sh
# Reads the new JSON data request stored in commbase-data-exchange/server/client_data,
# searches for a Commbase skill or skill or skillset that matches the request in
# the directory, and calls the uploader in the server.
skill_hunter() {
  # The configuration files
  source $COMMBASE_APP_DIR/config/commbase.conf
  source $COMMBASE_APP_DIR/config/app.conf
  source $COMMBASE_APP_DIR/config/secrets

  # Read the new JSON data request stored in commbase-data-exchange/server/client_data
  data_exchange_client_data_file=/bundles/built-in/broker/commbase-data-exchange/server/client_data/json_1.json

  messages=$(<$COMMBASE_APP_DIR$data_exchange_client_data_file)

  # Extract and echo each message
  #echo "$messages" | jq -r '.messages[] | to_entries[] | "\(.key): \(.value)"'

  # Extract and echo the entry corresponding to "control"
  #echo "$messages" | jq -r '.messages[] | select(.control != null) | to_entries[] | "\(.key): \(.value)"'

  # Store only the value of "current_request" without the key
  current_request=$(echo "$messages" | jq -r '.messages[] | select(.current_request != null) | .current_request')

  echo "Current request:" "$current_request""."

  # Search for a Commbase skill or skill or skillset that matches the request in
  # the directory.
  # TODO:
  echo "SEARCHING FOR SKILL OR SKILLSET IN THE DIRECTORY ..."


  # Call the uploader in the server
  # TODO:

  # Store only the value of "current_request" without the key
  current_request=$(echo "$messages" | jq -r '.messages[] | select(.current_request != null) | .current_request')

  tmux select-window -t 1 && tmux select-pane -t 1 && printf "\e[1;41mCOMMBASE:\e[1;m I don't understand: %s\n" "$current_request""."
  #tmux select-window -t 1 && tmux select-pane -t 4 && gnome-terminal --command='ls' &
  tmux select-window -t 1 && tmux select-pane -t 1

  exit 99
}

# Call skill if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (skill_hunter)
fi

exit 99
