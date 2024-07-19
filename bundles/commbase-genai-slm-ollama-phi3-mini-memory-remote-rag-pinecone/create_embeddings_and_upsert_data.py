#!/usr/bin/env python
################################################################################
#        commbase-genai-slm-ollama-phi3-mini-memory-remote-rag-pinecone        #
#                                                                              #
# A sophisticated AI assistant's Small Language Model (Phi3), enhanced by      #
# Retrieval-Augmented Generation (RAG) for improved response accuracy, and     #
# supported by a Pinecone semantic vector database.                            #
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

# create_embeddings_and_upsert_data.py
# Creates and configures a new Pinecone index named 'new-pinecone-index'

# Imports
import functions
import json
import pandas as pd
import sentence_transformers
# import time
from pinecone import Pinecone, ServerlessSpec
from tqdm.auto import tqdm

# Load dataset


# df = pd.read_csv('./build/dataset.json')
df = pd.read_json('./build/dataset.json')

# Print the top 10 rows (or all rows if there are less than 10)
print(df.head(10))

# Get the total number of rows
total_rows = len(df)

# Print the total number of rows
print(f"Total rows in the DataFrame: {total_rows}")

# See the raw data in the JSON file as it is, without converting it to a DataFrame


# Read the JSON file
with open('./build/log_chats.json', 'r') as file:
    data = json.load(file)

# Print the raw JSON data
print(json.dumps(data, indent=4))

# Extract and print each text content on a new line similarly to
# 'for record in dataset['object_name']:'.
# for chat in data['log_chats']:
#     print(chat['text'])

# Extract and print each text content on a new line, limit to 5 lines

for i, chat in enumerate(data['log_chats']):
    if i >= 5:
        break
    print(chat['text'])

# Building Embeddings and Upsert Format


# Call test_embedding_model()
model, xq = functions.test_embedding_model()

# Print the model details
print("Model: ", model)

# Print the dimensions of the embedding vector
print("Single query dimensions:", xq.shape)

# Now we upsert the data, we will do this in batches of 128.
# Note: On Google Colab with GPU expected runtime is ~7 minutes. If using CPU this will be significantly longer.

# Initialize the Pinecone client with your API key
pc = Pinecone(api_key="")

index_name = 'commbase-log-chats'

# Connect to index and print the index statistics
index = pc.Index(index_name)


batch_size = 10
# batch_size = 128
vector_limit = 50
# vector_limit = 100000

# Extract the first 50 entries into a variable similarly to
# 'dataset = dataset[:vector_limit]'.
entries = data['log_chats'][:50]

# Print the first 50 entries (optional)
for entry in entries:
    print(entry)

# Now you can use `entries` variable in your code
print("Number of entries:", len(entries))


for i in tqdm(range(0, len(entries), batch_size)):
    # find end of batch
    i_end = min(i+batch_size, len(entries))
    # create IDs batch
    ids = [str(x) for x in range(i, i_end)]
    # create metadata batch
    # v1 - constructing metadatas as a list of dictionaries, each containing a 'text' key whose value is a dictionary ({'text': text}), rather than just a string.
    # metadatas = [{'text': text} for text in entries[i:i_end]]
    # v2 - this assumes that each chat object within entries has a 'text' key, and you're extracting its value (text['text']) to be used as the metadata.
    # metadatas = [{'text': text['text']} for text in entries[i:i_end]]
    # Adding multiple metadata fields
    metadatas = [
        {
            'id': text['id'],
            'timestamp': text['timestamp'],
            'origin': text['origin'],
            'severity': text['severity'],
            'speaker': text['speaker'],
            'text': text['text']
        }
        for text in entries[i:i_end]
    ]
    # create embeddings
    xc = model.encode(entries[i:i_end])
    # create records list for upsert
    records = zip(ids, xc, metadatas)
    print(records)
    # upsert to Pinecone
    index.upsert(vectors=records)

# Check number of records in the index
print("")
print("Index statistics:")
print(index.describe_index_stats())
