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

# server_http_websocket.py
# Serves as a server for exchanging JSON data with clients over HTTP and
# WebSocket connections, allowing clients to save and retrieve JSON data in
# real-time.

import os
from flask import Flask, jsonify, request, render_template  # pip install flask flask-socketio
from flask_socketio import SocketIO  # pip install flask-socketio
import json

import subprocess

app = Flask(__name__)
socketio = SocketIO(app)

# Directory to store client data
CLIENT_DATA_DIR = os.path.join(os.environ.get("COMMBASE_APP_DIR", ""), "bundles", "commbase-data-exchange", "server", "client_data")

# Ensure the directory exists
os.makedirs(CLIENT_DATA_DIR, exist_ok=True)


# API endpoint to receive and save JSON
@app.route('/api/save_json', methods=['POST'])
def save_json():
    try:
        json_data = request.get_json()

        if not json_data:
            return jsonify({"error": "Empty JSON payload"}), 400

        filename = os.path.join(CLIENT_DATA_DIR, f"json_{len(os.listdir(CLIENT_DATA_DIR)) + 1}.json")

        with open(filename, 'w') as file:
            json.dump(json_data, file)

        # Calls src/_server_skill.sh
        subprocess.run(
            ["bash", os.environ["COMMBASE_APP_DIR"] + "/src/server_skill.sh"]
        )

        # Emit real-time update to connected clients
        emit_saved_data()

        return jsonify({"message": "JSON data saved successfully", "filename": filename})

    # except Exception as e:
    #    return jsonify({"error": str(e)}), 500

    except Exception as e:
        import traceback
        traceback.print_exc()
        return jsonify({"error": str(e)}), 500


# API endpoint to retrieve saved JSON data
@app.route('/api/get_saved_data', methods=['GET'])
def get_saved_data():
    try:
        saved_data = []
        for filename in os.listdir(CLIENT_DATA_DIR):
            filepath = os.path.join(CLIENT_DATA_DIR, filename)
            with open(filepath, 'r') as file:
                data = json.load(file)
                saved_data.append(data)

        return jsonify(saved_data)

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# API endpoint to update and save JSON
@app.route('/api/update_json/<int:json_id>', methods=['PUT'])
def update_json(json_id):
    try:
        json_data = request.get_json()

        if not json_data:
            return jsonify({"error": "Empty JSON payload"}), 400

        filename = os.path.join(CLIENT_DATA_DIR, f"json_{json_id}.json")

        if not os.path.exists(filename):
            return jsonify({"error": f"JSON file with ID {json_id} not found"}), 404

        with open(filename, 'w') as file:
            json.dump(json_data, file)

        # Calls src/_server_skill.sh
        subprocess.run(
            ["bash", os.environ["COMMBASE_APP_DIR"] + "/src/server_skill.sh"]
        )

        # Emit real-time update to connected clients
        emit_saved_data()

        return jsonify({"message": f"JSON data updated successfully for ID {json_id}", "filename": filename})

    except Exception as e:
        import traceback
        traceback.print_exc()
        return jsonify({"error": str(e)}), 500


@socketio.on('connect')
def handle_connect():
    emit_saved_data()


def emit_saved_data():
    saved_data = []
    for filename in os.listdir(CLIENT_DATA_DIR):
        filepath = os.path.join(CLIENT_DATA_DIR, filename)
        with open(filepath, 'r') as file:
            data = json.load(file)
            saved_data.append(data)
    socketio.emit('update_saved_data', saved_data)


if __name__ == '__main__':
    socketio.run(app, debug=True)
