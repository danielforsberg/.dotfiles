#!/bin/bash

# Check if Bitwarden CLI is installed
if ! command -v bw &> /dev/null; then
    echo "Error: Bitwarden CLI (bw) is not installed."
    exit 1
fi

# Ensure Bitwarden CLI is logged in and unlocked
if ! BW_SESSION=$(bw unlock --raw); then
    echo "Failed to unlock Bitwarden. Please try again."
    exit 1
fi
export BW_SESSION

if [[ -z "$1" ]]; then
    # Prompt user for item name
    read -rp "Enter the name of the password to copy: " ITEM_NAME
    else
    ITEM_NAME=$1
fi

# Search for the item
ITEM_PASSWORD=$(bw list items --search "$ITEM_NAME" | jq -r '.[0].login.password')

# Copy to clipboard
echo -n "$ITEM_PASSWORD" | pbcopy
echo "Password copied to clipboard."

# Lock the vault
bw lock