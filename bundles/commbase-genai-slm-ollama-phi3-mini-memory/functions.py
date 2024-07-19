#!/usr/bin/env python
################################################################################
#                  commbase-genai-slm-ollama-phi3-mini-memory                  #
#                                                                              #
# A midweight implementation of the AI assistant's Small Language Model        #
# (Phi3), with session or short-term memory for language generation.           #
#                                                                              #
# Change History                                                               #
# 06/25/2024  Esteban Herrera Original code.                                   #
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

# functions.py
# This file contains a collection of utility functions for various tasks. It
# provides a set of commonly used functions related to data manipulation, file
# handling, and mathematical operations.

# Imports
from config import CONFIG_FILE_PATH


def get_assistant_response_sentiment_analysis_on():
    """
    Reads the 'ASSISTANT_RESPONSE_SENTIMENT_ANALYSIS_ON' variable from the
    environment configuration file. Returns the string value of the variables
    if found, or None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    assistant_response_sentiment = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "ASSISTANT_RESPONSE_SENTIMENT_ANALYSIS_ON":
                # Remove the quotes from the value of the variable
                assistant_response_sentiment = value.strip()[1:-1]

    # Check if the variable was found
    if assistant_response_sentiment is not None:
        return assistant_response_sentiment

    # If the variable was not found, return None
    return None


def get_audible_assistant_logging_on():
    """
    Reads the 'AUDIBLE_ASSISTANT_LOGGING_ON' variable from the environment
    configuration file. Returns the string value of the variables if found, or
    None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    audible_assistant_logging_on = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "AUDIBLE_ASSISTANT_LOGGING_ON":
                # Remove the quotes from the value of the variable
                audible_assistant_logging_on = value.strip()[1:-1]

    # Check if the variable was found
    if audible_assistant_logging_on is not None:
        return audible_assistant_logging_on

    # If the variable was not found, return None
    return None


def get_chat_participant_names():
    """
    Gets the chat participant names from the config file.

    Reads the 'ASSISTANT_NAME_IN_CHAT_PANE' and 'END_USER_NAME_IN_CHAT_PANE'
    variables from the environment configuration file. Returns a tuple
    containing the string values of the variables if found, or None if any of
    the variables are not present.

    Returns:
        tuple or None: A tuple containing the assistant, system, and end user
        names in the chat pane, or None, if any of the variables are not found.
    """
    # Initialize variables for the chat names
    assistant_name = None
    end_user_name = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "END_USER_NAME_IN_CHAT_PANE":
                # Remove the quotes from the value of the variable
                end_user_name = value.strip()[1:-1]

            elif variable_name == "ASSISTANT_NAME_IN_CHAT_PANE":
                # Remove the quotes from the value of the variable
                assistant_name = value.strip()[1:-1]

    # Check if all two variables were found
    if (
        assistant_name is not None
        and end_user_name is not None
    ):
        return end_user_name, assistant_name

    # If any of the variables are not found, return None
    return None


def get_chatroom_paragraphs_format():
    """
    Reads the 'CHATROOM_PARAGRAPHS_FORMAT' variable from the
    environment configuration file. Returns the string value of the variables
    if found, or None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    paragraphs_format = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CHATROOM_PARAGRAPHS_FORMAT":
                # Remove the quotes from the value of the variable
                paragraphs_format = value.strip()[1:-1]

    # Check if the variable was found
    if paragraphs_format is not None:
        return paragraphs_format

    # If the variable was not found, return None
    return None


def get_commbase_hardware_notifications_on():
    """
    Reads the 'COMMBASE_HARDWARE_NOTIFICATIONS_ON' variable from the
    environment configuration file. Returns the string value of the variables
    if found, or None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    commbase_hardware_notifications = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "COMMBASE_HARDWARE_NOTIFICATIONS_ON":
                # Remove the quotes from the value of the variable
                commbase_hardware_notifications = value.strip()[1:-1]

    # Check if the variable was found
    if commbase_hardware_notifications is not None:
        return commbase_hardware_notifications

    # If the variable was not found, return None
    return None


def get_commbase_recorder_transmitter_quit_char():
    """
    Reads the 'COMMBASE_RECORDER_TRANSMITTER_QUIT_CHAR' variable from the
    environment configuration file. Returns the string value of the variables
    if found, or None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    quit_char = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "COMMBASE_RECORDER_TRANSMITTER_QUIT_CHAR":
                # Remove the quotes from the value of the variable
                quit_char = value.strip()[1:-1]

    # Check if the variable was found
    if quit_char is not None:
        return quit_char

    # If the variable was not found, return None
    return None


def get_commbase_stt_whisper_reactive_p_auto_open_recorder_after_command():
    """
    Reads the 'COMMBASE_STT_WHISPER_REACTIVE_P_AUTO_OPEN_RECORDER_AFTER_COMMAND'
    variable from the environment configuration file. Returns the string value
    of the variables if found, or None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    auto_open_recoder = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "COMMBASE_STT_WHISPER_REACTIVE_P_AUTO_OPEN_RECORDER_AFTER_COMMAND":
                # Remove the quotes from the value of the variable
                auto_open_recoder = value.strip()[1:-1]

    # Check if the variable was found
    if auto_open_recoder is not None:
        return auto_open_recoder

    # If the variable was not found, return None
    return None


def get_log_severity_level_1():
    """
    Reads the 'LOG_SEVERITY_LEVEL_1' variable from the environment
    configuration file. Returns the string value of the variables if found, or
    None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    log_severity_level_1 = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "LOG_SEVERITY_LEVEL_1":
                # Remove the quotes from the value of the variable
                log_severity_level_1 = value.strip()[1:-1]

    # Check if the variable was found
    if log_severity_level_1 is not None:
        return log_severity_level_1

    # If the variable was not found, return None
    return None


def get_slm_ms_phi3_mini_sentiment_analysis_model():
    """
    Reads the 'SLM_MS_PHI3_MINI_SENTIMENT_ANALYSIS_MODEL' variable from the
    environment configuration file. Returns the string value of the variables
    if found, or None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    sentiment_analysis_model = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "SLM_MS_PHI3_MINI_SENTIMENT_ANALYSIS_MODEL":
                # Remove the quotes from the value of the variable
                sentiment_analysis_model = value.strip()[1:-1]

    # Check if the variable was found
    if sentiment_analysis_model is not None:
        return sentiment_analysis_model

    # If the variable was not found, return None
    return None


def get_stt_engine_language():
    """
    Reads the 'STT_ENGINE_LANGUAGE' variable from the environment configuration
    file. Returns the string value of the variables if found, or None if the
    variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    stt_engine_language = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "STT_ENGINE_LANGUAGE":
                # Remove the quotes from the value of the variable
                stt_engine_language = value.strip()[1:-1]

    # Check if the variable was found
    if stt_engine_language is not None:
        return stt_engine_language

    # If the variable was not found, return None
    return None
