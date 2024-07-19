#!/usr/bin/env python
################################################################################
#        commbase-genai-slm-ollama-phi3-mini-memory-remote-rag-pinecone        #
#                                                                              #
# A sophisticated AI assistant's Small Language Model (Phi3), enhanced by      #
# Retrieval-Augmented Generation (RAG) for improved response accuracy, and     #
# supported by a Pinecone semantic vector database.                            #
#                                                                              #
# Change History                                                               #
# 07/14/2024  Esteban Herrera Original code.                                   #
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

# phi3_mini_translate_language.py
# Translates text from one language to another using the Ollama API with a
# specific model ('commbase-phi3-mini').

# Imports
import ollama


def generate_translation(text_to_translate, from_language, to_language):
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
