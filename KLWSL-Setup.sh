#!/bin/bash

# Only for Kali Linux WSL
# BinExp Setup

# Variables

Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'
NC='\033[0m'

# Initialization

echo -e "${Cyan}----- Initializing -----${NC}"

clear

mkdir Temp
mkdir CTF
mkdir Script
mkdir Script/Pwninit
touch ./.zsh_aliases

clear

# Variables Initialization

echo -e "${Cyan}----- Software Version -----${NC}"

echo -e "${Green}Pwninit Version : ${NC}"
read pinit

clear

# Installing Dependencies (Some are Specific so might not be updated)

echo -e "${Cyan}----- Installing Dependencies -----${NC}"

sudo apt-get update
sudo apt-get install python3.12 python3.12-venv -y  # SD --> GDB Plugins
sudo apt-get install git checksec ropper aptitude patchelf gobuster gdb -y
sudo pip install pwntools

clear

# Ngrok Setup

echo -e "${Cyan}----- Ngrok Setup -----${NC}"

curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| sudo tee /etc/apt/sources.list.d/ngrok.list \
	&& sudo apt update \
	&& sudo apt install ngrok
ngrok config add-authtoken 4WoSsgp9okAxssS3nvzhP_3SKgLP8szV7pkw3eMVGeT

cd ~
clear

# Pwninit Setup

echo -e "${Cyan}----- Pwninit Setup -----${NC}"

cd ~/Script/Pwninit
wget "https://github.com/io12/pwninit/releases/download/${pinit}/pwninit"
chmod +x pwninit

cd ~
clear

# Gef, Peda, Pwndbg (GDB Plugins)

echo -e "${Cyan}----- GDB Plugins Setup -----${NC}"

cd ~/Script/ && git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef.git
cd ~/Script/gdb-peda-pwndbg-gef
sudo ./install.sh

cd ~/Script/gdb-peda-pwndbg-gef
./install.sh

cd ~
clear

# Config Files Setup

echo -e "${Cyan}----- Config Files ----${NC}"

echo 'alias update="sudo apt-get update && sudo apt-get upgrade"' >> ./.bash_aliases
echo 'alias pwninit="/home/geektech/Script/Pwninit/pwninit"' >> ./.bash_aliases
echo 'source /home/kali/.zsh_aliases' >> ./.bashrc

clear