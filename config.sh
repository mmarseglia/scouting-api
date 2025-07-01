#!/usr/bin/env bash

# Save and set safe shell options
SAVED_OPTIONS="$(set +o)"
set -uo pipefail
trap 'eval "$SAVED_OPTIONS"' RETURN

# This script must be sourced to set environment variables in the parent shell.
# Usage:
#   export SCOUT_USERNAME=<username>
#   export SCOUT_PASSWORD=<password>
#   source config.sh

# Ensure the username and password are provided via environment variables
if [ -z "${SCOUT_USERNAME:-}" ] || [ -z "${SCOUT_PASSWORD:-}" ]; then
    echo "Error: SCOUT_USERNAME and SCOUT_PASSWORD must be set before sourcing this script."
    return 1  # Use 'return' instead of 'exit' to avoid killing the parent shell
fi

# Verify dependencies
for cmd in curl jq; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: $cmd is required but not installed." >&2
        return 1
    fi
done
unset cmd  # Unset the loop variable for cleanliness

# Construct the login URL dynamically based on the username
LOGIN_URL="https://my.scouting.org/api/users/${SCOUT_USERNAME}/authenticate"

# Send the login request using curl
RESPONSE=$(curl -s --fail -X POST "$LOGIN_URL" \
    -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -H "Accept: application/json; version=2" \
    --data-urlencode "password=$SCOUT_PASSWORD")

# Extract the Bearer token and userId from the JSON response using jq
BEARER_TOKEN=$(echo "$RESPONSE" | jq -r '.token')
USER_ID=$(echo "$RESPONSE" | jq -r '.account.userId')

# Check if the token and userId were found
if [ "$BEARER_TOKEN" != "null" ] && [ "$USER_ID" != "null" ]; then
    # Set the environment variables
    export userId="$USER_ID"
    export TOKEN="$BEARER_TOKEN"
    
    # Optionally output the variables for debugging
    # echo "Bearer Token: $TOKEN"
    # echo "User ID: $USER_ID"
    
    # Unset intermediate variables for cleanliness
    unset RESPONSE
    unset BEARER_TOKEN
    unset USER_ID
    unset SCOUT_USERNAME
    unset SCOUT_PASSWORD
else
    echo "Failed to retrieve Bearer token or User ID."
    return 1
fi
