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

# functions.py
# This file contains a collection of utility functions for various tasks. It
# provides a set of commonly used functions related to data manipulation, file
# handling, and mathematical operations.

# Imports
import torch  # pip install torch
from config import CONFIG_FILE_PATH
from sentence_transformers import SentenceTransformer


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


def test_embedding_model():
    """
    Initialize the model.
    max_seq_length is 256. That means that the maximum number of tokens (like
    words) that can be encoded into a single vector embedding is 256. Anything
    beyond this must be truncated.
    word_embedding_dimension is 384. This number is the dimensionality of
    vectors output by this model. It is important that we know this number
    later when initializing our Pinecone vector index.
    Normalize(). This final normalization step indicates that all vectors
    produced by the model are normalized. That means that models that we would
    typical measure similarity for using cosine similarity can also make use of
    the dotproduct similarity metric. In fact, with normalized vectors cosine
    and dotproduct are equivalent.
    """
    device = 'cuda' if torch.cuda.is_available() else 'cpu'
    if device != 'cuda':
        print(
            f"You are using {device}. This is much slower than using "
            "a CUDA-enabled GPU. If on Colab you can change this by "
            "clicking Runtime > Change runtime type > GPU."
        )

    # To create our embeddings we will us the MiniLM-L6 sentence transformer
    # model. This is a very efficient semantic similarity embedding model from
    # the sentence-transformers library.
    model = SentenceTransformer('all-MiniLM-L6-v2', device=device)

    # Create a sentence embedding using this model.
    # Encoding this single sentence leaves us with a 384 dimensional sentence
    # embedding (aligned to the word_embedding_dimension above).
    # To prepare this for upsert to Pinecone, all we do is this:
    #
    # _id = '0'
    # metadata = {'text': query}
    #
    # vectors = [(_id, xq, metadata)]
    #
    # Later when we do upsert our data to Pinecone, we will be doing so in
    # batches. Meaning vectors will be a list of (id, embedding, metadata)
    # tuples.
    query = 'which city is the most populated in the world?'

    xq = model.encode(query)

    return model, xq


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
