#!/bin/bash

target_location=$(pwd)
variant=$1

# Checks if previous file exists
if [ -f /workspaces/previous_timestamp.txt ]; then
    # If it does, it reads the previous timestamp
    previous_timestamp=$(cat /workspaces/previous_timestamp.txt)
else
    # If it doesn't, it creates a new file
    touch /workspaces/previous_timestamp.txt
    # And sets the previous timestamp to 0
    previous_timestamp=0
fi

# get latest release timestamp
current_timestamp=$(curl -s https://api.github.com/repos/froland/devcontainers/releases/latest | jq -r '.created_at')

# Checks if the timestamps are different
if [ "$previous_timestamp" != "$current_timestamp" ]; then
    # If they are, it downloads the latest release
    wget -O /workspaces/devcontainers_latest.tar.gz https://github.com/froland/devcontainers/releases/latest
    # And updates the previous timestamp
    echo "$current_timestamp" > /workspaces/previous_timestamp.txt

    # Unpacks the release in temporary folder
    mkdir -p /workspaces/devcontainers_temp
    tar -xzf /workspaces/devcontainers_latest.tar.gz -C /workspaces/devcontainers_temp

    # Refresh refresh script
    cp /workspaces/devcontainers_temp/refresh.sh $target_location
    chmod +x $target_location/refresh.sh
    exec $target_location/refresh.sh $variant
fi


