#!/bin/bash

if screen -ls | grep -q "unturned"; then
  echo "Stopping server..."
  screen -S unturned -X quit
else
  echo "Server is not running"
fi
