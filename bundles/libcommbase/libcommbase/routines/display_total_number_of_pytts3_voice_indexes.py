#!/usr/bin/env python
################################################################################
#                                  libcommbase                                 #
#                                                                              #
# A collection of libraries to centralize common functions that can be shared  #
# across multiple conversational AI assistant projects                         #
#                                                                              #
# Change History                                                               #
# 05/25/2024  Esteban Herrera Original code.                                   #
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

# display_total_number_of_pytts3_voice_indexes.py
# Counts and displays the total number of voices available in the pyttsx3
# library, which can be useful for applications that need to know how many
# different voices are available for text-to-speech operations.

# Imports
import pyttsx3


def count_total_indexes():
    """
    Counts the total number of available voices.

    This function initializes the pyttsx3 engine, retrieves the list of
    available voices, and returns the total number of voices.

    Returns:
        int: The total number of available voices.
    """
    engine = pyttsx3.init()
    voices = engine.getProperty("voices")
    return len(voices)


def main():
    """
    Main function to execute the program.

    Parameters:
        None

    Returns:
        None
    """
    total_indexes = count_total_indexes()
    print(f"Total number of available voice indexes: {total_indexes}")


# Ensure that the main() function is executed only when the script is run
# directly as the main program.
if __name__ == '__main__':
    main()
