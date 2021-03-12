# It's recommend to install on Ubuntu 16.04 LTS

# Variables
ROOTDIR="$PWD"
STEAMDIR=$ROOTDIR/SteamCMD
STEAMSDKDIR=$HOME/.steam/sdk64/
UNTURNEDDIR=$ROOTDIR/unturned

# Install dependencies
sudo apt update -y && sudo apt upgrade -y
sudo apt install screen htop unzip -y
sudo apt install lib32stdc++6 -y
sudo apt install mono-runtime mono-reference-assemblies-2.0 -y
sudo apt install libc6 libgl1-mesa-glx libxcursor1 libxrandr2 -y
sudo apt install libc6-dev libgcc-4.8-dev -y

# Install steam
mkdir $STEAMDIR
cd $STEAMDIR
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -
cd $ROOTDIR

# Install unturned
mkdir $UNTURNEDDIR
$STEAMDIR/steamcmd.sh +login anonymous +force_install_dir $UNTURNEDDIR +app_update 1110390 +quit

# Fixing steamcli.so
mkdir $STEAMSDKDIR
ln -s $UNTURNEDDIR/linux64/steamclient.so $STEAMSDKDIR
