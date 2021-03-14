#!/bin/bash

if screen -ls | grep -q "unturned"; then
  echo "Saving server"
  screen -S unturned -p 0 -X stuff "help^M"
  echo "Stopping server..."
  screen -S unturned -X quit
else
  echo "Server is not running"
fi
