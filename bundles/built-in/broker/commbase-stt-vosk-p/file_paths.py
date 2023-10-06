################################################################################
#                              commbase-stt-vosk-p                             #
#                                                                              #
# An ASR (Automatic Speech Recognition) engine.                                #
#                                                                              #
# Change History                                                               #
# 04/29/2023  Esteban Herrera Original code.                                   #
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


def get_vosk_ml_model_directory():
    """
    Retrieves the directory path of the Vosk ML model from the configuration
    file.

    Returns:
        str or None: The directory path of the Vosk ML model if found, or None
        if not found.
    """
    # Initialize variable for the tts engine string
    model_directory = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "VOSK_ML_MODEL_DIRECTORY":
                # Remove the quotes from the value of the variable
                model_directory = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if model_directory is not None:
        return model_directory

    # If the variable was not found, return None
    return None


def get_secrets_file_path():
    """
    Retrieves the value of the SECRETS_FILE_PATH variable from the configuration
    file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    secrets_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "SECRETS_FILE_PATH":
                # Remove the quotes from the value of the variable
                secrets_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if secrets_file is not None:
        return secrets_file

    # If the variable was not found, return None
    return None


def get_ascii_art_file_path():
    """
    Retrieves the value of the SASCII_ART_FILE_PATH variable from the
    configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    ascii_art_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "ASCII_ART_FILE_PATH":
                # Remove the quotes from the value of the variable
                ascii_art_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if ascii_art_file is not None:
        return ascii_art_file

    # If the variable was not found, return None
    return None


def get_assistant_microphone_instruction_file():
    """
    Retrieves the value of the SASSISTANT_MICROPHONE_INSTRUCTION_FILE variable
    from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    instruction_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "ASSISTANT_MICROPHONE_INSTRUCTION_FILE":
                # Remove the quotes from the value of the variable
                instruction_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if instruction_file is not None:
        return instruction_file

    # If the variable was not found, return None
    return None


def get_result_message_recording_file():
    """
    Retrieves the value of the SRESULT_MESSAGE_RECORDING_FILE variable from the
    configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    recording_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "RESULT_MESSAGE_RECORDING_FILE":
                # Remove the quotes from the value of the variable
                recording_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if recording_file is not None:
        return recording_file

    # If the variable was not found, return None
    return None


def get_previous_result_message_recording_file():
    """
    Retrieves the value of the SPREVIOUS_RESULT_MESSAGE_RECORDING_FILE variable
    from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    recording_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "PREVIOUS_RESULT_MESSAGE_RECORDING_FILE":
                # Remove the quotes from the value of the variable
                recording_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if recording_file is not None:
        return recording_file

    # If the variable was not found, return None
    return None


def get_controller_message_recording_file():
    """
    Retrieves the value of the CONTROLLER_MESSAGE_RECORDING_FILE variable from
    the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    recording_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROLLER_MESSAGE_RECORDING_FILE":
                # Remove the quotes from the value of the variable
                recording_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if recording_file is not None:
        return recording_file

    # If the variable was not found, return None
    return None


def get_result_messages_history_file():
    """
    Retrieves the value of the SRESULT_MESSAGES_HISTORY_FILE variable from the
    configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    history_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "RESULT_MESSAGES_HISTORY_FILE":
                # Remove the quotes from the value of the variable
                history_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if history_file is not None:
        return history_file

    # If the variable was not found, return None
    return None


def get_control_stop_previous_command_patterns_file():
    """
        Retrieves the value of the SCONTROL_STOP_PREVIOUS_COMMAND_PATTERNS_FILE
        from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_STOP_PREVIOUS_COMMAND_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_accept_changes_patterns_file():
    """
    Retrieves the value of the SCONTROL_ACCEPT_CHANGES_PATTERNS_FILE from the
    configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_ACCEPT_CHANGES_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_deny_changes_patterns_file():
    """
    Retrieves the value of the SCONTROL_DENY_CHANGES_PATTERNS_FILE from the
    configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_DENY_CHANGES_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_select_option_number_one_patterns_file():
    """
    Retrieves the value of the SCONTROL_SELECT_OPTION_NUMBER_ONE_PATTERNS_FILE
    from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_SELECT_OPTION_NUMBER_ONE_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_select_option_number_two_patterns_file():
    """
    Retrieves the value of the SCONTROL_SELECT_OPTION_NUMBER_TWO_PATTERNS_FILE
    from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_SELECT_OPTION_NUMBER_TWO_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_select_option_number_three_patterns_file():
    """
    Retrieves the value of the SCONTROL_SELECT_OPTION_NUMBER_THREE_PATTERNS_FILE
    from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_SELECT_OPTION_NUMBER_THREE_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_select_option_number_four_patterns_file():
    """
    Retrieves the value of the SCONTROL_SELECT_OPTION_NUMBER_FOUR_PATTERNS_FILE
    from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_SELECT_OPTION_NUMBER_FOUR_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_skip_question_patterns_file():
    """
    Retrieves the value of the SCONTROL_SKIP_QUESTION_PATTERNS_FILE from the
    configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_SKIP_QUESTION_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_request_the_current_mode_patterns_file():
    """
    Retrieves the value of the SCONTROL_REQUEST_THE_CURRENT_MODE_PATTERNS_FILE
    from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_REQUEST_THE_CURRENT_MODE_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_enter_the_normal_mode_patterns_file():
    """
    Retrieves the value of the SCONTROL_ENTER_THE_NORMAL_MODE_PATTERNS_FILE
    from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_ENTER_THE_NORMAL_MODE_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_enter_the_conversation_mode_patterns_file():
    """
    Retrieves the value of the SCONTROL_ENTER_THE_CONVERSATION_MODE_PATTERNS_FILE
    from the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_ENTER_THE_CONVERSATION_MODE_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_enter_the_expert_mode_patterns_file():
    """
    Retrieves the value of the SCONTROL_ENTER_THE_EXPERT_MODE_PATTERNS_FILE from
    the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_ENTER_THE_EXPERT_MODE_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None


def get_control_enter_the_follow_mode_patterns_file():
    """
    Retrieves the value of the SCONTROL_ENTER_THE_FOLLOW_MODE_PATTERNS_FILE from
    the configuration file.

    Returns:
        str or None: The value of the variable if found, or None if not found.
    """
    # Initialize variable for the tts engine string
    patterns_file = None

    # Open the file and read its contents
    with open(CONFIG_FILE_PATH, "r") as f:
        for line in f:
            # Split the line into variable name and value
            variable_name, value = line.strip().split("=")

            # Check if the variable we are looking for exists in the line
            if variable_name == "CONTROL_ENTER_THE_FOLLOW_MODE_PATTERNS_FILE":
                # Remove the quotes from the value of the variable
                patterns_file = CONFIG_FILE_DIR + value.strip()[1:-1]

    # Check if the variable was found
    if patterns_file is not None:
        return patterns_file

    # If the variable was not found, return None
    return None
