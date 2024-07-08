#!/usr/bin/env python
################################################################################
#                    commbase-slm-ollama-phi3-mini-nomemory                    #
#                                                                              #
# A simple generative AI assistant using the Phi3 Small Language Model (SLM).  #
#                                                                              #
# Change History                                                               #
# 06/18/2024  Esteban Herrera Original code.                                   #
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

# commbase-genai-slm-ollama-phi3-mini-nomemory.py
# Interacts with the Commbase platform by generating AI-driven responses using
# the Ollama API with the 'commbase-phi3-mini' model.

# Imports
from datetime import datetime
import ollama
import os
import subprocess
import sys
from file_paths import (
    get_assistant_discourse_from_language_model_file,
    get_chat_log_file,
    get_commbase_hardware_command_random_negative_file,
    get_commbase_hardware_command_random_neutral_file,
    get_commbase_hardware_command_random_positive_file,
    get_commbase_hardware_device_0,
    get_run_voice_recorder_in_pane_path,
    get_stt_engine_path
)
from functions import (
    get_assistant_response_sentiment_analysis_on,
    get_audible_assistant_logging_on,
    get_chat_participant_names,
    get_commbase_hardware_notifications_on,
    get_commbase_recorder_transmitter_quit_char,
    get_commbase_stt_whisper_reactive_p_auto_open_recorder_after_command,
    get_log_severity_level_1
)


def notify_hardware_about_negative_sentiment_action():
    """
    Notifies the hardware about the start of the negative sentiment action.

    This function sends a signal to the hardware to indicate that the negative
    sentiment action has started. It constructs a command to be executed, which
    involves reading a command from a file and redirecting its output to a
    hardware device. If the hardware is connected and accessible, the command
    is executed successfully.

    Returns:
        None

    Raises:
        subprocess.CalledProcessError: If the subprocess command fails.
        Exception: If any other error occurs during the execution.

    Note:
        Ensure that the paths retrieved by
        `get_commbase_hardware_command_processing_start_file()` and
        `get_commbase_hardware_device_0()` functions are correctly configured.
    """
    # Define the paths
    hardware_command = get_commbase_hardware_command_random_negative_file()
    hardware_device = get_commbase_hardware_device_0()

    # If any hardware is connected to the device
    if os.path.exists(hardware_device):

        try:
            # Construct the command and its arguments
            command = ['cat', hardware_command]
            redirect_to_device = ['>', hardware_device]

            # Run the command
            subprocess.run(command + redirect_to_device, check=True)
            for item in command:
                print(item, end=' ')

        except subprocess.CalledProcessError as e:
            print(f"Error executing subprocess command: {e}")
        except Exception as e:
            print(f"Other error occurred: {e}")
            # discourse_data_exchange_client_error()
    else:
        print(f"The device file {hardware_device} does not exist, or it is not connected.")


def notify_hardware_about_neutral_sentiment_action():
    """
    Notifies the hardware about the start of the neutral sentiment action.

    This function sends a signal to the hardware to indicate that the neutral
    sentiment action has started. It constructs a command to be executed, which
    involves reading a command from a file and redirecting its output to a
    hardware device. If the hardware is connected and accessible, the command
    is executed successfully.

    Returns:
        None

    Raises:
        subprocess.CalledProcessError: If the subprocess command fails.
        Exception: If any other error occurs during the execution.

    Note:
        Ensure that the paths retrieved by
        `get_commbase_hardware_command_processing_start_file()` and
        `get_commbase_hardware_device_0()` functions are correctly configured.
    """
    # Define the paths
    hardware_command = get_commbase_hardware_command_random_neutral_file()
    hardware_device = get_commbase_hardware_device_0()

    # If any hardware is connected to the device
    if os.path.exists(hardware_device):

        try:
            # Construct the command and its arguments
            command = ['cat', hardware_command]
            redirect_to_device = ['>', hardware_device]

            # Run the command
            subprocess.run(command + redirect_to_device, check=True)
            for item in command:
                print(item, end=' ')

        except subprocess.CalledProcessError as e:
            print(f"Error executing subprocess command: {e}")
        except Exception as e:
            print(f"Other error occurred: {e}")
            # discourse_data_exchange_client_error()
    else:
        print(f"The device file {hardware_device} does not exist, or it is not connected.")


def notify_hardware_about_positive_sentiment_action():
    """
    Notifies the hardware about the start of the positive sentiment action.

    This function sends a signal to the hardware to indicate that the positive
    sentiment action has started. It constructs a command to be executed, which
    involves reading a command from a file and redirecting its output to a
    hardware device. If the hardware is connected and accessible, the command
    is executed successfully.

    Returns:
        None

    Raises:
        subprocess.CalledProcessError: If the subprocess command fails.
        Exception: If any other error occurs during the execution.

    Note:
        Ensure that the paths retrieved by
        `get_commbase_hardware_command_processing_start_file()` and
        `get_commbase_hardware_device_0()` functions are correctly configured.
    """
    # Define the paths
    hardware_command = get_commbase_hardware_command_random_positive_file()
    hardware_device = get_commbase_hardware_device_0()

    # If any hardware is connected to the device
    if os.path.exists(hardware_device):

        try:
            # Construct the command and its arguments
            command = ['cat', hardware_command]
            redirect_to_device = ['>', hardware_device]

            # Run the command
            subprocess.run(command + redirect_to_device, check=True)
            for item in command:
                print(item, end=' ')

        except subprocess.CalledProcessError as e:
            print(f"Error executing subprocess command: {e}")
        except Exception as e:
            print(f"Other error occurred: {e}")
            # discourse_data_exchange_client_error()
    else:
        print(f"The device file {hardware_device} does not exist, or it is not connected.")


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
        print("Usage: python commbase-genai-slm-ollama-phi3-mini-nomemory.py \"Your prompt here\"")
        sys.exit(1)


def get_prompt():
    """
    Retrieves the user-provided prompt from the command line arguments.

    This function extracts the prompt passed as the first argument to the
    script.
    It assumes that the arguments have already been checked for correctness
    by another function.

    Returns:
        str: The user-provided prompt.
    """
    return sys.argv[1]


def generate_response(prompt):
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
    response = ollama.generate(model='commbase-phi3-mini', prompt=prompt)
    return response['response']


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

    severity_level = log_severity_level_1

    # Set the values returned by get_chat_participant_names()
    end_user_name, assistant_name = get_chat_participant_names()

    # A temporary file path
    temp_file_path = get_chat_log_file()

    assistant_text = "[" + current_timestamp + "]" + " phi3-mini-nomemory: " + severity_level + ": " + assistant_name + response + "\n"
    with open(temp_file_path, 'a') as temp_file:
        temp_file.write(assistant_text)


def response_sentiment_action(response):
    """
    Analyzes the sentiment of a given response and triggers appropriate
    hardware actions based on the sentiment.

    Parameters:
    response (str): The input text whose sentiment needs to be analyzed.

    The function uses a sentiment analysis pipeline from the transformers
    library to classify the sentiment of the input text as either 'POSITIVE',
    'NEGATIVE', or 'NEUTRAL'. Depending on the classification, it triggers one
    of three hardware notification functions:
        - notify_hardware_about_positive_sentiment_action() for positive sentiments
        - notify_hardware_about_negative_sentiment_action() for negative sentiments
        - notify_hardware_about_neutral_sentiment_action() for neutral sentiments

    Returns:
    None
    """
    from transformers import pipeline

    classifier = pipeline("sentiment-analysis")

    json_response = classifier(response)  # [{'label': 'POSITIVE', 'score': 0.9998795986175537}]

    # Extract values
    label = json_response[0]['label']

    if label == "POSITIVE":
        notify_hardware_about_positive_sentiment_action()
    elif label == "NEGATIVE":
        notify_hardware_about_negative_sentiment_action()
    else:
        notify_hardware_about_neutral_sentiment_action()


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
    - Generates a response using the commbase-phi3-mini model via the Ollama
    API.
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

    Example:
    >>> main()
    This will execute the main functionality of the script, including response
    generation, logging, and text-to-speech synthesis in the specified tmux
    window and pane.
    """
    # Set the value returned by et_assistant_response_sentiment_analysis_on()
    assistant_response_sentiment_analysis_on = get_assistant_response_sentiment_analysis_on()

    # Set the value returned by get_audible_assistant_logging_on()
    audible_assistant_logging_on = get_audible_assistant_logging_on()

    # Set the value returned by get_commbase_hardware_notifications_on()
    commbase_hardware_notifications_on = get_commbase_hardware_notifications_on()

    check_arguments()
    prompt = get_prompt()
    response = generate_response(prompt)
    print_response(response)
    if commbase_hardware_notifications_on == "True":
        if assistant_response_sentiment_analysis_on == "True":
            response_sentiment_action(response)
    if audible_assistant_logging_on == "True":
        text_to_speech(1, 7, 0.1)


if __name__ == "__main__":
    main()
