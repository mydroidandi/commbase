#!/usr/bin/env python
################################################################################
#                         commbase-stt-whisper-remote-p                        #
#                                                                              #
# An ASR (Automatic Speech Recognition) engine.                                #
#                                                                              #
# Change History                                                               #
# 02/29/2024  Esteban Herrera Original code.                                   #
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

# commbase-stt-whisper-remote-p.py
# Waits for the arrival of a WAV audio file, transcribes its content using the
# Whisper library, and then writes the transcribed text to a temporary file.
# Requires the Whisper model used in the code. The first execution of the
# program downloads it automatically.
# Requires to run redirecting the standard error output (stderr) to the null
# device (/dev/null) like this to avoid ALSA output messages:
# shell> python commbase_stt_whisper_p.py 2>& /dev/null

# Imports
import io
import os
import time
import tempfile
import whisper

from config import CONFIG_FILE_PATH
from file_paths import get_chat_log_file
from pydub import AudioSegment

# A temporary directory
temp_file = tempfile.mkdtemp()

# A temporary file path
temp_file_path = get_chat_log_file()


def wait_for_wav_file(file_path, timeout=30):
    """
    Waits for the arrival of a WAV file at the specified location.

    Parameters:
    - file_path (str): The path to the WAV file.
    - timeout (int): The maximum time to wait for the file (in seconds).

    Returns:
    - bool: True if the file is found within the timeout, False otherwise.
    """
    start_time = time.time()

    while time.time() - start_time < timeout:
        if os.path.exists(file_path):
            return True
        time.sleep(1)

    return False


def recognize_audio(file_path):
    """
    Uses the Whisper library to load a pre-trained audio recognition model and
    transcribes an audio file located at file_path using that model.

    Parameters:
    - file_path (str): The path to the audio file for transcription.

    Returns:
    - str: The transcribed text extracted from the transcription result.
    """
    audio_model = whisper.load_model('base')
    transcription = audio_model.transcribe(file_path, language='english', fp16=False)
    return transcription['text']


def write_to_temp_file(text):
    """
    Appends the provided text to a temporary file, prefixed with 'END USER:'.

    Parameters:
    - text (str): The text to be appended to the temporary file.

    Example:
    >>> write_to_temp_file("Hello, this is a user message.")
    """
    end_user_text = "END USER:" + text + "\n"
    with open(temp_file_path, 'a') as temp_file:
        temp_file.write(end_user_text)


def close_temp_file():
    """
    Removes a temporary file if it exists.
    """
    if os.path.exists(temp_file_path):
        os.remove(temp_file_path)


def main():
    try:
        while True:
            # Wait for the WAV file to arrive
            print("ASSISTANT: Waiting for the WAV file...")

            # Replace the placeholder with the actual path to your external WAV file
            external_wav_path = "/home/commbase/Dev/mydroidandi/commbase/bundles/commbase-stt-whisper-remote-p/recording.wav"

            if wait_for_wav_file(external_wav_path):
                response = recognize_audio(external_wav_path)
                print(f"END USER: {response}")

                # Write the transcribed text to a temporary file
                write_to_temp_file(response)
            else:
                print("ASSISTANT: Timeout waiting for the WAV file.")
                break  # exit the loop on timeout
    finally:
        # Ensure the temporary file is closed and cleaned up
        close_temp_file()


if __name__ == '__main__':
    main()
