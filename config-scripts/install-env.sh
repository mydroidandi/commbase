#!/bin/env bash
# install-env.sh
# Creates a default file .env.

# Copy the content of cat to commbase/ENV/.env
cd ../ENV
touch .env
cat <<EOT >> .env
PROTONVPN_CLI_USERNAME="Tony_St4rk"
PROTONVPN_CLI_PASSWORD="PASSWORD-NOT-REQUIRED-ONCE-REGISTERED"
PROTONVPN_API_USERNAME="USERNAME-IN-CONFIG-FILE-IN-/ETC/"
PROTONVPN_API_PASSWORD="PASSWORD-IN-CONFIG-FILE-IN-/ETC/"
REMOTE_USER_NAME="tonystark"
DESKTOP_SHARK_IP_ADDRESS="192.168.100.13"
DESKTOP_SHARK_HOSTNAME="shark"
DESKTOP_SHARK_UUID="5ba8f927-d331-471c-b640-812d4680e310"
DESKTOP_SHARK_USER_PASSWD="VARIABLE-UNUSED"
SERVER_SHARK2_IP_ADDRESS="192.168.100.45"
SERVER_SHARK2_HOSTNAME="shark2"
SERVER_SHARK2_UUID="27475487-cab6-4050-9047-9a565e22d2b0"
SERVER_SHARK2_USER_PASSWD="VARIABLE-UNUSED"
DEFAULT_DEV_PROJECT_DIRECTORY_NAME="JSLanguage"
EXTERNAL_STORAGE_DRIVE_01_TAG="WD1"
EXTERNAL_STORAGE_DRIVE_02_TAG="WD2"
EOT

cd ..

exit 99

