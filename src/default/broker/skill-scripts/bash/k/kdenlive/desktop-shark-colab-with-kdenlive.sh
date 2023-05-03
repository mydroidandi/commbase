#!/bin/bash
# File: desktop-shark-colab-with-kdenlive.sh
# Description: Script to create a Google COLAB server in about 1 hour, to be used as development computer

# Get the server up and running:
# Video source: https://www.youtube.com/watch?app=desktop&v=6UKDEGEfInU
# Install the server: 
# https://colab.research.google.com/github/PradyumnaKrishna/Colab-Hacks/blob/master/Colab%20RDP/Colab%20RDP.ipynb#scrollTo=UoeBdz6_KE6a

# Commands required to prepare the server
sudo apt-get update
sudo apt-get -u upgrade
sudo apt install nano
sudo apt install gdebi

# The next 2 lines don't work (anyway probably requires a logout 
# which is impossible here, and also there is not systemd here!!!)
#sudo apt install snapd
#sudo snap install kdenlive
sudo apt install kdenlive

# Next steps:
# Upload the video files to the KDE library, using the Google Chrome Remote Desktop app or Chrome extension
# (if they cannot be downloaded with wget or curl).
# I MUST DOWNLOAD THE VIDEO REELS USING THE SERVER BROWSER FOR EXAMPLE, FROM YOUTUBE, DUE TO
# THE LIMIT TO UPLOAD FROM CHROME REMOTE DESKTOP IS 500 MB PER FILE. SSH DOESN'T WORK OUT OF THE BOX.
# ALTERNATIVES: SETUP FTP SERVER WHICH IS SLOW, DOWNLOAD FROM GOOGLE DRIVE OR ONE DRIVE, ETC.
# I must edit the video, render the project and upload it on YouTube.com (or download it locally)
# it before 12 hours passed when the server goes down.

