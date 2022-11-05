#!/bin/bash
# File: desktop-shark-copy-multiple-files-to-server-shark2.sh
# Description: Script to ssh copy multiple files to the server in the user's home directory
# from the relative directory (from source to destiny.)

REMOTEUSER="esteban"
REMOTEHOST="192.168.100.45"
#REMOTEHOST="shark2"

WILDCARD="server*.sh"
REMOTEDIRECTORY=$HOME

scp $WILDCARD $REMOTEUSER@$REMOTEHOST:$REMOTEDIRECTORY
#scp ProtonVPN_server_configs.zip esteban@192.168.100.45:~/
#scp protonvpn-stable-release_1.0.1-1_all.deb esteban@192.168.100.45:~/
#scp Honeygain_install.exe esteban@192.168.100.45:~/
#scp server-run-honeygain-pollen-light.sh server-run-honeygain-pollen-heavy.sh server-run-honeygain.sh server-run-protonvpn-CLI.sh server-run-protonvpn-no-CLI-prompts.sh server-run-sync-live-server.sh esteban@192.168.100.45:~/
#scp server*.sh esteban@192.168.100.45:~/
