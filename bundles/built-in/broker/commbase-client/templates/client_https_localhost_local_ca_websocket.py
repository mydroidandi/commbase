#!/usr/bin/env python
################################################################################
#                              commbase-client                                 #
#                                                                              #
# Fetches commands from the commbase-data-exchange server and executes them    #
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

# client_https_localhost_local_ca_websocket.py
# Fetches commands from the commbase-data-exchange server and executes them

import requests  # pip install requests
from socketio import Client

from requests.packages.urllib3.exceptions import InsecureRequestWarning

# Suppress only the InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

# Define the API endpoint to retrieve saved JSON data
api_url = 'https://127.0.0.1:5000/api/get_saved_data'

# Define the WebSocket endpoint
# socketio_url = 'http://127.0.0.1:5000'
socketio_url = 'ws://127.0.0.1:5000'

# Path to the CA certificate file (change this to the actual path)
ca_cert_path = './certificates/ca.pem'

sio = Client()


@sio.on('update_saved_data')
def handle_update_saved_data(saved_data):
    print("Updated Saved JSON data:")
    for data in saved_data:
        print(data)


def main():
    try:
        response = requests.get(api_url, verify=ca_cert_path)

        # Check the response status
        if response.status_code == 200:
            saved_data = response.json()
            print("Initial Saved JSON data:")
            for data in saved_data:
                print(data)
        else:
            print(f"Error: {response.status_code}")
            print("Response:", response.json())

        # Connect to the WebSocket for real-time updates
        sio.connect(socketio_url)
        sio.wait()

    except Exception as e:
        print(f"Request failed: {e}")


if __name__ == '__main__':
    main()
