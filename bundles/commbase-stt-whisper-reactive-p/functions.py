#!/usr/bin/env python
################################################################################
#                        commbase-stt-whisper-reactive-p                       #
#                                                                              #
# A reactive version of STT ASR (Automatic Speech Recognition) engine.         #
#                                                                              #
# Change History                                                               #
# 03/02/2024  Esteban Herrera Original code.                                   #
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


def get_commbase_hardware_notification_processing_start_on():
    """
    Reads the 'COMMBASE_HARDWARE_NOTIFICATION_PROCESSING_START_ON' variable
    from the environment configuration file. Returns the string value of the
    variables if found, or None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    commbase_hardware_notification = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "COMMBASE_HARDWARE_NOTIFICATION_PROCESSING_START_ON":
                # Remove the quotes from the value of the variable
                commbase_hardware_notification = value.strip()[1:-1]

    # Check if the variable was found
    if commbase_hardware_notification is not None:
        return commbase_hardware_notification

    # If the variable was not found, return None
    return None


def get_commbase_hardware_notification_processing_stop_on():
    """
    Reads the 'COMMBASE_HARDWARE_NOTIFICATION_PROCESSING_STOP_ON' variable from
    the environment configuration file. Returns the string value of the
    variables if found, or None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    commbase_hardware_notification = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "COMMBASE_HARDWARE_NOTIFICATION_PROCESSING_STOP_ON":
                # Remove the quotes from the value of the variable
                commbase_hardware_notification = value.strip()[1:-1]

    # Check if the variable was found
    if commbase_hardware_notification is not None:
        return commbase_hardware_notification

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


def stt_engine_processing_time_visible_on():
    """
    Reads the 'STT_ENGINE_PROCESSING_TIME_VISIBLE_ON' variable from
    the environment configuration file. Returns the string value of the
    variables if found, or None if the variable is not present.

    Returns:
        str or None: The string if found in the configuration file, otherwise
    None.
    """
    # Initialize variable
    processing_time_visible = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "STT_ENGINE_PROCESSING_TIME_VISIBLE_ON":
                # Remove the quotes from the value of the variable
                processing_time_visible = value.strip()[1:-1]

    # Check if the variable was found
    if processing_time_visible is not None:
        return processing_time_visible

    # If the variable was not found, return None
    return None
