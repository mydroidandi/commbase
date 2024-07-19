#!/usr/bin/env python
################################################################################
#        commbase-genai-slm-ollama-phi3-mini-memory-remote-rag-pinecone        #
#                                                                              #
# A sophisticated AI assistant's Small Language Model (Phi3), enhanced by      #
# Retrieval-Augmented Generation (RAG) for improved response accuracy, and     #
# supported by a Pinecone semantic vector database.                            #
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

# file_paths.py
# This file stores functions related to loading and managing file paths
# Requires os.path already imported

# Requirements
from config import CONFIG_FILE_DIR, CONFIG_FILE_PATH


def get_assistant_discourse_from_language_model_file():
    """
    Retrieves the value of the ASSISTANT_DISCOURSE_FROM_LANGUAGE_MODEL_FILE
    variable from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable
    model_discourse_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "ASSISTANT_DISCOURSE_FROM_LANGUAGE_MODEL_FILE":
                # Remove the quotes from the value of the variable
                model_discourse_file = CONFIG_FILE_DIR + "/" + value.strip()[1:-1]

    # Check if the variable was found
    if model_discourse_file is not None:
        return model_discourse_file

    # If the variable was not found, return None
    return None


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


def get_chat_memory_file():
    """
    Retrieves the value of the CHAT_MEMORY_FILE variable from the configuration
    file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable
    chat_memory_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CHAT_MEMORY_FILE":
                # Remove the quotes from the value of the variable
                chat_memory_file = CONFIG_FILE_DIR + "/" + value.strip()[1:-1]

    # Check if the variable was found
    if chat_memory_file is not None:
        return chat_memory_file

    # If the variable was not found, return None
    return None


def get_run_voice_recorder_in_pane_path():
    """
    Retrieves the value of the RUN_VOICE_RECORDER_IN_PANE_PATH variable from
    the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable
    run_recorder_path = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "RUN_VOICE_RECORDER_IN_PANE_PATH":
                # Remove the quotes from the value of the variable
                run_recorder_path = CONFIG_FILE_DIR + "/" + value.strip()[1:-1]

    # Check if the variable was found
    if run_recorder_path is not None:
        return run_recorder_path

    # If the variable was not found, return None
    return None


def get_stt_engine_path():
    """
    Retrieves the value of the STT_ENGINE_PATH variable from the configuration
    file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable
    stt_engine_path = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "STT_ENGINE_PATH":
                # Remove the quotes from the value of the variable
                stt_engine_path = value.strip()[1:-1]

    # Check if the variable was found
    if stt_engine_path is not None:
        return stt_engine_path

    # If the variable was not found, return None
    return None
