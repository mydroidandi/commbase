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

# install_vosk_model.sh
# Downloads and install the Vosk model for Commbase to work.

# Downloads the model zip
download_vosk_model() {
  cd "$COMMBASE_APP_DIR/bundles/built-in/broker/vosk/models/vosk-model-en-us-0.22-lgraph" || return
  wget -O vosk-model-en-us-0.22-lgraph.zip https://alphacephei.com/vosk/models/vosk-model-en-us-0.22-lgraph.zip || return
  echo "Vosk model downloaded successfully."
}

# Extracts the model zip
extract_vosk_model() {
	unzip vosk-model-en-us-0.22-lgraph.zip
}

# Renames the model directory
rename_vosk_model() {
	mv vosk-model-en-us-0.22-lgraph model
}

# Sets up the model directory permissions
set_up_model_permissions() {
	chmod 755 model
}

# Deletes the zip file
delete_zip_file() {
	rm -rf vosk-model-en-us-0.22-lgraph.zip
}

# Installs Voks model
install_vosk_model() {

	download_vosk_model || exit 99;
	extract_vosk_model || exit 99;
	rename_vosk_model || exit 99;
	set_up_model_permissions || exit 99;
	delete_zip_file || exit 99;

exit 99

}

# Main call
install_vosk_model || exit 99;

exit 99

