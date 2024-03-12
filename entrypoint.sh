#!/bin/bash

# Check if all three arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input> <input_file_name> <output_file_name>"
    exit 1
fi

# Extract arguments
INPUT_INPUT_FILE_NAME=$1
INPUT_ENRICHER=$2
INPUT_OUTPUT_FILE_NAME=$3

# Construct command
full_command="parlay $INPUT_ENRICHER enrich $INPUT_INPUT_FILE_NAME > $INPUT_OUTPUT_FILE_NAME"
eval "$full_command"

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Command executed successfully: $full_command"
    cat $INPUT_OUTPUT_FILE_NAME
else
    echo "Error executing command: $full_command"
fi