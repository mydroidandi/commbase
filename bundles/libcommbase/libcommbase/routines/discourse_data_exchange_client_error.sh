#!usr//bin/env bash
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 03/25/2024  Esteban Herrera Original code.                                   #
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

# discourse_data_exchange_client_error.sh
# Handles the presentation and logging of the assistant discourse message with
# the discourse key data_exchange_client_error. It is called without parameters from
# any programming language, assuming the responsibility to run
# assistant_discourse.sh internally to make sure that the discourse is in the
# language of choice.
discourse_data_exchange_client_error() {
  # The configuration file
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Imports from libcommbase
  assistant_discourse=$COMMBASE_APP_DIR/bundles/libcommbase/libcommbase/routines/assistant_discourse.sh

  time=0.1

  # Call assistant_discourse with the arguments: pane, i18n, origin,
  # log_severity_level_1, discourse_key.
  (clear; bash "$assistant_discourse" 7 2 "data-exchange-client" "$LOG_SEVERITY_LEVEL_1" data_exchange_client_error && sleep "$time");

  exit 99
}

# Call discourse_data_exchange_client_error if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  (discourse_data_exchange_client_error)
fi

exit 99
