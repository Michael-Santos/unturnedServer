# Unturned server

## What is this projet?

The main goal of this projet is help people to easily set up a unturned server.


# Requirements

I tried to keep the installation the simplest as possible.

The only requiment is to run the scripts on Ubuntu 16.04 TSL. I tested the script on newer Ubuntu versions however it sucked installing some libs (If you fell confortable to send a pull request fixing this it would be nice :stuck_out_tongue_winking_eye:)


# Installation

Download the files from this repository and run:

`$ ./installServer.sh`:

What does this script do?

- Installs required libs on Ubuntu
- Creates a folder `SteamCMD` for steam 
- Creates a folder `unturned` for Unturned game

# Scripts
- installServer.sh - Installs the server as explained on last section
- startServer.sh - Starts a screen session called `unturned` running the server
- stopServer.sh - Stops the `unturned` screen sesssion
- updateServer.sh - Checks if the server is up to date. If it is not, so it stops the current server running when applicable and starts it again.

# How to execute commands in unturned server

It is necessary to get in screen section:

`$ screen -r unturned`

After type the command you want then press `Ctrl + A` followed by `d` to detach the screen session.



# Auto update

Change the following line in `updateServer.sh` to the folder where unturned is installed:

`HOMEDIRECTORY="/home/michaelsanttos12"`

We will be needed to create a cronjob that executes each 30 minutos, for example.

To edit the cronjob file execute the following commnad:

`$ crontab -e`

So add the following cronjob to execute the updateServer.sh each 30 minutos and redirects the output in an update.log file.  

`*/30 * * * * {updateServer.sh folder}/updateServer.sh > {updateServer.sh Path}/update.log`