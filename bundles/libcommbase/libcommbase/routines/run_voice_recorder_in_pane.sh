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

# run_voice_recorder_in_pane.sh
# Run the recorder-transmitter for Bash or for Shell, as specified in the
# variable RECORDER_TRANSMITTER_FILE.
run_voice_recorder_in_pane() {
  # Imports
  source "$COMMBASE_APP_DIR"/config/commbase.conf

  # Run the recorder-transmitter
  (tmux select-window -t 1 && tmux select-pane -t "$pane" && tmux send-keys " clear; bash $COMMBASE_APP_DIR/$RECORDER_TRANSMITTER_FILE" C-m);

}

# Check if both text and delay are provided as arguments
if [ $# -ne 1 ]; then
  echo "Usage: $0 <pane>"
  exit 1
fi

# Global declarations
pane="$1"

(run_voice_recorder_in_pane "$pane")
