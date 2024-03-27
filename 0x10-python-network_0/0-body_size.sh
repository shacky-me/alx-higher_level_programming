#!/bin/bash

# Check if a URL argument is provided
if [ -z "$1" ]; then
  echo "Error: Please provide a URL as the first argument."
  exit 1
fi

# Send a silent request to the URL with curl and capture the response body
response=$(curl -s "$1")

# Check for successful request (exit code 0 from curl)
if [ $? -ne 0 ]; then
  echo "Error: Failed to send request to '$1'."
  exit 1
fi

# Get the size of the response body in bytes (excluding headers)
body_size=$(echo -n "$response" | wc -c)

# Display the body size
echo "The response body size is: $body_size bytes"

