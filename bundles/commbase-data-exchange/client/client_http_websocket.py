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

# client_http_websocket.py
# Fetches commands from the commbase-data-exchange server and executes them.

# Imports
import requests
from socketio import Client
from config import CONFIG_FILE_DIR
from functions import discourse_data_exchange_client_error

# Define the API endpoint to retrieve saved JSON data
api_url = 'http://127.0.0.1:5000/api/get_saved_data'

# Define the WebSocket endpoint
socketio_url = 'http://127.0.0.1:5000'

sio = Client()


@sio.on('update_saved_data')
def handle_update_saved_data(saved_data):
    """
    Event handler function for updating saved data received from the WebSocket

    Parameters:
        saved_data (list): List of JSON data to be updated
    """
    print("Updated Saved JSON data:")
    for data in saved_data:
        print(data)


def main():
    """
    Main function to execute the script.

    This function connects to a WebSocket for real-time updates, retrieves
    saved JSON data from an API endpoint, handles responses, and waits for
    updates. If any exception occurs within the main() function or its nested
    blocks, it will be caught by the outer try-except block. Then, the
    discourse_data_exchange_client_error() function is called to handle the
    error.
    """
    try:
        # Send a GET request to the API endpoint
        response = requests.get(api_url)

        # Check the response status
        if response.status_code == 200:
            saved_data = response.json()
            print("Initial Saved JSON data:")
            for data in saved_data:
                print(data)
        else:
            print(f"Error: {response.status_code}")
            print("Response:", response.json())
            # Uncomment to debug the function status
            # execution_status = discourse_data_exchange_client_error()
            # print(execution_status)
            discourse_data_exchange_client_error()

        # Connect to the WebSocket for real-time updates
        sio.connect(socketio_url)
        sio.wait()

    except Exception as e:
        print(f"Request failed: {e}")
        discourse_data_exchange_client_error()


# Entry point for executing the script.
if __name__ == '__main__':
    main()
