#!/bin/bash

# Server variables
HOMEDIRECTORY="/home/michaelsanttos12"
UNTURNEDDIRECTORY=$HOMEDIRECTORY/unturned
NEWERVERSIONFILE=$HOMEDIRECTORY/newerversion.txt
CURRENTVERSIONFILE=$HOMEDIRECTORY/currentversion.txt
STEAMDIR=$HOMEDIRECTORY/SteamCMD

stopServer() {
  $HOMEDIRECTORY/stopServer.sh
}

startServer() {
  $HOMEDIRECTORY/startServer.sh
}

updateServer() {
  $STEAMDIR/steamcmd.sh +login anonymous +force_install_dir $UNTURNEDDIRECTORY +app_update 1110390 +quit 
}

updateVersionFiles() {
  cat $NEWERVERSIONFILE > $CURRENTVERSIONFILE
}


fetchLastVersion() {
  $STEAMDIR/steamcmd.sh +login anonymous +app_info_update 1 +app_info_print "1110390" +quit | grep -EA 1000 "^\s+\"branches\"$" | grep -EA 5 "^\s+\"public\"$" | grep -m 1 -EB 10 "^\s+}$" | grep -E "^\s+\"buildid\"\s+" | tr '[:blank:]"' ' ' | tr -s ' ' | cut -d ' '  -f3 > $NEWERVERSIONFILE
}


[[ ! -f $NEWERVERSIONFILE ]] && touch $NEWERVERSIONFILE
[[ ! -f $CURRENTVERSIONFILE ]] && touch $CURRENTVERSIONFILE

USER=$LOGNAME
echo "User: "$LOGNAME
echo "Seach for newer version of the game..."
fetchLastVersion
echo "Newer version: ["`cat $NEWERVERSIONFILE`"]"
echo "Current version: ["`cat $CURRENTVERSIONFILE`"]"

# Check if there are game updates
if [ `cat $NEWERVERSIONFILE` -eq `cat $CURRENTVERSIONFILE` ]; then
  echo "Game is already up to date"
else
  stopServer
  echo "Updating server..."
  updateServer
  startServer
  updateVersionFiles
  echo "Update finished!"
fi

echo "Date:"`date`
