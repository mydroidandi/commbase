#!/usr/bin/env python
################################################################################
#                            commbase-data-exchange                            #
#                                                                              #
# Server for exchanging data with clients over HTTP and WebSocket connections  #
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

# updater_http_websocket.py
# Send a PUT request to update JSON data on a server

# Imports
import json
import requests
import subprocess
from config import CONFIG_FILE_PATH
from file_paths import get_messaging_file
from functions import discourse_data_exchange_client_error


def read_json_file(json_file_path):
    """
    Reads JSON data from the specified file path.

    Parameters:
        json_file_path (str): The path to the JSON file to be read.

    Returns:
        dict or None: The JSON data read from the file, or None if an error
        occurs.

    Raises:
        FileNotFoundError: If the specified JSON file is not found.
        json.JSONDecodeError: If there is an error decoding JSON data from the
        file.
        Exception: If any other error occurs during file reading.
    """
    try:
        with open(json_file_path, 'r') as json_file:
            data = json.load(json_file)
            return data
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")
        return None
    except FileNotFoundError:
        print(f"File not found: {json_file_path}")
        return None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None


def update_json(api_url, json_id, json_data):
    """
    Updates JSON data by sending a PUT request to the specified API endpoint.

    Parameters:
        api_url (str): The URL of the API endpoint.
        json_id (int): The ID of the JSON data to be updated.
        json_data (dict): The updated JSON data to be sent in the request.

    Returns:
        requests.Response or None: The response object from the PUT request, or
        None if an error occurs.
    """
    try:
        response = requests.put(f"{api_url}/{json_id}", json=json_data)
        return response
    except requests.exceptions.RequestException as e:
        print(f"Request failed: {e}")
        discourse_data_exchange_client_error()
        return None


def main():
    """
    Main function to execute the script.

    This function performs various tasks such as fetching data, updating JSON,
    handling responses, and executing subprocess commands. If any exception
    occurs within the main() function or its nested blocks, it will be caught
    by the outer try-except block. Then, the discourse_data_exchange_client_error()
    function is called to handle the error.

    Returns:
        None
    """
    api_url = 'http://127.0.0.1:5000/api/update_json'

    # Get the JSON file path
    json_file_path = get_messaging_file()

    # Read JSON data from file
    updated_json_data = read_json_file(json_file_path)

    # Specify the JSON ID for update (replace with the appropriate ID)
    json_id = 1

    # Send a PUT request to the API endpoint with JSON payload and ID
    response = update_json(api_url, json_id, updated_json_data)

    # Handle the response
    if response is not None:
        session_name = 'Commbase-0'
        window_number = '1'
        pane_number = '4'
        if response.status_code == 200:
            # Print "JSON data saved successfully."
            status = "JSON data updated successfully."
            try:
                subprocess.run(f'tmux send-keys -t {session_name}:{window_number}.{pane_number} -l "{status}" 2>/dev/null', check=True, shell=True)
                # Add an additional tmux send-keys command to simulate the Enter key press.
                subprocess.run(f'tmux send-keys -t {session_name}:{window_number}.{pane_number} "Enter" 2>/dev/null Enter', check=True, shell=True)
            except subprocess.CalledProcessError as e:
                print(f"Error executing subprocess command: {e}")
            except Exception as e:
                print(f"Other error occurred: {e}")
        else:
            # Print "Error: ..."
            status = f"Error: {response.status_code}"
            discourse_data_exchange_client_error()
            try:
                subprocess.run(f'tmux send-keys -t {session_name}:{window_number}.{pane_number} -l "{status}" 2>/dev/null', check=True, shell=True)
            except subprocess.CalledProcessError as e:
                print(f"Error executing subprocess command: {e}")
            except Exception as e:
                print(f"Other error occurred: {e}")
            # Print " Response: ..."
            status = f" Response: {response.json()}"
            try:
                subprocess.run(f'tmux send-keys -t {session_name}:{window_number}.{pane_number} -l "{status}" 2>/dev/null', check=True, shell=True)
                # Add an additional tmux send-keys command to simulate the Enter key press.
                subprocess.run(f'tmux send-keys -t {session_name}:{window_number}.{pane_number} "Enter" 2>/dev/null Enter', check=True, shell=True)
            except subprocess.CalledProcessError as e:
                print(f"Error executing subprocess command: {e}")
            except Exception as e:
                print(f"Other error occurred: {e}")


# Entry point for executing the script.
if __name__ == "__main__":
    main()
