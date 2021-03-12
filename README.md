# Unturned server

## What is this projet?

The main goal of this projet is help people to easily set up a unturned server.


# Requirements

I tried to keep the installation the simplest as possible.

The only requiment is to run scripts on Ubuntu 16.04 TSL. I tested the script on newer Ubuntu versions however it sucked installing some libs.


# Installation

Download the files from this repository and run:

`$ ./installServer.sh`:

What does this script do?

- Installs required libs on Ubuntu
- Creates a folder `SteamCMD` for steam 
- Creates a folder `unturned` for Unturned installation

# Scripts
- installServer.sh - Installs the server as explained on last section
- startServer.sh - Starts a screen session called `unturned` running the server
- stopServer.sh - Stops the `unturned` screen sesssion
- updateServer.sh - Checks if the server is up to date. If it is not, so it stops the current server running when applicable and starts it again.

# Auto update

