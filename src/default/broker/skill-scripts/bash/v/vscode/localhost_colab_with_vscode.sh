#!/bin/bash
# File: desktop-shark-colab-with-vscode.sh
# Description: Script to create a Google COLAB server in about 1 hour, to be used as development computer

# Get the server up and running:
# Video source: https://www.youtube.com/watch?app=desktop&v=6UKDEGEfInU
# Install the server: https://colab.research.google.com/github/PradyumnaKrishna/Colab-Hacks/blob/master/Colab%20RDP/Colab%20RDP.ipynb#scrollTo=UoeBdz6_KE6a

# Upload the packages using the Google Chrome Remote Desktop app or Chrome extension
# (if they cannot be downloaded with wget or curl):
# code-insiders_1.64.0-1641550672_amd64.deb: This is to sync my VS Code account using Google.
# Specific config files for /home/esteban/ (may vary from Debian 10 (guest) to Ubuntu 18.04 (COLAB server)), so
# they must be tested.
sudo apt-get update
sudo apt-get -u upgrade
sudo apt install gdebi
sudo gdebi code-insiders_1.64.0-1641550672_amd64.deb
#
# TODO:
#
# Setup the environment for JS development with extensions.
# For example, install: nvm (for nodejs), npm, npm packages such as prettier and ESLint
#
# Upload specific config files for /home/esteban/
#
# sync the VS code using (Sync extension) using my Github account
#
# Clone the current repo we are working with from gitbhub.com. This is
# a problem because I can't keep untracked files on local, due to the server
# will last for 12 hours, unless I use google drive account as the server drive space
