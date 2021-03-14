#!/bin/bash

if screen -ls | grep -q "unturned"; then
  echo "Saving server"
  echo "Data:" `date`
  screen -S unturned -p 0 -X stuff "save^M"
else
  echo "Server is not running"
fi
