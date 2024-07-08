#!/usr/bin/env python
################################################################################
#                  commbase-genai-slm-ollama-phi3-mini-memory                  #
#                                                                              #
# A sophisticated AI assistant's Small Language Model (Phi3), enhanced by      #
# Retrieval-Augmented Generation (RAG) for improved response accuracy, and     #
# supported by a Picone semantic vector database.                              #
#                                                                              #
# Change History                                                               #
# 06/26/2024  Esteban Herrera Original code.                                   #
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

# commbase-genai-slm-ollama-phi3-mini-memory.py
# Interacts with the Commbase platform by generating AI-driven responses using
# the Ollama API with the 'commbase-phi3-mini' model. The chat memory
# management workflow ensures that the history of prompts and responses is
# preserved across interactions. This approach allows the AI model to generate
# more relevant and context-aware responses.

# Imports
from datetime import datetime
import ollama
import os
import subprocess
import sys
from file_paths import (
    get_assistant_discourse_from_language_model_file,
    get_chat_log_file,
    get_chat_memory_file,
    get_run_voice_recorder_in_pane_path,
    get_stt_engine_path
)
from functions import (
    get_audible_assistant_logging_on,
    get_chat_participant_names,
    get_commbase_recorder_transmitter_quit_char,
    get_commbase_stt_whisper_reactive_p_auto_open_recorder_after_command,
    get_log_severity_level_1
)

# Set the values returned by get_chat_memory_file()
memory_file = get_chat_memory_file()


def read_memory(file_path):
    """
    Reads chat memory from a file.

    This function checks if the specified file exists. If the file exists,
    it opens the file in read mode and reads its contents, which it then
    returns as a string. If the file does not exist, the function returns
    an empty string.

    Args:
        file_path (str): The path to the file from which to read the chat
        memory.

    Returns:
        str: The contents of the file as a string if the file exists, otherwise
        an empty string.
    """
    if os.path.exists(file_path):
        with open(file_path, 'r') as file:
            return file.read()
    # If the file does not exist, return an empty string
    return ""


def append_memory(file_path, memory):
    """
    Appends chat memory to a file.

    This function opens the specified file in append mode and appends the
    provided memory string followed by a newline character to it. If the file
    does not exist, it will be created.

    Args:
        file_path (str): The path to the file where the chat memory will be
        appended.
        memory (str): The chat memory to be appended to the file.

    Returns:
        None
    """
    with open(file_path, 'a') as file:
        file.write(memory + "\n")


def check_arguments():
    """
    Checks if the script received the correct number of arguments.

    This function ensures that exactly one argument (the prompt) is passed to
    the script.
    If the number of arguments is incorrect, it prints the usage instructions
    and exits the program.

    Raises:
        SystemExit: If the number of arguments is not equal to 2.
    """
    if len(sys.argv) != 2:
        print("Usage: python commbase-genai-slm-ollama-phi3-mini-memory.py \"Your prompt here\"")
        sys.exit(1)


def get_new_prompt():
    """
    Retrieves the user-provided prompt from the command line arguments.

    This function extracts the prompt passed as the first argument to the
    script.
    It assumes that the arguments have already been checked for correctness
    by another function.

    Returns:
        str: The user-provided prompt.
    """
    new_prompt = sys.argv[1]
    return new_prompt


def read_existing_chat_memory(memory_file):
    """
    Reads the existing chat memory from a file.

    This function reads the contents of the specified chat memory file
    using the `read_memory` function and returns it as a string.

    Args:
        memory_file (str): The path to the file from which to read the existing
        chat memory.

    Returns:
        str: The contents of the chat memory file as a string.
    """
    memory = read_memory(memory_file)
    return memory


def append_new_prompt_to_chat_memory(memory, new_prompt):
    """
    Appends the new prompt to the existing chat memory.

    This function takes the current chat memory and a new prompt, and appends
    the new prompt to the memory. If the memory is empty, it initializes it
    with the new prompt.

    Args:
        memory (str): The existing chat memory as a string.
        new_prompt (str): The new prompt to append to the chat memory.

    Returns:
        str: The updated chat memory with the new prompt appended.
    """
    if memory:
        memory += "\n" + new_prompt
    else:
        memory = new_prompt

    return memory


def generate_response(memory):
    """
    Generates a response using the provided prompt and the commbase-phi3-mini
    model.

    This function sends the user-provided prompt to the Ollama API, using the
    'commbase-phi3-mini' model to generate a response. The function then
    extracts and returns the text response from the API's response dictionary.

    Args:
        prompt (str): The user-provided prompt to generate a response for.

    Returns:
        str: The generated text response from the model.
    """
    response = ollama.generate(model='commbase-phi3-mini', prompt=memory)
    return response['response']


def append_response_to_chat_memory(response, memory):
    """
    Appends the generated response to the existing chat memory.

    This function takes the generated response and appends it to the current
    chat memory. The response is added as a new line at the end of the existing
    memory.

    Args:
        response (str): The generated response from the AI model to be
        appended.
        memory (str): The existing chat memory to which the response will be
        appended.

    Returns:
        str: The updated chat memory with the new response appended at the end.
    """
    # Extract the response
    text_response = response

    # Append the response to the chat memory
    memory += "\n" + text_response
    return memory


def print_response(response):
    """
    Logs a response from an assistant or system to a specified log file.

    Args:
    - response (str): The response message to log.

    Returns:
    None

    Description:
    This function logs the given response message along with current timestamp,
    severity level, and system identifier to a designated log file. The
    severity level is obtained from `get_log_severity_level_1()` function. The
    logged format is: "[YYYY-MM-DD HH:MM:SS] phi-mini-nomemory:
    <severity_level>: <response>\n".
    The logged message is appended to the file specified by `temp_file_path`.

    Notes:
    - Ensure `get_log_severity_level_1()` returns an appropriate severity level
    string.
    - `temp_file_path` should point to the file where the logs are to be
    appended.
    """
    current_timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # Set the value returned by get_log_severity_level_1()
    log_severity_level_1 = get_log_severity_level_1()

    # Set the values returned by get_chat_participant_names()
    end_user_name, assistant_name = get_chat_participant_names()

    # A temporary file path
    temp_file_path = get_chat_log_file()

    severity_level = log_severity_level_1
    assistant_text = "[" + current_timestamp + "]" + " phi3-mini-memory: " + severity_level + ": " + assistant_name + response + "\n"
    with open(temp_file_path, 'a') as temp_file:
        temp_file.write(assistant_text)


def text_to_speech(window_number, pane_number, time):
    """
    Sends a command to tmux to open a language model discourse in a specified
    tmux window and pane, allowing text-to-speech synthesis.

    Args:
    - window_number (int): The number of the tmux window to select.
    - pane_number (int): The number of the tmux pane to select.
    - time (int or float): Time in seconds to wait after sending the command.

    Returns:
    None

    Notes:
    - Requires tmux to be installed and accessible from the command line.
    - Uses subprocess module to execute tmux commands.

    Example:
    >>> text_to_speech(1, 0, 2)
    This will select window 1, pane 0 in tmux, send a clear and bash command
    to run the language model discourse, and wait for 2 seconds before
    returning.
    """
    # Set the value returned by get_stt_engine_path()
    stt_engine_path = get_stt_engine_path()

    # Set the value returned by get_commbase_recorder_transmitter_quit_char()
    quit_char = get_commbase_recorder_transmitter_quit_char()

    # Set the value returned by get_assistant_discourse_from_language_model_file()
    assistant_discourse_from_language_model = get_assistant_discourse_from_language_model_file()

    # Set the value returned by get_commbase_stt_whisper_reactive_p_auto_open_recorder_after_command()
    auto_open_recorder_after_command = get_commbase_stt_whisper_reactive_p_auto_open_recorder_after_command()

    # Set the value returned by get_run_voice_recorder_in_pane()
    run_voice_recorder_in_pane_path = get_run_voice_recorder_in_pane_path()

    # run_voice_recorder_in_pane_routine_pane = 7
    run_voice_recorder_in_pane_routine_pane = pane_number

    # If the STT engine is Whisper reactive, attempt to close the
    # recorder-transmitter app.
    if stt_engine_path == "$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-reactive-p/commbase_stt_whisper_reactive_p.py":
        # Construct the tmux command
        command = (
            f"tmux select-window -t {window_number} && "
            f"tmux select-pane -t {pane_number} && "
            f"tmux send-keys \'{quit_char}; clear\' C-m && "
            f"sleep {time}"
        )

        # Execute the command
        subprocess.run(command, shell=True, check=True)  # Do not manage errors here or the script will fail

    # Make the assistant speak out loud the language model response
    # Construct the tmux command
    command = (
        f"tmux select-window -t {window_number} && "
        f"tmux select-pane -t {pane_number} && "
        f"tmux send-keys \'clear; bash {assistant_discourse_from_language_model}\' C-m && "
        f"sleep {time}"
    )

    # Execute the command
    subprocess.run(command, shell=True, check=True)  # Do not manage errors here or the script will fail

    # If the Whisper reactive STT Engine is set up to reopen the recorder after
    # any command, just do it.
    if auto_open_recorder_after_command == "True":
        # If the STT engine is Whisper reactive, reopen the
        # recorder-transmitter app.
        if stt_engine_path == "$COMMBASE_APP_DIR/bundles/commbase-stt-whisper-reactive-p/commbase_stt_whisper_reactive_p.py":
            # Construct the tmux command
            command = (
                f"tmux select-window -t {window_number} && "
                f"tmux select-pane -t {pane_number} && "
                f"tmux send-keys \'clear; bash {run_voice_recorder_in_pane_path} {run_voice_recorder_in_pane_routine_pane}\' C-m && "
                f"sleep {time}"
            )

        # Execute the command
        subprocess.run(command, shell=True, check=True)  # Do not manage errors here or the script will fail


def main():
    """
    Executes the main functionality of the script:
    - Checks command line arguments to ensure correct usage.
    - Retrieves the user-provided prompt.
    - Reads existing chat memory from a file.
    - Appends the new prompt to the chat memory.
    - Generates a response using the commbase-phi3-mini model via the Ollama
    API.
    - Appends the current prompt and response to the chat memory file.
    - Logs the generated response to a designated log file with timestamp and
    severity level.
    - Initiates text-to-speech synthesis of the response in a specific tmux
    window and pane.

    Args:
    None

    Returns:
    None

    Notes:
    - Requires the Ollama API, tmux, and other dependencies as specified.
    - Uses functions from 'file_paths' and 'functions' modules for file paths
    and helper functions.
    - Assumes correct configuration and availability of the tmux session.
    - Each function is called only once, and their return values are stored in
    variables to be used in subsequent steps.

    Example:
    >>> main()
    This will execute the main functionality of the script, including response
    generation, logging, and text-to-speech synthesis in the specified tmux
    window and pane.
    """
    # Set the value returned by get_audible_assistant_logging_on()
    audible_assistant_logging_on = get_audible_assistant_logging_on()

    # Ensure the script has the correct number of arguments
    check_arguments()

    # Retrieve the new prompt
    new_prompt = get_new_prompt()

    # Read the existing chat memory
    memory = read_existing_chat_memory(memory_file)

    # Append the new prompt to the chat memory
    updated_memory = append_new_prompt_to_chat_memory(memory, new_prompt)

    # Generate a response based on the updated memory
    response = generate_response(updated_memory)

    # Append the current prompt and response to the chat memory
    current_memory = f"{new_prompt}\n{response}"
    append_memory(memory_file, current_memory)

    # Print the response
    print_response(response)

    # If audible assistant logging is enabled, use text-to-speech
    if audible_assistant_logging_on == "True":
        text_to_speech(1, 7, 0.1)


if __name__ == "__main__":
    main()
