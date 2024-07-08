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

# 02_create_and_configure_pinecone_index.py
# Creates and configures a new Pinecone index named 'new-pinecone-index'

# Imports
import functions
import time
from pinecone import Pinecone, ServerlessSpec

# Call test_embedding_model()
model, xq = functions.test_embedding_model()

# Print the model details
print("Model: ", model)

# Print the dimensions of the embedding vector
print("Single query dimensions:", xq.shape)

# Initialize the Pinecone client with your API key
pc = Pinecone(api_key="")

# Define the cloud provider and region
cloud = 'aws'
region = 'us-east-1'
spec = ServerlessSpec(cloud=cloud, region=region)

index_name = 'commbase-log-chats'

# Check if index already exists (it shouldn't if this is first time)
if index_name not in pc.list_indexes().names():
    # If does not exist, create index
    pc.create_index(
        index_name,
        dimension=model.get_sentence_embedding_dimension(),
        metric='cosine',
        spec=spec
    )
    # Wait for index to be initialized
    while not pc.describe_index(index_name).status['ready']:
        time.sleep(1)

# Connect to index and print the index statistics
index = pc.Index(index_name)
print("")
print("Index statistics:")
print(index.describe_index_stats())
