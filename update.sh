#!/bin/bash

target_location=$(pwd)
variant=$1

# Checks if previous file exists
if [ -f /workspaces/previous_checksum.txt ]; then
    # If it does, it reads the previous checksum
    previous_checksum=$(cat /workspaces/previous_checksum.txt)
else
    # If it doesn't, it creates a new file
    touch /workspaces/previous_checksum.txt
    # And sets the previous checksum to 0
    previous_checksum=0
fi

# get latest release checksum
current_checksum=$(gh release view --json 'assets[0].checksum' --repo froland/devcontainers)

# Checks if the checksums are different
if [ "$previous_checksum" != "$current_checksum" ]; then
    # If they are, it downloads the latest release
    gh release download -O /workspaces/devcontainers_latest.tar.gz --archive=tar.gz --clobber --repo froland/devcontainers
    # And updates the previous checksum
    echo "$current_checksum" > /workspaces/previous_checksum.txt

    # Unpacks the release in temporary folder
    mkdir /workspaces/devcontainers_temp
    tar -xzf /workspaces/devcontainers_latest.tar.gz -C /workspaces/devcontainers_temp

    # Refresh refresh script
    cp /workspaces/devcontainers_temp/refresh.sh $target_location
    chmod +x $target_location/refresh.sh
    exec $target_location/refresh.sh $variant
fi


