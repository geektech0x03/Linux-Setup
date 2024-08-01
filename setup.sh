#!/bin/bash

# Only for Kali Linux VM
# BinExp Setup

# Initialization

echo "----- Initializing -----"

clear
mkdir Temp
mkdir CTF
mkdir Script
mkdir Software
mkdir Script/gauto
mkdir Software/IDAFree
touch ./.zsh_aliases

clear

# Installing Dependencies (Some are Specific so might not be updated)

echo "----- Installing Dependencies -----"

sudo apt-get update
sudo apt-get install python3.12 python3.12-venv -y  # SD --> GDB Plugins
sudo apt-get install git ghidra checksec ropper alacarte -y
sudo pip install pwntools

clear

# Chrome Setup

echo "----- Chrome Setup -----"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

clear

# Postman Setup

echo "----- Postman Setup -----"

cd Software
curl -L https://dl.pstmn.io/download/latest/linux64 -o postman-linux-x64.tar.gz
tar -xvf postman-linux-x64.tar.gz

cd ~
clear

# IDA Free Setup

echo "----- IDA Free Setup -----"

cd Temp
wget https://out7.hex-rays.com/files/idafree84_linux.run

cd ~
clear

# Gef, Peda, Pwndbg (GDB Plugins)

echo "----- GDB Plugins Setup -----"

cd ~/Script/ && git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef.git
cd ~/Script/gdb-peda-pwndbg-gef
sudo ./install.sh

cd ~/Script/gdb-peda-pwndbg-gef
./install.sh

cd ~
clear

# Ghidra Script

echo "----- Ghidra Script -----"

cd Script/gauto
git clone https://gist.github.com/liba2k/d522b4f20632c4581af728b286028f8f
mv ./d522b4f20632c4581af728b286028f8f/ghidra.py ./gauto.py

cd ~
clear

# Config Files Setup

echo "----- Config Files ----"

echo 'alias gauto="python3 /home/kali/Script/gauto/gauto.py"' >> ./.zsh_aliases
echo 'alias update="sudo apt-get update && sudo apt-get upgrade"' >> ./.zsh_aliases
echo 'alias idafree="/opt/idafree-8.4/ida64"' >> ./.zsh_aliases
echo 'alias postman="/home/kali/Software/Postman/Postman"' >> ./.zsh_aliases
echo 'source /home/kali/.zsh_aliases' >> ./.zshrc

clear

# Cleaning

echo "---- Cleaning ----"

rm -rf ./Script/gauto/d522b4f20632c4581af728b286028f8f
rm google-chrome-stable_current_amd64.deb
rm ./Software/postman-linux-x64.tar.gz
sudo apt purge firefox-esr -y

clear

# TODO

echo "----- TODO -----"

echo "Postman login" >> ./.todo
echo "Update path in gauto script" >> ./.todo
echo "Change kali user pass and set root pass" >> ./.todo
echo "Resolve Temp" >> ./.todo

clear
