#!/usr/bin/env bash

echo "| Variable | Description |"
echo "|----------|-------------|"

# Read the config file line by line
while IFS= read -r line; do
    if [[ $line == \#* ]]; then
        # Extract comment as description
        description=${line#\# }
    elif [[ $line == *=* ]]; then
        # Extract variable name
        var_name=${line%%=*}
        echo "| $var_name | $description |"
        description="" # Reset description for the next variable
    fi
done < config.sh
