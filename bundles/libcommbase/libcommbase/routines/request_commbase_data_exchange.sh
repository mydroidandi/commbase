#!usr//bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 02/13/2024  Esteban Herrera Original code.                                   #
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

# request_commbase_data_exchange.sh
# Sends the messages request through commbase-data-exchange client.
request_commbase_data_exchange() {
  # Configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  cd "$COMMBASE_APP_DIR"/data || exit

  # Send the messages request through commbase-data-exchange client
  "$PYTHON_ENV_VERSION" "$COMMBASE_DATA_EXCHANGE_CLIENT_UPDATER_FILE_PATH"

  exit 99
}

# Call request_commbase_data_exchange if the script is
# run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (request_commbase_data_exchange)
fi

exit 99
