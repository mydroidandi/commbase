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

# update_hostname_and_ip_address.sh
# Updates the hostname and host IP address in the .env file
update_hostname_and_ip_address() {

  # Path to the env file
  ENV_FILE="$COMMBASE_APP_DIR/env/.env";

  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Capture the current host name and host IP address and storing them
  NEW_HOST_NAME=$(hostname | awk '{print $1}');
  NEW_HOST_IP_ADDRESS=$(hostname -I | awk '{print $1}');

  sed -i "s/^HOSTNAME=.*/HOSTNAME=$NEW_HOST_NAME/" "$ENV_FILE"
  sed -i "s/^HOST_IP_ADDRESS=.*/HOST_IP_ADDRESS=$NEW_HOST_IP_ADDRESS/" "$ENV_FILE"

  exit 99
}

# Call update_hostname_and_ip_address if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (update_hostname_and_ip_address)
fi
