#!/bin/bash

cd unturned
if ! screen -ls | grep -q "unturned"; then
  screen -dmS unturned ./ServerHelper.sh +LanServer/MyServer
  echo "Server is starting..."
else
  echo "Server is already running..."
  echo "[Hint] Run ./stopServer.sh to stop the server and start it again"
fi
