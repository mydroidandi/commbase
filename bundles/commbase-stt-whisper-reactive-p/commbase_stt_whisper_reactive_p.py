#!/usr/bin/env python
################################################################################
#                        commbase-stt-whisper-reactive-p                       #
#                                                                              #
# A reactive version of STT ASR (Automatic Speech Recognition) engine.         #
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

# commbase_stt_whisper_reactive_p.py
# Waits for the arrival of a WAV audio file, transcribes its content using the
# Whisper library, and then writes the transcribed text to a temporary file.
# Requires the Whisper model used in the code. The first execution of the
# program downloads it automatically.

# Imports
import os
import tempfile
import time
import wave
import whisper
from config import CONFIG_FILE_PATH
from file_paths import (
    get_chat_log_file,
    get_commbase_stt_whisper_reactive_p_client_data_file
)
from functions import (
    get_chat_participant_names,
    get_stt_engine_language
)

# A temporary directory and a file path within that directory
temp_file = tempfile.mkdtemp()

# A temporary file path
temp_file_path = get_chat_log_file()

# Variable to store the last modification time
last_modified_time = 0


def recognize_audio(save_path):
    """
    """
    # Set the value returned by get_stt_engine_language()
    stt_engine_language = get_stt_engine_language()
    audio_model = whisper.load_model('base')
    transcription = audio_model.transcribe(save_path, language=stt_engine_language, fp16=False)  # Syntax: language='english'
    return transcription['text']


def write_to_temp_file(text):
    """
    """
    # Set the values returned by get_chat_participant_names()
    end_user_name, assistant_name = get_chat_participant_names()
    end_user_text = end_user_name + text + "\n"
    with open(temp_file_path, 'a') as temp_file:
        temp_file.write(end_user_text)


# Closes the temporary file
def close_temp_file():
    """
    """
    if os.path.exists(temp_file_path):
        os.remove(temp_file_path)


def create_empty_file():
    """
    """
    # Specify the file name and mode ('wb' for write binary)
    file_name = get_commbase_stt_whisper_reactive_p_client_data_file()

    # Open the file in write binary mode
    with wave.open(file_name, 'wb') as wf:
        # Set the audio file parameters
        wf.setnchannels(1)  # 1 channel for mono, 2 for stereo
        wf.setsampwidth(2)  # 2 bytes for 16-bit audio (adjust as needed)
        wf.setframerate(44100)  # Sample rate, e.g., 44100 Hz
        wf.setnframes(0)  # Set the number of frames to 0 for an empty file


def main():
    """
    """
    global last_modified_time

    create_empty_file()

    try:
        while True:
            audio_path = get_commbase_stt_whisper_reactive_p_client_data_file()

            # Set the values returned by get_chat_participant_names()
            end_user_name, assistant_name = get_chat_participant_names()

            # Check if the file has been modified
            current_modified_time = os.path.getmtime(audio_path)
            if current_modified_time != last_modified_time:
                last_modified_time = current_modified_time

                response = recognize_audio(audio_path)
                print(f"{end_user_name} {response}")

                # Write the transcribed text to a temporary file
                write_to_temp_file(response)

            # Sleep for a while before checking again (adjust the time
            # according to your needs)
            time.sleep(1)
    finally:
        # Ensure the temporary file is closed and cleaned up
        close_temp_file()


# Ensure that the main() function is executed only when the script is run
# directly as the main program.
if __name__ == '__main__':
    main()
