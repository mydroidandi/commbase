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

# skill
# Reads every new data stored in the RESULT_MESSAGE_RECORDING_FILE and
# PREVIOUS_RESULT_MESSAGE_RECORDING_FILE files, parses it, compares it against
# a list of known skills and skillsets, and executes the corresponding skill or
# skillset if the data matches a skill or skillset listed.
# TODO: This is temporary fake versions to test jq
skill() {

	# The app configuration file
	source $COMMBASE_APP_DIR/config/app.conf

	message=$(<$COMMBASE_APP_DIR$RESULT_MESSAGE_RECORDING_FILE)
	previous_message=$(<$COMMBASE_APP_DIR$PREVIOUS_RESULT_MESSAGE_RECORDING_FILE)

	echo $message | jq '."message"'
	echo $message | jq '."control"'
	echo $previous_message | jq '."message"'

	tmux select-window -t 1 && tmux select-pane -t 1 && printf "\e[1;41mCOMMBASE:\e[1;m I don't understand: %s" "$trim_str"
	tmux select-window -t 1 && tmux select-pane -t 4
	exit 99
}

# Call skill if the script is run directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	(skill)
fi

exit 99

