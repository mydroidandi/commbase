#!/usr/bin/env python
################################################################################
#                                   Commbase                                   #
#                                                                              #
# Conversational AI Assistant and AI Hub for Computers and Droids              #
#                                                                              #
# Change History                                                               #
# 05/05/2023  Esteban Herrera Original code.                                   #
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

# localhost_resizable_camera_capture.py
# Opens the resizable camera 01 capture by its camera id

import cv2
import os

def get_video_capture_device_index():
	""" Gets the video capture device index from the config file """
	# Specify the path of the env file containing the variable
	file_path = os.environ["COMMBASE_APP_DIR"] + '/config/commbase.conf'

	# Open the file and read its contents
	with open(file_path, 'r') as f:
		for line in f:
			# Split the line into variable name and value
			variable_name, value = line.strip().split('=')

			# Check if the variable we are looking for exists in the line
			if variable_name == 'MY_APP_VIDEO_CAPTURE_DEVICE_01_INDEX':
				# Remove the quotes from the value of the variable
				VIDEO_CAPTURE_DEVICE_INDEX = value.strip()[1:-1]
				return int(VIDEO_CAPTURE_DEVICE_INDEX)

	# If the variable is not found, return None
	return None


def open_camera(VIDEO_CAPTURE_DEVICE_INDEX):
	""" Opens the camera device capture """
	# Open a camera capture object
	cap = cv2.VideoCapture(VIDEO_CAPTURE_DEVICE_INDEX)  # Use camera index 0 for the default camera

	# Check if camera opened successfully
	if not cap.isOpened():
		print("Failed to open camera")
		exit(1)

	# Define the desired window width and height
	window_width = 640
	window_height = 480

	# Create a named window with the desired size
	cv2.namedWindow("Camera", cv2.WINDOW_NORMAL)
	cv2.resizeWindow("Camera", window_width, window_height)

	while True:
		# Capture frame-by-frame
		ret, frame = cap.read()

		# Check if frame was captured successfully
		if not ret:
			print("Failed to capture frame")
			break

		# Display the frame
		cv2.imshow("Camera", frame)

		# Exit the loop if 'q' key is pressed
		if cv2.waitKey(1) & 0xFF == ord('q'):
			break

	# Release the camera capture object
	cap.release()

	# Close all OpenCV windows
	cv2.destroyAllWindows()


def local_host_camera_capture():
	""" Main call """
	# Get the video capture device index
	video_capture_device = get_video_capture_device_index()

	# Open the camera
	open_camera(video_capture_device)

local_host_camera_capture()
