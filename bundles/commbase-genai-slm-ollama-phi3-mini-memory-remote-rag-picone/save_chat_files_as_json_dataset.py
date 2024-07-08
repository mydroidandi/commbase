#!/usr/bin/env python
################################################################################
#         commbase-genai-slm-ollama-phi3-mini-memory-remote-rag-picone         #
#                                                                              #
# A sophisticated AI assistant's Small Language Model (Phi3), enhanced by      #
# Retrieval-Augmented Generation (RAG) for improved response accuracy, and     #
# supported by a Picone semantic vector database.                              #
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

# 01_save_chat_files_as_json_dataset.py
# Automates the processing of raw chat log files into a structured JSON
# dataset, performing text cleaning, content chunking (optional), and dataset
# augmentation with additional fields. It's designed to handle multiple chat
# files, ensuring data integrity and format consistency throughout the
# transformation process.
# It creates the following JSON Structure:
# Root Object:
# log_chats: This is an array that contains multiple objects, each representing
# a single chat log entry.
# Chat Log Entry Objects:
# Each object within the log_chats array represents one entry in the chat log
# that contains properties.

# Imports
import os
import json
import re  # Regular expressions
from collections import OrderedDict

# Global ID counter
id_counter = 1

# Set the chunking strategy on/off
chunk_by_period_on = "False"  # User "True" or "False"


def load_chat_files(directory):
    """
    Load all chat files from the specified directory.

    Args:
    - directory (str): Directory path containing the chat files.

    Returns:
    - list: A list of tuples, where each tuple contains the filename and the
    file content.
      Each tuple represents one chat file found in the directory.

    Example:
    If 'directory' contains two text files, 'file1.txt' and 'file2.txt', the
    function will return [('file1.txt', 'file1 content'), ('file2.txt',
    'file2 content')].
    """
    chat_files = []
    for filename in os.listdir(directory):
        if filename.endswith(".txt"):
            filepath = os.path.join(directory, filename)
            with open(filepath, 'r', encoding='utf-8') as file:
                # Return a list of tuples, each containing the filename and the file content.
                chat_files.append((filename, file.read()))
                # Return the file content
                # chat_files.append(file.read())

    return chat_files


def process_chat_content(content, id_counter, source):
    """
    Process the chat content and create a structured dataset.

    Args:
    - content (str): Raw content of the chat log.
    - id_counter (int): Current ID counter for assigning unique IDs to entries.
    - source (str): Source identifier of the chat log.

    Returns:
    - tuple: A tuple containing two elements:
        - list: A list of dictionaries, each representing a structured chat log
        entry.
        - int: Updated ID counter after processing.

    Notes:
    - Uses a regular expression pattern to parse each line of the content.
    - Each matched line is transformed into a dictionary entry with keys
    'timestamp', 'origin', 'severity', 'speaker', 'text', and 'source'.
    - Increments the id_counter for each entry added to the dataset.

    Example:
    If 'content' represents a chat log with several lines formatted as
    '[timestamp] origin: severity: speaker: text', the function returns a list
    of dictionaries representing each line's structured data along with the
    updated id_counter.
    """
    dataset = []
    # Improved regex pattern to capture all components including the text
    pattern = re.compile(r'\[(.*?)\] (.*?): (.*?): (.*?): (.*)')

    for line in content.split('\n'):
        match = pattern.match(line)
        if match:
            timestamp, origin, severity, speaker, text = match.groups()
            # timestamp, origin, _, speaker, text = match.groups()  # Exclude severity here
            entry = {
                "timestamp": timestamp,
                "origin": origin,
                "severity": severity,
                "speaker": speaker,
                "text": text,
                "source": source
            }
            dataset.append(entry)
            id_counter += 1

    return dataset, id_counter


def save_dataset(dataset, output_file):
    """
    Save a dataset to a JSON file.

    Args:
    - dataset (list): List of dictionaries representing the dataset to be
    saved.
    - output_file (str): File path where the JSON dataset will be saved.

    Returns:
    - None

    Notes:
    - Encodes the dataset to JSON format with UTF-8 encoding.
    - Ensures non-ASCII characters are properly handled by setting
    `ensure_ascii=False`.
    - Formats the JSON output with an indent of 4 spaces for readability.

    Example:
    Given 'dataset' as a list of dictionaries representing structured data
    entries, the function saves this dataset to the specified 'output_file'
    path in JSON format.
    """
    with open(output_file, 'w', encoding='utf-8') as file:
        json.dump(dataset, file, ensure_ascii=False, indent=4)  # Ensure proper encoding


def remove_emojis(text):
    """
    Remove emojis from the given text.

    Args:
    - text (str): Input text containing emojis.

    Returns:
    - str: Text with emojis removed.

    Notes:
    - Uses a regular expression pattern to match and remove various Unicode
    ranges.
      representing emojis and other symbols.
    - Handles Unicode characters to ensure comprehensive emoji removal.
    - Returns the modified text without emojis.

    Example:
    If 'text' contains emojis such as 😊, 🚗, or 🇺🇸, the function removes
    these emojis.
    and returns the cleaned text.
    """
    emoji_pattern = re.compile(
        "["
        u"\U0001F600-\U0001F64F"  # emoticons
        u"\U0001F300-\U0001F5FF"  # symbols & pictographs
        u"\U0001F680-\U0001F6FF"  # transport & map symbols
        u"\U0001F1E0-\U0001F1FF"  # flags (iOS)
        u"\U00002500-\U00002BEF"  # chinese char
        u"\U00002702-\U000027B0"
        u"\U00002702-\U000027B0"
        u"\U000024C2-\U0001F251"
        u"\U0001f926-\U0001f937"
        u"\U00010000-\U0010ffff"
        u"\u2640-\u2642"
        u"\u2600-\u2B55"
        u"\u200d"
        u"\u23cf"
        u"\u23e9"
        u"\u231a"
        u"\ufe0f"  # dingbats
        u"\u3030"
        "]+",
        flags=re.UNICODE
    )
    return emoji_pattern.sub(r'', text)


def trim_speaker_whitespace(text):
    """
    Trim leading and trailing whitespace from the speaker field.

    Args:
    - text (str): Input text representing the speaker's name.

    Returns:
    - str: Text with leading and trailing whitespace removed.

    Notes:
    - Uses the `strip()` method to remove any leading and trailing whitespace
    characters
      from the input text.
    - Ensures the speaker's name is clean and formatted without unnecessary
    spaces.

    Example:
    If 'text' is "   John Doe   ", the function trims it to "John Doe".
    """
    return text.strip()


def remove_empty_entries(dataset):
    """
    Remove entries from the dataset where the 'text' field after the speaker is
    empty.

    Args:
    - dataset (list): List of dictionaries representing the dataset.

    Returns:
    - list: Filtered list of dictionaries with entries where 'text' is not
    empty after stripping.

    Notes:
    - Filters out entries in the dataset where the 'text' field, after
    stripping leading and trailing whitespace, evaluates to False (empty
    string).
    - Ensures only meaningful entries with non-empty text are retained in the
    cleaned dataset.

    Example:
    If 'dataset' contains multiple dictionaries representing chat log entries,
    the function removes entries where the 'text' field is empty after
    whitespace stripping and returns the cleaned dataset.
    """
    cleaned_dataset = [entry for entry in dataset if entry['text'].strip()]
    return cleaned_dataset


def generate_chat_dataset():
    """
    Generate a structured dataset from chat log files in a specified directory.

    This function reads chat log files from a directory, processes their
    content, cleans and formats the data, removes entries with empty text
    fields, and saves the resulting dataset to a JSON file.

    Args:
    - None (Uses global variables and constants defined within the function).

    Returns:
    - None

    Notes:
    - Uses global variables: `id_counter` to assign unique IDs,
    `source_directory` for input files, and `output_file` for saving the
    processed dataset.
    - Calls `load_chat_files()` to retrieve chat log contents.
    - Calls `process_chat_content()` to parse and structure each chat log
    entry.
    - Calls `trim_speaker_whitespace()` and `remove_emojis()` to clean speaker
    names and text content.
    - Handles encoding issues by converting text to UTF-8 where necessary.
    - Removes entries from the dataset where the 'text' field is empty after
    trimming.
    - Saves the cleaned dataset to a JSON file and prints statistics about the
    dataset creation.

    Example:
    When executed, the function processes chat log files from './src'
    directory, cleans and formats the data, removes empty entries, and saves
    the structured dataset to './build/dataset.json'. It then prints statistics
    including the number of dictionaries created and the file path where the
    dataset is saved.
    """
    global id_counter

    source_directory = './src'
    output_file = './build/dataset.json'

    chat_files = load_chat_files(source_directory)
    all_data = []

    for source, content in chat_files:
        processed_data, id_counter = process_chat_content(content, id_counter, source)
        # Remove emojis and special characters from processed data
        for entry in processed_data:
            entry['speaker'] = trim_speaker_whitespace(remove_emojis(entry['speaker']))  # Remove emojis and trim whitespace from speaker
            entry['text'] = remove_emojis(entry['text'])
            entry['text'] = entry['text'].encode('utf-8', 'ignore').decode('utf-8')  # Handle encoding issues
            # entry['content'] = remove_emojis(entry.get('content', ''))
            # entry['content'] = entry['content'].encode('utf-8', 'ignore').decode('utf-8')  # Handle encoding issues
        all_data.extend(processed_data)

    # Remove entries with empty text
    all_data = remove_empty_entries(all_data)

    save_dataset(all_data, output_file)
    print("Statistics:")
    print("Dataset created from chat files.")
    print(f"Dataset saved to {output_file}")
    print(f"Number of dictionaries created: {id_counter}")
    print(f"Number of dictionaries created: {len(all_data)}")


def add_content():
    """
    Add a 'content' field to each entry in the dataset with concatenated values
    of other fields.

    This function reads a dataset from './build/dataset.json', processes each
    entry, concatenates selected fields ('timestamp', 'origin', 'severity',
    'speaker', 'text') into a new 'content' field, creates a new dataset with
    these additions, and saves it to './build/dataset_with_content.json'.

    Args:
    - None

    Returns:
    - None

    Notes:
    - Loads the dataset from './build/dataset.json' using JSON format.
    - Constructs the 'content' field for each entry by concatenating specific
    fields.
    - Uses OrderedDict to ensure 'content' is placed at the beginning of each
    dictionary.
    - Saves the modified dataset to './build/dataset_with_content.json' in JSON
    format with indentation for readability.
    - Prints messages indicating the addition of the 'content' field, the file
    path where the dataset is saved, and the number of dictionaries created.

    Example:
    When executed, the function processes the dataset from
    './build/dataset.json', adds a 'content' field to each entry based on
    specified fields, saves the updated dataset to
    './build/dataset_with_content.json', and prints messages confirming the
    operation and providing statistics about the dataset.
    """
    input_file = './build/dataset.json'
    output_file = './build/dataset_with_content.json'

    with open(input_file, 'r', encoding='utf-8') as file:
        data = json.load(file)

    data_with_content = []
    for item in data:
        content_text = (
            f"timestamp: {item['timestamp']} "
            f"origin: {item['origin']} "
            f"severity: {item['severity']} "
            f"speaker: {item['speaker']}: {item['text']}"
        )
        new_item = OrderedDict([("content", content_text), *item.items()])
        data_with_content.append(new_item)

    with open(output_file, 'w', encoding='utf-8') as output_file:
        json.dump(data_with_content, output_file, indent=4)

    print("Content item added to the dataset.")
    print(f"Dataset saved to {output_file}")
    print(f"Number of dictionaries created: {len(data_with_content)}")


def add_id():
    """
    Add an 'id' field to each entry in the dataset.

    This function reads a dataset from either
    './build/dataset_with_chunked_content.json' or
    './build/dataset_with_content.json', depending on the value of the global
    variable `chunk_by_period_on`. It iterates through each entry in the
    dataset, assigns a unique ID starting from 1, adds the 'id' field to each
    dictionary, creates a new dataset with IDs added, and saves it to
    './build/dataset_with_id.json'.

    Args:
    - None

    Returns:
    - None

    Notes:
    - Uses global variables: `chunk_by_period_on` to determine the input file
    path, `output_file` for saving the dataset with IDs.
    - Loads the dataset from the appropriate input file based on the condition.
    - Assigns IDs starting from 1 using a local counter `id_counter`.
    - Saves the modified dataset to './build/dataset_with_id.json' in JSON
    format with indentation.
    - Prints messages indicating the addition of the 'id' field, the file path
    where the dataset is saved, and the number of dictionaries created.

    Example:
    When executed, the function checks the value of `chunk_by_period_on` to
    determine the input file, adds 'id' fields to each entry in the dataset,
    saves the updated dataset to './build/dataset_with_id.json', and prints
    messages confirming the operation and providing statistics about the
    dataset.
    """
    if chunk_by_period_on == "True":
        input_file = './build/dataset_with_chunked_content.json'
    else:
        input_file = './build/dataset_with_content.json'

    output_file = './build/dataset_with_id.json'

    with open(input_file, 'r', encoding='utf-8') as file:
        data = json.load(file)

    data_with_id = []
    id_counter = 1  # Local counter to ensure IDs start from 1 for this specific dataset

    for item in data:
        item['id'] = id_counter
        data_with_id.append(item)
        id_counter += 1

    with open(output_file, 'w', encoding='utf-8') as output_file:
        json.dump(data_with_id, output_file, indent=4)

    print("Id item added to the dataset.")
    print(f"Dataset saved to {output_file}")
    print(f"Number of dictionaries created: {len(data_with_id)}")


def chunk_by_period():
    """
    Chunk the 'content' and 'text' fields in the dataset based on periods.

    This function chunks the 'content' and 'text' fields of each entry in the
    dataset when it encounters a period ('.'). It splits the 'content' and
    'text' fields into sentences based on periods, ensures that corresponding
    sentences in both fields match in length, and creates new entries for each
    sentence pair with the period added back to each sentence except the last
    one. The resulting dataset is saved to
    './build/dataset_with_chunked_content.json'.

    Args:
    - None

    Returns:
    - None

    Notes:
    - Loads the dataset from './build/dataset_with_content.json'.
    - Splits 'content' and 'text' fields into sentences based on periods ('.').
    - Asserts that the number of sentences in 'content' and 'text' fields
    match.
    - Saves the chunked dataset to './build/dataset_with_chunked_content.json'
    in JSON format with indentation.
    - Prints messages confirming the chunking operation and providing
    statistics about the resulting dataset.

    Example:
    When executed, the function processes the dataset from
    './build/dataset_with_content.json', chunks the 'content' and 'text' fields
    based on periods, saves the chunked dataset to
    './build/dataset_with_chunked_content.json',
    and prints messages indicating the success of the chunking operation and
    the number of dictionaries created in the resulting dataset.
    """
    if chunk_by_period_on == "True":
        input_file = './build/dataset_with_content.json'
        output_file = './build/dataset_with_chunked_content.json'

        with open(input_file, 'r', encoding='utf-8') as file:
            data = json.load(file)

        chunked_data = []
        for item in data:
            content = item['content']
            text = item['text']

            # Find the index where the actual message starts after "speaker: "
            prefix_end_index = content.index(item['speaker'] + ':') + len(item['speaker'] + ': ')

            # Split the message part of content and text by period
            prefix = content[:prefix_end_index]
            message = content[prefix_end_index:]
            message_text = text

            message_sentences = message.split('. ')
            text_sentences = message_text.split('. ')

            # Ensure the sentences arrays match in length
            assert len(message_sentences) == len(text_sentences)

            # Add the period back to each sentence except the last one
            message_sentences = [s + '.' if i < len(message_sentences) - 1 else s for i, s in enumerate(message_sentences)]
            text_sentences = [s + '.' if i < len(text_sentences) - 1 else s for i, s in enumerate(text_sentences)]

            for message_sentence, text_sentence in zip(message_sentences, text_sentences):
                if message_sentence.strip():  # Avoid adding empty sentences
                    new_item = OrderedDict(item)
                    new_item['content'] = prefix + message_sentence
                    new_item['text'] = text_sentence
                    chunked_data.append(new_item)

        with open(output_file, 'w', encoding='utf-8') as output_file:
            json.dump(chunked_data, output_file, indent=4)

        print(f"Chunked dataset saved to {output_file}.")
        print(f"Number of dictionaries created: {len(chunked_data)}")


def wrap_inside_object():
    """
    Wrap the JSON content inside an object called 'log_chats'.

    This function reads JSON data from './build/dataset_with_id.json', wraps it
    inside a new JSON object with key 'log_chats', and saves the wrapped
    dataset to './build/log_chats.json'. It also prints debugging information
    about the first item in the dataset before saving, including checking for
    emojis.

    Args:
    - None

    Returns:
    - None

    Notes:
    - Reads input JSON data from './build/dataset_with_id.json'.
    - Wraps the dataset inside a new JSON object with key 'log_chats'.
    - Saves the wrapped dataset to './build/log_chats.json' with indentation.
    - Prints debugging information about the first item in the dataset before
    saving, including its contents for debugging purposes.

    Example:
    When executed, the function reads the dataset from
    './build/dataset_with_id.json', wraps it inside an object 'log_chats',
    saves the wrapped dataset to './build/log_chats.json', and prints messages
    confirming the wrapping operation and indicating where the dataset was
    saved.
    """
    input_file = './build/dataset_with_id.json'
    output_file = './build/log_chats.json'

    with open(input_file, 'r', encoding='utf-8') as file:
        data = json.load(file)

    log_chats = {'log_chats': data}

    # Debugging print statements
    # print("First item in data before saving:")
    # print(data[0])  # Prints the first item to check for emojis
    print("Last item in data before saving:")
    print(data[-1])  # Prints the last item in the list to check for emojis

    with open(output_file, 'w', encoding='utf-8') as output_file:
        json.dump(log_chats, output_file, indent=4)

    print("Dataset wrapped inside json object.")
    print(f"Dataset saved to {output_file}")


def main():
    """
    Main function to orchestrate the data processing pipeline.

    This function coordinates the execution of several sub-functions to
    generate and manipulate datasets:
    1. Calls generate_chat_dataset() to create 'dataset.json' containing
    processed chat data.
    2. Calls add_content() to add a 'content' field to each entry in
    'dataset.json', creating 'dataset_with_content.json'.
    3. Depending on the value of chunk_by_period_on:
       - If True, calls chunk_by_period() to chunk the content and text fields
       in 'dataset_with_content.json', creating
       'dataset_with_chunked_content.json'.
       Then calls add_id() to add an 'id' field to each entry in
       'dataset_with_chunked_content.json', creating 'dataset_with_id.json'.
       - If False, directly calls add_id() on 'dataset_with_content.json' to
       create 'dataset_with_id.json'.
    4. Calls wrap_inside_object() to wrap the dataset inside a 'log_chats'
    object and save it as 'log_chats.json'.

    Args:
    - None

    Returns:
    - None

    Notes:
    - The function serves as the entry point for executing the entire data
    processing pipeline.
    - It manages the flow of data through various processing stages, ensuring
    each stage is executed in sequence.
    - Depending on the value of chunk_by_period_on, different processing paths
    are followed to handle dataset chunking.

    Example:
    When executed, this function initiates the processing pipeline:
    - It generates initial datasets, adds necessary fields, chunks data if
    specified, and wraps final data in an object.
    - Each step's completion is indicated by appropriate print statements
    confirming dataset creation and saving.
    """
    # Generates dataset.json
    generate_chat_dataset()

    # Generate dataset_with_content.json
    add_content()

    if chunk_by_period_on == "True":
        # Generate dataset_with_chunked_content.json
        chunk_by_period()
        # Generates dataset_with_id.json
        add_id()
    else:
        # Generates dataset_with_id.json
        add_id()

    # Generates log_chats.json
    wrap_inside_object()


if __name__ == "__main__":
    main()
