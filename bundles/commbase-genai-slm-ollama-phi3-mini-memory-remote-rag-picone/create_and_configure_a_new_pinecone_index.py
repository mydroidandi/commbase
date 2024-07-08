#!/usr/bin/env python
################################################################################
#         commbase-genai-slm-ollama-phi3-mini-memory-remote-rag-picone         #
#                                                                              #
# A sophisticated AI assistant's Small Language Model (Phi3), enhanced by      #
# Retrieval-Augmented Generation (RAG) for improved response accuracy, and     #
# supported by a Picone semantic vector database.                              #
#                                                                              #
# Change History                                                               #
# 06/25/2024  Esteban Herrera Original code.                                   #
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

# create_and_configure_a_new_Pinecone_index.py
# Creates and configures a new Pinecone index named 'new-pinecone-index'

# Imports
from pinecone import Pinecone, ServerlessSpec

# Initialize the Pinecone client with your API key
pc = Pinecone(api_key="")

# Create Pinecone index
pc.create_index(
    name='new-pinecone-index',
    dimension=384,  # dimensionality of minilm
    metric='dotproduct',
    spec=ServerlessSpec(cloud='aws', region='us-east-1')
)

# Connect to index and print the index statistics
index = pc.Index("new-pinecone-index")
print(index.describe_index_stats())
