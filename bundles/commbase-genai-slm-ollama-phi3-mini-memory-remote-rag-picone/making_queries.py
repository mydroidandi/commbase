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

# 04_making_queries.py
# Desc

# Imports
import functions
import json
import sentence_transformers
# import time
from pinecone import Pinecone, ServerlessSpec


# Call test_embedding_model()
model, xq = functions.test_embedding_model()


# Initialize the Pinecone client with your API key
pc = Pinecone(api_key="")

index_name = 'commbase-log-chats'

# Connect to index and print the index statistics
index = pc.Index(index_name)


# query = "Who is Eva?"
query = "What happened at 20:35:08?"
# query = "What is the meaning of zero day?"


# ----
# create the query vector
xq = model.encode(query).tolist()

# now query
xc = index.query(vector=xq, top_k=5, include_metadata=True)
print(xc)

print("")
print(query)

# In the returned response xc we can see the most relevant questions to our particular query. We can reformat this response to be a little easier to read
# for result in xc['matches']:
#     print(f"{round(result['score'], 2)}: {result['metadata']['text']}")

# Print the 'speaker' and 'text' along with the score
for result in xc['matches']:
    score = round(result['score'], 2)
    timestamp = result['metadata']['timestamp']
    speaker = result['metadata']['speaker']
    text = result['metadata']['text']
    print(f"{score}: {timestamp} {speaker}: {text}")


# ## Add this to the prompt:
# ## Please keep your responses to a maximum of three to four sentences.
