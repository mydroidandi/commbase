#!/usr/bin/env python
################################################################################
#                        commbase-stt-whisper-reactive-p                       #
#                                                                              #
# A reactive version of STT ASR (Automatic Speech Recognition) engine.         #
#                                                                              #
# Change History                                                               #
# 01/17/2024  Esteban Herrera Original code.                                   #
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

# file_paths.py
# This file stores functions related to loading and managing file paths
# Requires os.path already imported

# Imports
from config import CONFIG_FILE_DIR, CONFIG_FILE_PATH


def get_chat_log_file():
    """
    Retrieves the value of the CHAT_LOG_FILE variable from the configuration
    file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable
    chat_log_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CHAT_LOG_FILE":
                # Remove the quotes from the value of the variable
                chat_log_file = CONFIG_FILE_DIR + "/" + value.strip()[1:-1]

    # Check if the variable was found
    if chat_log_file is not None:
        return chat_log_file

    # If the variable was not found, return None
    return None


def get_commbase_hardware_command_processing_start_file():
    """
    Retrieves the value of the COMMBASE_HARDWARE_COMMAND_PROCESSING_START_FILE
    variable from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable
    processing_start_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "COMMBASE_HARDWARE_COMMAND_PROCESSING_START_FILE":
                # Remove the quotes from the value of the variable
                processing_start_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if processing_start_file is not None:
        return processing_start_file

    # If the variable was not found, return None
    return None


def get_commbase_hardware_command_processing_stop_file():
    """
    Retrieves the value of the COMMBASE_HARDWARE_COMMAND_PROCESSING_STOP_FILE
    variable from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable
    processing_stop_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "COMMBASE_HARDWARE_COMMAND_PROCESSING_STOP_FILE":
                # Remove the quotes from the value of the variable
                processing_stop_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if processing_stop_file is not None:
        return processing_stop_file

    # If the variable was not found, return None
    return None


def get_commbase_hardware_device_0():
    """
    Retrieves the value of the COMBASE_HARDWARE_DEVICE_0 variable from the
    configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable
    hardware_device_0 = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "COMBASE_HARDWARE_DEVICE_0":
                # Remove the quotes from the value of the variable
                hardware_device_0 = value.strip()[1:-1]

    # Check if the variable was found
    if hardware_device_0 is not None:
        return hardware_device_0

    # If the variable was not found, return None
    return None


def get_commbase_stt_whisper_reactive_p_client_data_file():
    """
    Retrieves the value of the COMMBASE_STT_WHISPER_REACTIVE_P_CLIENT_DATA_FILE
    variable from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable
    recording_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "COMMBASE_STT_WHISPER_REACTIVE_P_CLIENT_DATA_FILE":
                # Remove the quotes from the value of the variable
                recording_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if recording_file is not None:
        return recording_file

    # If the variable was not found, return None
    return None
