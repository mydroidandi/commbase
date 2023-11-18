#!/usr/bin/env python
################################################################################
#                                   Commbase                                   #
#                                                                              #
# Conversational AI Assistant and AI Hub for Computers and Droids              #
#                                                                              #
# Change History                                                               #
# 10/21/2023  Esteban Herrera Original code.                                   #
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

"""
reading_text_from_image.py
--------------------------
Extracts text from an image using Tesseract OCR.
This script is designed for extracting text from image or screenshots taken with
desktop screenshot software.

System Requirements (Debian GNU/Linux):
- Install Tesseract OCR:
  sudo apt-get install tesseract-ocr
- Install OpenCV:
  sudo apt-get install python3-opencv

Dependencies:
- cv2 (OpenCV)
- argparse
- pytesseract
- PIL (Pillow)

Usage:
python reading_text_from_image.py --image path_to_image

Arguments:
  -i, --image    Path to the image file to process.

"""

# Import the necessary packages
import cv2
import os
import argparse
import pytesseract
from PIL import Image

# Construct an Argument Parser
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required=True, help="Path to the image folder")
ap.add_argument(
    "-p", "--pre_processor", default="thresh", help="the preprocessor usage"
)
args = vars(ap.parse_args())

# Read the image with text
images = cv2.imread(args["image"])

# Convert to grayscale image
gray = cv2.cvtColor(images, cv2.COLOR_BGR2GRAY)

# checking whether thresh or blur
if args["pre_processor"] == "thresh":
    cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)[1]
if args["pre_processor"] == "blur":
    cv2.medianBlur(gray, 3)

# memory usage with image i.e. adding image to memory
filename = "{}.jpg".format(os.getpid())
cv2.imwrite(filename, gray)
text = pytesseract.image_to_string(Image.open(filename))
os.remove(filename)
print("Extracted text ...")
print("")
print(text)
print("")
print("")
print("Press 'q' to exit the program.")

# Show the output images
cv2.imshow("Image Input", images)
cv2.imshow("Output In Grayscale", gray)
# cv2.waitKey(0)

# Create a loop that checks for a key press every 1000 milliseconds (1 second).
# If the 'q' key is pressed during this interval, the loop exits, allowing you
# to close the OpenCV window.
while True:
    key = cv2.waitKey(1000)  # Check for a key press every 1000 millisecond

    if key == ord("q"):  # If the 'q' key is pressed, exit the loop
        break
