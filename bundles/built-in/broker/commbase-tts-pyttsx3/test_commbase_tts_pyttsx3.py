#!/usr/bin/env python
################################################################################
#                            commbase_tts_pyttsx3.py                           #
#                                                                              #
# Command-line application that transforms written text into spoken words      #
#                                                                              #
# Change History                                                               #
# 10/06/2023  Esteban Herrera Original code.                                   #
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

# test_commbase_tts_pyttsx3.py
# Test file for the script commbase_tts_pyttsx3.py

import os
import pytest
import tempfile
from commbase_tts_pyttsx3 import TextToSpeech


# Create a fixture to set up the TextToSpeech object
@pytest.fixture
def text_to_speech_instance():
    """
    Fixture to create an instance of the TextToSpeech class for testing.
    """
    tts = TextToSpeech()
    return tts


def test_read_file_not_found(text_to_speech_instance):
    """
    Test whether the read_file method raises FileNotFoundError for a non-
    existent file.
    """
    with pytest.raises(FileNotFoundError):
        text_to_speech_instance.read_file("non_existent_file.txt")


def test_read_file_io_error(text_to_speech_instance):
    """
    Test whether the read_file method raises IOError for an unreadable file.
    """
    with pytest.raises(IOError):
        text_to_speech_instance.read_file("/root/unreadable_file.txt")


def test_read_file_success(text_to_speech_instance):
    """
    Test whether the read_file method successfully reads the content of an
    existing file.
    """
    # Create a temporary file with the desired content
    with tempfile.NamedTemporaryFile(mode='w', delete=False) as temp_file:
        temp_file.write("Hello, World!")

    try:
        # Get the temporary file path and pass it to the read_file method
        temp_file_path = temp_file.name
        content = text_to_speech_instance.read_file(temp_file_path)
        assert content == "Hello, World!"
    finally:
        # Clean up by deleting the temporary file
        if temp_file_path:
            os.remove(temp_file_path)


def test_set_up_text_to_speech(text_to_speech_instance):
    """Test the set_up_text_to_speech method."""
    text_to_speech_instance.set_up_text_to_speech(rate=100, voice_index=1)
    assert text_to_speech_instance.engine is not None
    assert text_to_speech_instance.voices is not None


def test_talk_with_input(text_to_speech_instance, capsys):
    """Test the talk method with input."""
    text_to_speech_instance.set_up_text_to_speech(rate=100, voice_index=1)
    text_to_speech_instance.talk("Hello, this is a test input.")

    captured = capsys.readouterr()
    assert captured.out.strip() == ""
