################################################################################
#                               commbase-stt-vosk                              #
#                                                                              #
# Conversational AI Assistant and AI Hub for Computers and Droids              #
#                                                                              #
# Change History                                                               #
# 05/20/2023  Esteban Herrera Original code.                                   #
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

# file_paths.py
# This file stores functions related to loading and managing file paths.


def get_tts_engine_string():
	"""
	Retrieves the TTS (Text-to-Speech) engine string from the configuration file.

	Returns:
	    str or None: The TTS engine string if found in the configuration file,
	    otherwise None.
	"""
	# The path of the env configuration file
	CONFIG_FILE_PATH = load_config_file()

	# Initialize variable for the tts engine string
	tts_engine_str = None

	# Open the file and read its contents
	with open(CONFIG_FILE_PATH, 'r') as f:
		for line in f:
			# Split the line into variable name and value
			variable_name, value = line.strip().split('=')

			# Check if the variable we are looking for exists in the line
			if variable_name == 'MANAGE_RESULT_MESSAGE_ON_&_OUTPUT_SKILL_ERRORS_IN_PANE_ON':
				# Remove the quotes from the value of the variable
				tts_engine_str = value.strip()[1:-1]
				
	# Check if the variable was found
	if tts_engine_str is not None:
		return tts_engine_str 

	# If the variable was not found, return None
	return None
	
