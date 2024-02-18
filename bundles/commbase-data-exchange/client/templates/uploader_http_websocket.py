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

# uploader_http_websocket.py
# Sends a POST request with a JSON payload to a specified API endpoint and
# handles the response.

import requests  # pip install requests
import json
from config import CONFIG_FILE_PATH
from file_paths import get_messaging_file

import subprocess

def read_json_file(json_file_path):
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


def send_post_request(api_url, json_data):
    try:
        response = requests.post(api_url, json=json_data)
        return response
    except requests.exceptions.RequestException as e:
        print(f"Request failed: {e}")
        return None


def main():
    # Define the API endpoint
    api_url = 'http://127.0.0.1:5000/api/save_json'

    # Get the JSON file path
    json_file_path = get_messaging_file()

    # Read JSON data from file
    json_data = read_json_file(json_file_path)

    if json_data is not None:
        # Send a POST request to the API endpoint with JSON payload
        response = send_post_request(api_url, json_data)

        # Check the response status
        if response is not None:
            session_name = 'Commbase-0'
            window_number = '1'
            pane_number = '2'
            if response.status_code == 200:
                # Print "JSON data saved successfully."
                status = "JSON data saved successfully."
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
            else:
                # Print "Error: ..."
                status = f"Error: {response.status_code}"
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

if __name__ == "__main__":
    main()
