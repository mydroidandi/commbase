#!/usr/bin/env python
################################################################################
#                  commbase-genai-slm-ollama-phi3-mini-memory                  #
#                                                                              #
# A midweight implementation of the AI assistant's Small Language Model        #
# (Phi3), with session or short-term memory for language generation.           #
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

# commbase_genai_slm_ollama_phi3_mini_memory.py
# Interacts with the Commbase platform by generating AI-driven responses using
# the Ollama API with the 'commbase-phi3-mini' model. The chat memory
# management workflow ensures that the history of prompts and responses is
# preserved across interactions. This approach allows the AI model to generate
# more relevant and context-aware responses.

# Standard library
from datetime import datetime
import os
import subprocess
import sys

# Third-party
import ollama
from transformers import pipeline

# Local application/library-specific
from file_paths import (
    get_assistant_discourse_from_language_model_file,
    get_chat_log_file,
    get_chat_memory_file,
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
    get_chatroom_paragraphs_format,
    get_commbase_hardware_notifications_on,
    get_commbase_recorder_transmitter_quit_char,
    get_commbase_stt_whisper_reactive_p_auto_open_recorder_after_command,
    get_log_severity_level_1,
    get_slm_ms_phi3_mini_sentiment_analysis_model,
    get_stt_engine_language
)
from phi3_mini_translate_language import generate_translation

# Set the values returned by get_chat_memory_file()
memory_file = get_chat_memory_file()


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
        print(f"The device file {hardware_device} does not exist, or it is not connected. Sentiment: Negative.")


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
        print(f"The device file {hardware_device} does not exist, or it is not connected. Sentiment: Neutral.")


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
        print(f"The device file {hardware_device} does not exist, or it is not connected. Sentiment: Positive.")


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
    # Strip leading/trailing whitespace from memory
    memory = memory.strip()

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
    # Directly read the memory from the file without additional processing to
    # save resources.
    # memory = read_memory(memory_file)

    # If needed to strip leading/trailing whitespace from each line and join
    # them, uncomment the next two lines:
    lines = read_memory(memory_file)
    memory = "\n".join(line.strip() for line in lines)

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
    # Strip leading/trailing whitespace from both memory and new_prompt
    memory = memory.strip()
    new_prompt = new_prompt.strip()

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
    # return response['response']
    return response['response'].strip()


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
    # Strip leading/trailing whitespace from both memory and response
    memory = memory.strip()
    response = response.strip()

    # Extract the response
    text_response = response

    # Append the response to the chat memory
    memory += "\n" + text_response
    return memory


def print_response(response):
    """
    Processes and logs a given response into a specified file format.

    This function takes a response string, formats it according to the chatroom
    paragraph format setting, and appends it to a log file with a timestamp,
    severity level, and participant name. The formatting includes handling
    paragraph delimiters and writing to the log file based on the specified
    format.

    Parameters:
    - response (str): The response text to be formatted and logged.

    Returns:
    - int: The total number of paragraphs processed from the response.

    Processing Steps:
    1. Get the current timestamp in 'YYYY-MM-DD HH:MM:SS' format.
    2. Retrieve the log severity level and chat participant names.
    3. Obtain the path for the log file and the chatroom paragraph format
       setting.
    4. Split the response into paragraphs based on double or single newline
       characters.
    5. Format each paragraph by replacing newlines with spaces and stripping
       whitespace.
    6. Format the paragraphs according to the specified chatroom format:
        - "single_paragraphs_string": All paragraphs are joined into a single
        string.
        - "one_participant_per_paragraph": Each paragraph is formatted
        individually.
    7. Append the formatted text to the log file.
    8. Return the total number of paragraphs.

    File Operations:
    - Appends the formatted text to the log file specified by
    `get_chat_log_file()`.

    Notes:
    - The function uses helper functions `get_log_severity_level_1()`,
    `get_chat_participant_names()`, `get_chat_log_file()`, and
    `get_chatroom_paragraphs_format()` to obtain necessary information.
    - The actual formatting and writing to the file depend on the chatroom
    paragraph format setting.
    """
    current_timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # Set the value returned by get_log_severity_level_1()
    log_severity_level_1 = get_log_severity_level_1()
    severity_level = log_severity_level_1

    # Set the values returned by get_chat_participant_names()
    end_user_name, assistant_name = get_chat_participant_names()

    # A temporary file path
    temp_file_path = get_chat_log_file()

    # Set the value returned by get_chatroom_paragraphs_format()
    chatroom_paragraphs_format = get_chatroom_paragraphs_format()

    # Split the response using double newline characters. If the response isn't
    # split into multiple parts (indicating the absence of double newlines), it
    # then splits the response using single newline characters. This approach
    # should better handle different paragraph delimiters and ensure each
    # paragraph is correctly formatted and logged.
    paragraphs_list = response.strip().split("\n\n")
    if len(paragraphs_list) == 1:
        paragraphs_list = response.strip().split("\n")

    # Debug: Print split paragraphs
    # print("Split paragraphs:", paragraphs_list)

    # Process each paragraph: replace newlines with spaces, strip whitespace,
    # and join non-empty paragraphs with a single space.
    non_empty_paragraphs = " ".join(response.replace("\n", " ").strip() for response in paragraphs_list if response.strip())

    # Debug: Print non-empty paragraphs
    # print("Non-empty paragraphs:", non_empty_paragraphs)

    # Count total paragraphs
    total_paragraphs = len(paragraphs_list)

    # Initialize a list to store formatted paragraphs
    formatted_paragraphs = []

    if chatroom_paragraphs_format == "single_paragraphs_string":
        # Join paragraphs into a single string without numbering
        assistant_text = "[" + current_timestamp + "]" + " phi3-mini-nomemory: " + severity_level + ": " + assistant_name + " " + non_empty_paragraphs + "\n"
        formatted_paragraphs.append(assistant_text)

        # Join all formatted paragraphs into a single string
        assistant_text = "".join(formatted_paragraphs)

        # Write the formatted text to the log file
        with open(temp_file_path, 'a') as temp_file:
            temp_file.write(assistant_text)

    if chatroom_paragraphs_format == "one_participant_per_paragraph":
        for index, paragraph in enumerate(paragraphs_list, start=1):
            # Format each paragraph individually
            formatted_paragraph = (
                f"[{current_timestamp}] phi3-mini-nomemory: {severity_level}: {assistant_name} "
                # f"{index}. {paragraph.strip()}\n"
                f"{paragraph.strip()}\n"
            )
            formatted_paragraphs.append(formatted_paragraph)

        # Debug: Print formatted paragraphs
        # print("Formatted paragraphs:", formatted_paragraphs)

        # Write each formatted paragraph to the log file individually
        with open(temp_file_path, 'a') as temp_file:
            for formatted_paragraph in formatted_paragraphs:
                temp_file.write(formatted_paragraph)

    return total_paragraphs


def response_sentiment_action(response):
    """
    Analyzes the sentiment of a given response and triggers appropriate
    hardware actions based on the sentiment.

    Parameters:
    - response (str): The input text whose sentiment needs to be analyzed.

    Description:
    This function uses a sentiment analysis pipeline from the transformers
    library to classify the sentiment of the input text as either 'POSITIVE',
    'NEGATIVE', or 'NEUTRAL'. Depending on the classification, it triggers one
    of three hardware notification functions:
        - `notify_hardware_about_positive_sentiment_action()` for positive
          sentiments.
        - `notify_hardware_about_negative_sentiment_action()` for negative
          sentiments.
        - `notify_hardware_about_neutral_sentiment_action()` for neutral
          sentiments.

    The function uses the "distilbert/distilbert-base-uncased-finetuned-sst-2-english"
    model for sentiment analysis. The sentiment label is extracted from the
    model's output and the appropriate hardware action is triggered based on
    the label.

    Returns:
    None

    Example:
    >>> response_sentiment_action("I am very happy with the service.")
    """
    # Load the topic classification model
    # Set the value returned by get_slm_ms_phi3_mini_sentiment_analysis_model()
    model_id = get_slm_ms_phi3_mini_sentiment_analysis_model()

    # Sentiment pipe
    classifier = pipeline("sentiment-analysis", model=model_id)

    json_response = classifier(response)  # [{'label': 'POSITIVE', 'score': 0.9998795986175537}]

    # Extract values
    label = json_response[0]['label']

    if label == "POSITIVE":
        notify_hardware_about_positive_sentiment_action()
    elif label == "NEGATIVE":
        notify_hardware_about_negative_sentiment_action()
    else:
        notify_hardware_about_neutral_sentiment_action()


def text_to_speech(window_number, pane_number, time, returned_total_paragraphs):
    """
    Sends a command to tmux to open a language model discourse in a specified
    tmux window and pane, allowing text-to-speech synthesis.

    Args:
    - window_number (int): The number of the tmux window to select.
    - pane_number (int): The number of the tmux pane to select.
    - time (int or float): Time in seconds to wait after sending the command.
    - returned_total_paragraphs (int): The total number of paragraphs returned
    by the language model.

    Returns:
    None

    Description:
    This function interacts with tmux to control windows and panes for
    executing text-to-speech synthesis using a language model. It performs the
    following steps:
    1. Selects the specified tmux window and pane.
    2. If the STT engine is Whisper reactive, it attempts to close the
       recorder-transmitter app.
    3. Sends a command to run the language model discourse and waits for the
       specified time.
    4. If configured, reopens the recorder-transmitter app after running the
       command.

    Notes:
    - Requires tmux to be installed and accessible from the command line.
    - Uses the subprocess module to execute tmux commands.
    - Ensure that the necessary paths and configurations are correctly set by
      the helper functions (`get_stt_engine_path()`,
      `get_commbase_recorder_transmitter_quit_char()`,
      `get_assistant_discourse_from_language_model_file()`,
      `get_commbase_stt_whisper_reactive_p_auto_open_recorder_after_command()`,
      and `get_run_voice_recorder_in_pane_path()`).

    Example:
    >>> text_to_speech(1, 0, 2, 3)
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
        f"tmux send-keys \'clear; bash {assistant_discourse_from_language_model} {returned_total_paragraphs}\' C-m && "
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
    - Sends hardware notifications if enabled.
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
    - The `combase-phi3-mini` model only supports English for sentiment
    analysis.
    - Hardware notifications can be enabled, which involves translation and
    sentiment analysis of the response.
    - Text-to-speech synthesis is performed in a specific tmux window and pane
    if audible assistant logging is enabled.

    Example:
    >>> main()
    This will execute the main functionality of the script, including response
    generation, logging, and text-to-speech synthesis in the specified tmux
    window and pane.
    """
    # Set the value returned by get_assistant_response_sentiment_analysis_on()
    assistant_response_sentiment_analysis_on = get_assistant_response_sentiment_analysis_on()

    # Set the value returned by get_audible_assistant_logging_on()
    audible_assistant_logging_on = get_audible_assistant_logging_on()

    # Set the value returned by get_commbase_hardware_notifications_on()
    commbase_hardware_notifications_on = get_commbase_hardware_notifications_on()

    # Set the value returned by get_stt_engine_language()
    stt_engine_language = get_stt_engine_language()

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

    # Send hardware notifications if enabled
    if commbase_hardware_notifications_on == "True":
        # Perform sentiment analysis if enabled
        if assistant_response_sentiment_analysis_on == "True":
            # Split the response into a list of words
            words = response.split()

            # Count the number of words
            number_of_words = len(words)

            # Check if the number of words is lower than 175. This threshold is
            # based on the sentiment-analysis token limit of 512 tokens. The
            # calculation is as follows:
            # Token-to-word ratio: 1.2 to 3 tokens per word.
            # 3 (max tokens per word) * 175 (words) = 525 (tokens).
            # For larger texts, consider truncating to process shorter chunks
            # and then combining the results.
            if number_of_words < 175:
                # The to_language parameter will always be English, as it is
                # the only language supported by the Phi3 SLM model and the
                # sentiment analyzer.
                if stt_engine_language.lower() != "english":
                    # Translate the response if the STT engine language is not
                    # English.
                    translated_response = generate_translation(response, stt_engine_language, "English")
                    response_sentiment_action(translated_response)
                else:
                    # No translation needed if the STT engine language is
                    # already English.
                    response_sentiment_action(response)
            else:
                # For text that exceeds the limit, notify hardware to handle
                # neutral sentiment.
                notify_hardware_about_neutral_sentiment_action()

    # Print the response
    returned_total_paragraphs = print_response(response)

    # If audible assistant logging is enabled, use text-to-speech
    if audible_assistant_logging_on == "True":
        text_to_speech(1, 7, 0.1, returned_total_paragraphs)


if __name__ == "__main__":
    main()
