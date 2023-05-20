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

# This file contains a collection of utility functions for various tasks. It
# provides a set of commonly used functions related to data manipulation, file
# handling, and mathematical operations.

# Requirements
import os.path


def get_instruction_to_mute_microphone(file_path):
	"""
	Retrieves the ASCII art avatar for the assistant.

	This function reads the contents of an ASCII art file specified by the file
	path and returns it as a string.

	Returns:
	    str: The ASCII art avatar for the assistant.

	Raises:
	    KeyError: If the 'COMMBASE_APP_DIR' environment variable is not set.
	    FileNotFoundError: If the ASCII art file specified by the file path does
	    not exist.
	    IOError: If there is an error while reading the file.

	Example:
	    ASCII art file: /path/to/avatar.asc

	    >>> get_assistant_avatar()
	    'ASCII ART CONTENTS'
	"""
	# Specify the path of the env file containing the variables
	#file_path = os.environ["COMMBASE_APP_DIR"] + '/bundles/built-in/broker/libcommbase/resources/discourses/mute_the_microphone_to_pause_the_recording_instruction'
	file_variable = ""

	# Open the file in read mode
	with open(file_path, "r") as file:
		# Read the entire contents of the file
		file_variable = file.read()

	# Return the variable with the file contents
	return file_variable



def get_assistant_avatar():
	"""
	Retrieves the ASCII art avatar for the assistant.

	This function reads the contents of an ASCII art file specified by the file
	path and returns it as a string.

	Returns:
	    str: The ASCII art avatar for the assistant.

	Raises:
	    KeyError: If the 'COMMBASE_APP_DIR' environment variable is not set.
	    FileNotFoundError: If the ASCII art file specified by the file path does
	    not exist.
	    IOError: If there is an error while reading the file.

	Example:
	    ASCII art file: /path/to/avatar.asc

	    >>> get_assistant_avatar()
	    'ASCII ART CONTENTS'
	"""
	# Specify the path of the env file containing the variables
	file_path = os.environ["COMMBASE_APP_DIR"] + '/assets/ascii/avatar.asc'
	file_variable = ""

	# Open the file in read mode
	with open(file_path, "r") as file:
		# Read the entire contents of the file
		file_variable = file.read()

	# Return the variable with the file contents
	return file_variable
