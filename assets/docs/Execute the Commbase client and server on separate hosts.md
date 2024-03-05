<div style="text-align: right;">

Commbase <img align="center" alt="Commbase" width="10%" src="./images/commbase.png" />

</div>

# Separate Commbase client and server

The commbase-data-exchange single-server single-client design provides the capabilities of Centralized Control and Management, and Scalability to standalone applications.

With this modification, Commbase can be separate into two components. The Commbase server component can be executed in one host and the Commbase client component can be executed in another host.

## Modify the server's address to make it accessible from other host\(s\) and origins

Instead of using 127.0.0.1, you can use the IP address of your machine or 0.0.0.0 to make the server accessible externally.

Go to directory bundles/commbase-data-exchange/server/templates/.

You will find these files:

**server_https_fqdn_signed_cert_websocket.py**: Used for HTTPS configurations with complete domains using a certificate signed by a trusted CA.

**server_https_localhost_local_ca_websocket.py**: Used for HTTPS configurations with the server in the localhost using a local Certificate Authority certificate. Use it the file **** as client.

**server_http_websocket.py**: Used for HTTP connections. This is the default configuration file, which should work out of the box after the Commbase installation in single computer/droid. Use it the file **** as client.

You will want to use an HTTPS template for improved security over the networks.

The SSL/TLS connection is established when the client receives the initial JSON data, so the data transmission itself is secured using HTTPS. The subsequent connection refusal issue seems unrelated to the secure transmission of data.

Let's take the file **server_https_localhost_local_ca_websocket.py** as an example.

Paste a copy of the template file in the Commbase directory **bundles/commbase-data-exchange/server/**.

Open the file copy, and change the code:

```python
if __name__ == '__main__':
    socketio.run(app, debug=True, ssl_context=context)
```

to:

```python
if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0', port=5000, debug=True, ssl_context=context)
```

This change makes the server accessible from any IP address (0.0.0.0) on port 5000. Please note that exposing your server to the public internet may have security implications, and you should take appropriate measures to secure your application, such as implementing authentication, authorization, and using HTTPS.

After making this change, you should be able to connect to the server from another host using the machine's IP address. For example, if your machine's IP address is 192.168.1.100, you can access the server from another host by using https://192.168.1.100:5000.

Ensure that any firewalls on your machine are configured to allow incoming connections to the specified port (in this case, port 5000). Additionally, consider using HTTPS for secure communication, especially if the server is accessible over the public internet.

## Open a port in the firewall

You can do so in your server firewall scripts or using an application such as **ufw**.

To open a port in a Linux firewall using ufw (Uncomplicated Firewall), you can follow these steps:

Install it using the package manager for your Linux distribution. For example, on Ubuntu or Debian, you can use:

```shell
sudo apt-get install ufw
```

Open the port.

```shell
sudo ufw allow 5000
```

After making changes, reload ufw to apply the new rules.

```shell
sudo ufw reload
```

Verify changes.

```shell
sudo ufw status
```

## Do I need to install CORS?

Yes, if you're planning to access your Flask server from a different origin (e.g., from a frontend application hosted on a different domain), you may need to handle Cross-Origin Resource Sharing (CORS) to ensure that the browser allows requests from different origins.

To enable CORS in your Flask application, you can use the Flask-CORS extension. If you haven't installed it yet, you can install it using:

```shell
pip install flask-cors
```

Then, modify your **server_https_localhost_local_ca_websocket.py** file to include CORS support:

```python
import os
from flask import Flask, jsonify, request, render_template  # pip install flask
from flask_socketio import SocketIO  # pip install flask-socketio
import json
import ssl  # Import the ssl module
from flask_cors import CORS  # Import CORS

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes
socketio = SocketIO(app)

# ... (rest of your server code)

if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0', port=5000, debug=True, ssl_context=context)
```

By adding CORS(app) to your Flask app, you allow it to respond to requests from different origins. Note that enabling CORS should be done cautiously, especially in production, to prevent unintended security vulnerabilities. You might want to configure it more specifically based on your requirements, such as specifying allowed origins, headers, or methods.

Make sure to read the Flask-CORS documentation for more details on configuration options: Flask-CORS Documentation.

## How can I modify the code to specify allowed origins

To specify allowed origins using Flask-CORS, you can pass the origins parameter to the CORS instance. This allows you to define a list of origins that are permitted to make requests to your server. Here's how you can modify your **server_https_localhost_local_ca_websocket.py** file to include specific allowed origins:

```python
import os
from flask import Flask, jsonify, request, render_template  # pip install flask
from flask_socketio import SocketIO  # pip install flask-socketio
import json
import ssl  # Import the ssl module
from flask_cors import CORS  # Import CORS

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes
socketio = SocketIO(app)

# Specify allowed origins (replace with your frontend's actual origin)
allowed_origins = ["http://localhost:3000", "https://example.com", "http://192.168.1.100"]

CORS(app, origins=allowed_origins)  # Enable CORS with allowed origins
socketio = SocketIO(app)

# ... (rest of your server code)

if __name__ == '__main__':
    socketio.run(app, host='0.0.0.0', port=5000, debug=True, ssl_context=context)
```

In the allowed_origins list, replace the placeholders with the actual origins of your frontend applications that you want to allow. You can include as many origins as needed.

This way, the server will only accept requests from the specified origins, helping to control which domains can access your server's resources. Adjust the allowed_origins list according to your specific frontend application URLs.

## Tell Flask it is Behind a Proxy

The information can be found on [Flask Website](https://flask.palletsprojects.com/en/2.3.x/deploying/proxy_fix/).

More information can be found [here](https://flask.palletsprojects.com/en/2.3.x/deploying/).

## Protect your Flask application's API endpoint using HTTPS

If you are not using a reverse proxy server, you can still enable HTTPS directly in your Flask application.

You need to have one valid HTTPS certificate to be able to use your new set up with the built-in ssl module that handles the SSL context.

### Option 1. Secure your local network endpoint with HTTPS using a local certificate authority (CA)

If you want to secure your local network endpoint with HTTPS without a registered domain name, you can create a self-signed certificate or use a local certificate authority (CA). While self-signed certificates are an option, they come with security warnings in most browsers, as they are not issued by a trusted third party.

Self-signed certificates are not allowed by commbase-data-exchange.

Steps:

Install OpenSSL:

Make sure OpenSSL is installed on your machine. In Debian GNU/Linux it can be done as follows:

```shell
sudo apt-get install openssl
```

Go to the directory **/home/commbase/Dev/mydroidandi/commbase/bundles/commbase-data-exchange/server/certificates/**

Create a Local CA:

Create a local certificate authority by generating a certificate and private key.

```shell
openssl genrsa -out ca-key.pem 2048
openssl req -new -key ca-key.pem -out ca-csr.pem
openssl x509 -req -in ca-csr.pem -signkey ca-key.pem -out ca.pem
```

For the Common Name, you should use a domain name like: www.example.com

Generate Server Certificate Signed by Local CA:

Generate a certificate for your server using the local CA.

```shell
openssl genrsa -out key.pem 2048
openssl req -new -key key.pem -out csr.pem
openssl x509 -req -in csr.pem -CA ca.pem -CAkey ca-key.pem -out cert.pem
```

For the Common Name, use: 127.0.0.1

Go to the directory **/home/commbase/Dev/mydroidandi/commbase/bundles/commbase-data-exchange/client/certificates/** and put there a copy of the CA certificate `ca.pem` generated in this procedure.

The ".pem" extension in a server key typically indicates that the key is stored in the PEM (Privacy-Enhanced Mail) format. PEM is a widely used encoding format for cryptographic objects, including private keys, public keys, certificates, and other related information.

In the context of a server key, a ".pem" file often contains the private key used by a server in an SSL/TLS (Secure Sockets Layer/Transport Layer Security) protocol for securing communication over the internet. The private key is a crucial component in the process of establishing a secure connection between a client (such as a web browser) and a server.

Securing cryptographic keys, especially server keys, is crucial for maintaining the overall security of your system. Here are some best practices for keeping your keys safe:

1. Use a Secure Location
2. Restrict Access
3. Encryption
4. Regular Backups
5. Rotate Keys
6. Use Hardware Security Modules (HSMs)
7. Audit and Monitoring
8. Network Security
9. Security Updates
10. Secure Transmission
11. Key Management Policies
12. Consider Key Management Solutions

### Option 2. Submit the CSR to a Certificate Authority (CA)

For this option, you should use the template file **server_https_fqdn_signed_cert_websocket.py**, instead of the file in the examples.

This setup involves associating your domain with a public IP, using an internet router to manage traffic, and optionally employing an HTTPS proxy for security. This infrastructure is fundamental for hosting a website or a service on a server, making it accessible to users on the internet.

Generate a New Private Key and Certificate Signing Request (CSR):

```shell
openssl req -newkey rsa:2048 -nodes -keyout new_server.key -out new_server.csr
```

This command generates a new private key (new_server.key) and a corresponding Certificate Signing Request (new_server.csr) with a key size of 2048 bits. Adjust the key size (e.g., rsa:4096) based on your security requirements.

Submit the CSR to a Certificate Authority (CA):

Submit the generated CSR (new_server.csr) to a trusted Certificate Authority to obtain a new SSL certificate. If you're using [Let's Encrypt](https://letsencrypt.org/), you can follow their documentation for certificate issuance.

During the configuration with Let's Encrypt, you could choose to install Certbox. To install Certbox you should use snapd, in Debian.

Once snapd is installed, to install certbox, do:

```shell
sudo snap install --classic certbot

sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

Follow the rest of the steps in the Let's Encrypt and Certbox documentation.

Receive the New SSL Certificate:

Once approved, you'll receive a new SSL certificate from the CA.

Test the new server configuration (in the Commbase environment commbase_env):

```python
python server_https_fqdn_signed_cert_websocket.py
```

If your server is asking for a passphrase every time it starts, it's likely because the private key is still encrypted with a passphrase.

To remove the passphrase from the private key:

```shell
cd /path/to/the/server/key/
openssl rsa -in server.key -out server.key
```

Alternatively, if you want to keep a backup of the original key with the passphrase, you can use the following commands:

```shell
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key
```

This way, you have the original key (server.key.org) with a passphrase and a new key (server.key) without a passphrase.

### Verify the server side configuration

Test the new server configuration (in the Commbase environment commbase_env):

```python
python server_https_localhost_local_ca_websocket.py
```

### The server is asking for a passphrase

If your server is asking for a passphrase every time it starts, it's likely because the private key is still encrypted with a passphrase.

To remove the passphrase from the private key (.key or .pem):

```shell
cd /path/to/the/server/key/
openssl rsa -in server.key -out server.key
```

Alternatively, if you want to keep a backup of the original key with the passphrase, you can use the following commands:

```shell
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key
```

This way, you have the original key (server.key.org) with a passphrase and a new key (server.key) without a passphrase.

### Set up the appropriate upload file in the server

Almost every template file in the directory **bundles/commbase-data-exchange/server/templates** has a specific uploader file in the same directory:

The file **server_https_fqdn_signed_cert_websocket.py** requires the file **uploader_https_fqdn_signed_cert_websocket.py**.

The file **server_https_localhost_local_ca_websocket.py** requires the file **uploader_https_localhost_local_ca_websocket.py**.

The file **server_http_websocket.py** requires the file **uploader_http_websocket.py**.

The file **uploader_https_false_cert_verification.py** can be used as an uploader without certificate verification.

In continuation with the example, let's use the file **uploader_https_localhost_local_ca_websocket.py** for **server_https_localhost_local_ca_websocket.py**.

Paste a copy of the template file in the Commbase directory **bundles/commbase-data-exchange/server/**.

The only things you could change to reconfigure this file are these two:

```python
# Define the API endpoint (HTTP or HTTPS)
api_url = 'https://127.0.0.1:5000/api/save_json'  # For HTTPS

# Path to the CA certificate file (change this to the actual path)
ca_cert_path = 'certificates/ca.pem'
```

### Set up the client side configuration

#### The client file in the client

Every template file in the directory **bundles/commbase-data-exchange/server/templates** has a specific upload file in the directory **bundles/commbase-data-exchange/client/templates**:

The file **server_https_fqdn_signed_cert_websocket.py** requires the file **client_https_fqdn_signed_cert_websocket.py**.

The file **server_https_localhost_local_ca_websocket.py** requires the file **client_https_localhost_local_ca_polling.py**. This file is used instead of the file **client_https_localhost_local_ca_websocket.py**, because this last file does not keep the websocket connection open, probably due to the local CA cert used instead of a cert from a trusted CA. The provided code utilizes a polling mechanism to periodically fetch updates from the commbase-data-exchange server. The polling is achieved through the use of the schedule library, which schedules the execution of the get_updated_data function at specified time intervals.

The file **server_http_websocket.py** requires the file **client_http_websocket.py**.

In continuation with the example, let's use the file **client_https_localhost_local_ca_polling.py** for **server_https_localhost_local_ca_websocket.py**.

Paste a copy of the template file in the Commbase directory **bundles/commbase-data-exchange/server/**.

The only things you could change to reconfigure this file are these three:

```python
# Define the API endpoint to retrieve saved JSON data
api_url = 'https://127.0.0.1:5000/api/get_saved_data'

# Define the WebSocket endpoint
socketio_url = 'https://127.0.0.1:5000'
# socketio_url = 'ws://127.0.0.1:5000'

# Path to the CA certificate file (change this to the actual path)
ca_cert_path = './certificates/ca.pem'
```

#### The uploader file in the client

Almost every template file in the directory **bundles/commbase-data-exchange/client/templates** has a specific uploader file in the same directory:

The file **server_https_fqdn_signed_cert_websocket.py** requires the file **uploader_https_fqdn_signed_cert_websocket.py**.

The file **server_https_localhost_local_ca_websocket.py** requires the file **uploader_https_localhost_local_ca_websocket.py**.

The file **server_http_websocket.py** requires the file **uploader_http_websocket.py**.

The file **uploader_https_false_cert_verification.py** can be used as an uploader without certificate verification in case we are testing/using HTTPS in the localhost in the role of client, but cannot be used to connect to the server from different hosts because the sever will reject the connection as insecure.

In continuation with the example, let's use the file **uploader_https_localhost_local_ca_websocket.py** for **server_https_localhost_local_ca_websocket.py**.

Paste a copy of the template file in the Commbase directory **bundles/commbase-data-exchange/client/**.

The only things you could change to reconfigure this file are these two:

```python
# Define the API endpoint (HTTP or HTTPS)
api_url = 'https://127.0.0.1:5000/api/save_json'  # For HTTPS

# Path to the CA certificate file (change this to the actual path)
ca_cert_path = 'certificates/ca.pem'
```

## Set up the commbase-data-exchange-variables in the Commbase config file commbase.conf:

The commbase-data-exchange variables in **config/commbase.conf** are:

```plaintext
COMMBASE_DATA_EXCHANGE_SERVER_HOST_ADDRESS="127.0.0.1"
COMMBASE_DATA_EXCHANGE_SERVER_PORT="5000"
COMMBASE_DATA_EXCHANGE_SERVER_CONNECTION_FILE_PATH="$COMMBASE_APP_DIR/bundles/commbase-data-exchange/server/server_http_websocket.py"
COMMBASE_DATA_EXCHANGE_SERVER_UPLOADER_FILE_PATH="$COMMBASE_APP_DIR/bundles/commbase-data-exchange/server/uploader_http_websocket.py"
COMMBASE_DATA_EXCHANGE_CLIENT_CONNECTION_FILE_PATH="$COMMBASE_APP_DIR/bundles/commbase-data-exchange/client/client_http_websocket.py"
COMMBASE_DATA_EXCHANGE_CLIENT_UPDATER_FILE_PATH="$COMMBASE_APP_DIR/bundles/commbase-data-exchange/client/updater_http_websocket.py"
CLIENT_POLLING_INTERVAL_IN_SECS="5"
CERTS_AND_KEYS_SERVER_CRT_FILE="/certificates/server.crt"
CERTS_AND_KEYS_SERVER_KEY_FILE="/certificates/server.key"
CERTS_AND_KEYS_CERT_PEM_FILE="/certificates/cert.pem"
CERTS_AND_KEYS_KEY_PEM_FILE="/certificates/key.pem"
CERTS_AND_KEYS_CA_PEM_FILE="/certificates/ca.pem"
```

They are all documented in the section **8 Configuration Variables** in this [`document`](./User%27s%20Guide.md)
