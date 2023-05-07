#!/usr/bin/env bash
################################################################################
#                                   Commbase                                   #
#                                                                              #
# Conversational AI Assistant and AI Hub for Computers and Droids              #
#                                                                              #
# Change History                                                               #
# 04/29/2023  Esteban Herrera Original code.                                   #
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

# localhost_colab_with_kdenlive.sh
# Script to create a Google COLAB server in about 1 hour, to be used as development computer

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

