#!/bin/bash
# File: server-shark2-run-honeygain.sh
# Description: Script to run Honeygain in the server running xserver

# Requires wine and Honeygain up and ready to re-run.
# Requires ssh (Openssh) set up with xforwarding in both machines (client and server).
# Because of the X is forwarded to the local machine, the status
# icon appears in the local task mananger which is good for local monitoring.

# Run from the server host as user with wine and existent Honeygain installation.
wine $HOME/.wine/drive_c/users/$USER/AppData/Roaming/Honeygain/Honeygain.exe
# Previous wine or Honeygain versions path:
#wine $HOME/.wine/drive_c/users/$USER/Application\ Data/Honeygain/Honeygain.exe

