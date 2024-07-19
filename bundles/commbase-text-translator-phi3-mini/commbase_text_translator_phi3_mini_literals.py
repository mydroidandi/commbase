#!/usr/bin/env python
################################################################################
#                      commbase_text_translator_phi3_mini                      #
#                                                                              #
# A simple generative AI assistant using the Phi3 Small Language Model (SLM).  #
#                                                                              #
# Change History                                                               #
# 07/11/2024  Esteban Herrera Original code.                                   #
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

# commbase_text_translator_phi3_mini_literals.py
# Translates text from one language to another using the Ollama API with a
# specific model ('commbase-phi3-mini'). It accepts three command-line
# arguments: the text to translate, the source language, and the target
# language.
# Example usage:
# python commbase_text_translator_phi3_mini_literals.py """Your text containing "quotes" and 'single quotes'.""" english spanish

# Imports
import sys
import ollama


def prompt_user():
    """
    Prompt user for input via command-line arguments.

    Expects three arguments:
        - Text to translate (sys.argv[1])
        - Source language code (sys.argv[2])
        - Target language code (sys.argv[3])

    Prints usage instructions and exits if incorrect number of arguments is
    provided.

    Returns:
        text_to_translate (str): Text to be translated.
        from_language (str): Source language code.
        to_language (str): Target language code.
    """
    # Check if the script received the correct number of arguments
    if len(sys.argv) != 4:
        print("Usage: python script.py \"Text to translate\" from_language to_language")
        sys.exit(1)

    # Get the text to translate and languages from command line arguments
    text_to_translate = sys.argv[1]
    from_language = sys.argv[2]
    to_language = sys.argv[3]

    return text_to_translate, from_language, to_language


def generate_response(text_to_translate, from_language, to_language):
    """
    Generate translated response using the provided text and languages.

    Constructs a prompt for translation and retrieves the response from the
    Ollama API using the 'commbase-phi3-mini' model.

    Args:
        text_to_translate (str): Text to be translated.
        from_language (str): Source language code.
        to_language (str): Target language code.

    Returns:
        str: Translated text response.
    """
    # Generate the response using the provided text and languages
    order = f"Translate this from {from_language} to {to_language} (but do not include any explanation): "
    response = ollama.generate(model='commbase-phi3-mini', prompt=order + text_to_translate)

    # Extract the text response
    return response['response']


def main():
    """
    Main function to orchestrate the translation process.

    Prompts the user for input, generates the translated response, and prints
    the translated text to the terminal.
    """
    # Prompt the user for input
    text_to_translate, from_language, to_language = prompt_user()

    # Generate the response based on the text and languages
    text_response = generate_response(text_to_translate, from_language, to_language)

    # Print the response to the terminal
    print(text_response)


if __name__ == "__main__":
    main()
