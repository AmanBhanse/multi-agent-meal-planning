#!/bin/bash

# Function to check if a command exists
command_exists() {
  if command -v "$1"; then
    echo "$1 is installed at: $(command -v "$1")"
    return 0
  else
    echo "$1 is not installed."
    return 1
  fi
}

# Check if the notebook file is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <notebook_file.ipynb>"
  exit 1
fi

# Assign the notebook file to a variable
NOTEBOOK_FILE="$1"

# Check if the file exists
if [ ! -f "$NOTEBOOK_FILE" ]; then
  echo "Error: File '$NOTEBOOK_FILE' not found!"
  exit 1
fi

# Check if Python is installed
if ! command_exists python && ! command_exists python3; then
  echo "Error: Python is not installed. Please install Python first."
  exit 1
fi

# Check if nbstripout is installed
if ! command_exists nbstripout; then
  echo "nbstripout is not installed. Installing it now..."
  pip install nbstripout
  if ! command_exists nbstripout; then
    echo "Error: Failed to install nbstripout. Please install it manually using 'pip install nbstripout'."
    exit 1
  fi
fi

# Run nbstripout on the notebook file
echo "Cleaning notebook: $NOTEBOOK_FILE"
nbstripout "$NOTEBOOK_FILE"

# Check if the cleaning was successful
if [ $? -eq 0 ]; then
  echo "Notebook cleaned successfully: $NOTEBOOK_FILE"
else
  echo "Error: Failed to clean the notebook."
  exit 1
fi