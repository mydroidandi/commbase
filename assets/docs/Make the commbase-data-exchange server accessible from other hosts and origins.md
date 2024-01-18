# Commbase <img align="center" alt="Commbase" width="10%" src="./images/commbase.png" /> commbase-data-exchange Externally Accessible

# Make the commbase-data-exchange server accessible from other hosts and origins

## Modify the server's address to make it accessible from other hosts

Instead of using 127.0.0.1, you can use the IP address of your machine or 0.0.0.0 to make the server accessible externally.

In the **server.py** file, change the line:

```python
socketio.run(app, debug=True)
```

to:

```python
socketio.run(app, host='0.0.0.0', port=5000, debug=True)
```

This change makes the server accessible from any IP address (0.0.0.0) on port 5000. Please note that exposing your server to the public internet may have security implications, and you should take appropriate measures to secure your application, such as implementing authentication, authorization, and using HTTPS.

After making this change, you should be able to connect to the server from another host using the machine's IP address. For example, if your machine's IP address is 192.168.1.100, you can access the server from another host by using http://192.168.1.100:5000.

Ensure that any firewalls on your machine are configured to allow incoming connections to the specified port (in this case, port 5000). Additionally, consider using HTTPS for secure communication, especially if the server is accessible over the public internet.

## Do I need to install CORS?

Yes, if you're planning to access your Flask server from a different origin (e.g., from a frontend application hosted on a different domain), you may need to handle Cross-Origin Resource Sharing (CORS) to ensure that the browser allows requests from different origins.

To enable CORS in your Flask application, you can use the Flask-CORS extension. If you haven't installed it yet, you can install it using:

```shell
pip install flask-cors
```

Then, modify your **server.py** file to include CORS support:

```python
import os
from flask import Flask, jsonify, request
from flask_socketio import SocketIO
from flask_cors import CORS  # Import CORS

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes
socketio = SocketIO(app)

# ... (rest of your server code)

if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0', port=5000, debug=True)
```

By adding CORS(app) to your Flask app, you allow it to respond to requests from different origins. Note that enabling CORS should be done cautiously, especially in production, to prevent unintended security vulnerabilities. You might want to configure it more specifically based on your requirements, such as specifying allowed origins, headers, or methods.

Make sure to read the Flask-CORS documentation for more details on configuration options: Flask-CORS Documentation.

## How can I modify the code to specify allowed origins

To specify allowed origins using Flask-CORS, you can pass the origins parameter to the CORS instance. This allows you to define a list of origins that are permitted to make requests to your server. Here's how you can modify your **server.py** to include specific allowed origins:

```python
import os
from flask import Flask, jsonify, request
from flask_socketio import SocketIO
from flask_cors import CORS

app = Flask(__name__)

# Specify allowed origins (replace with your frontend's actual origin)
allowed_origins = ["http://localhost:3000", "https://example.com", "http://192.168.1.100"]

CORS(app, origins=allowed_origins)  # Enable CORS with allowed origins
socketio = SocketIO(app)

# ... (rest of your server code)

if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0', port=5000, debug=True)
```

In the allowed_origins list, replace the placeholders with the actual origins of your frontend applications that you want to allow. You can include as many origins as needed.

This way, the server will only accept requests from the specified origins, helping to control which domains can access your server's resources. Adjust the allowed_origins list according to your specific frontend application URLs.

# Tell Flask it is Behind a Proxy

The information can be found on [Flask Website](https://flask.palletsprojects.com/en/2.3.x/deploying/proxy_fix/).

More information can be found [here](https://flask.palletsprojects.com/en/2.3.x/deploying/).

