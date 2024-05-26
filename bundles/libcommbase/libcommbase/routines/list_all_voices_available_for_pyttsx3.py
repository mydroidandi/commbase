#!/usr/bin/env python
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
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

# list_all_voices_available_for_pyttsx3.py
# Creates a temporary file containing information about available voices using
# the create_temp_file() function and opens the temporary file in the 'nano'
# text editor using the open_temp_file_in_nano() function.
# In MS Windows, it requires the package pypiwin32 to access the native Windows
# speech API.

# Imports
import pyttsx3
import subprocess
import tempfile

engine = pyttsx3.init()
voices = engine.getProperty("voices")


def create_temp_file():
    """
    Create a temporary file to store information about available voices.

    This function creates a temporary file using the `tempfile.NamedTemporaryFile`
    function in write mode. It iterates over the available voices and writes
    information about each voice, including its ID, name, languages, gender, age,
    and index, to the temporary file. Finally, it returns the temporary file object.

    Returns:
        tempfile.NamedTemporaryFile: A temporary file object containing information
        about available voices.
    """
    with tempfile.NamedTemporaryFile(mode="w", delete=False) as temp_file:
        # Write all available voices to the temporary file
        for idx, voice in enumerate(voices):
            temp_file.write("Voice:\n")
            temp_file.write(" - ID: %s\n" % voice.id)
            temp_file.write(" - Name: %s\n" % voice.name)
            temp_file.write(" - Languages: %s\n" % voice.languages)
            temp_file.write(" - Gender: %s\n" % voice.gender)
            temp_file.write(" - Age: %s\n" % voice.age)
            temp_file.write(" - Index: %s\n" % idx)
    return temp_file


def open_temp_file_in_nano(temp_file):
    """
    Opens the temporary file using the nano text editor.

    Parameters:
        temp_file (file object): The temporary file to be opened.

    Returns:
        None
   """
    subprocess.run(["less", temp_file.name])


def main():
    """
    Main function to execute the program.

    Parameters:
        None

    Returns:
        None
    """
    temp_file = create_temp_file()
    open_temp_file_in_nano(temp_file)


# Ensure that the main() function is executed only when the script is run
# directly as the main program.
if __name__ == '__main__':
    main()
