#!usr//bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 01/26/2024  Esteban Herrera Original code.                                   #
#                           Add new history entries as needed.                 #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (c) 2023-present Esteban Herrera C.                               #
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

# check_data_exchange_server_connection.sh
# Uses a loop to check if the data exchange server is running before starting
# the data exchange client.
check_data_exchange_server_connection() {

  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Data exchange server IP address and port
  SERVER_HOST=$COMMBASE_DATA_EXCHANGE_SERVER_HOST_ADDRESS
  SERVER_PORT=$COMMBASE_DATA_EXCHANGE_SERVER_PORT

  # Function to check if the server is running
  check_server() {
    nc -zv "$SERVER_HOST" "$SERVER_PORT"
  }

  # Wait for the server to start (timeout after a certain duration)
  timeout_duration=60  # Set the timeout duration in seconds
  start_time=$(date +%s)

  while true; do
    if check_server; then
      echo "Server is running. Starting the client..."
      # Add your client startup command here
      break
    fi

    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))

    if [ "$elapsed_time" -ge "$timeout_duration" ]; then
      echo "Timeout: Unable to connect to the server within $timeout_duration seconds."
      exit 1
    fi

    echo "Waiting for the server to start..."
    sleep 1  # Adjust the sleep duration as needed
  done
}

# Call check_data_exchange_server_connection if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (check_data_exchange_server_connection)
fi
