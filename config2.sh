#!/bin/bash

# This script must be sourced to set environment variables in the parent shell.
# Usage: source config2.sh <username> <password>

# Check if both username and password are provided as command-line arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: source $0 <username> <password>"
    return 1  # Use 'return' instead of 'exit' to avoid killing the parent shell
fi

# Fetch the username and password from the command-line arguments
USERNAME=$1
PASSWORD=$2

# Construct the login URL dynamically based on the username
LOGIN_URL="https://my.scouting.org/api/users/${USERNAME}/authenticate"

# Send the login request using curl
RESPONSE=$(curl -s -X POST "$LOGIN_URL" \
    -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -H "Accept: application/json; version=2" \
    --data-urlencode "password=$PASSWORD")

# Extract the Bearer token and userId from the JSON response using jq
BEARER_TOKEN=$(echo "$RESPONSE" | jq -r '.token')
USER_ID=$(echo "$RESPONSE" | jq -r '.account.userId')

# Check if the token and userId were found
if [ "$BEARER_TOKEN" != "null" ] && [ "$USER_ID" != "null" ]; then
    # Set the environment variables
    export userId="$USER_ID"
    export TOKEN="$BEARER_TOKEN"
    
    # Output the variables
    echo "Bearer Token: $TOKEN"
    echo "User ID: $USER_ID"
    
    # Unset intermediate variables for cleanliness
    unset RESPONSE
    unset BEARER_TOKEN
    unset USER_ID
else
    echo "Failed to retrieve Bearer token or User ID."
    return 1
fi
