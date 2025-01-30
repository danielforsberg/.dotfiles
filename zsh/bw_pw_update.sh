#!/bin/bash

# Check if Bitwarden CLI is installed
if ! command -v bw &> /dev/null; then
    echo "Error: Bitwarden CLI (bw) is not installed."
    exit 1
fi

# Ensure Bitwarden CLI is logged in and unlocked
if ! BW_SESSION=$(bw unlock --raw); then
    echo "Failed to unlock Bitwarden. Please log in first."
    exit 1
fi
export BW_SESSION

# Prompt user for item name
read -rp "Enter the name of the item to update: " ITEM_NAME

# Search for the item
ITEM_ID=$(bw list items --search "$ITEM_NAME" | jq -r '.[0].id')

# Check if item was found
if [[ -z "$ITEM_ID" || "$ITEM_ID" == "null" ]]; then
    echo "No item found with name: $ITEM_NAME"
    exit 1
fi

# Prompt user for new password
read -rsp "Enter the new password: " NEW_PASSWORD
echo ""

# Retrieve item JSON
ITEM_JSON=$(bw get item "$ITEM_ID")

# Update password field
UPDATED_JSON=$(echo "$ITEM_JSON" | jq -c --arg new_password "$NEW_PASSWORD" '.login.password = $new_password')

# Update item in Bitwarden
echo "$UPDATED_JSON" | bw encode | bw edit item "$ITEM_ID"

echo "Password updated successfully for '$ITEM_NAME'."

# Lock the vault
bw lock