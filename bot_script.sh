#!/bin/bash

# Set your Telegram bot token and chat ID here
BOT_TOKEN="YOUR_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"

# Get the current public IP address
CURRENT_IP=$(curl -s http://api.ipify.org)

# Read the previous IP address from a file
PREVIOUS_IP=$(cat previous_ip.txt)

# Compare the current IP address with the previous IP address
if [ "$CURRENT_IP" != "$PREVIOUS_IP" ]; then
  # Save the new IP address to the file
  echo "$CURRENT_IP" > previous_ip.txt
  
  # Send a message to Telegram
  MESSAGE="The public IP address has changed to $CURRENT_IP"
  curl -s -X POST https://api.telegram.org/bot$BOT_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi
