#!/bin/bash

# Only for Kali Linux VM
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
mkdir Software
mkdir Script/gauto
mkdir Script/Pwninit
mkdir Script/Frida
touch ./.zsh_aliases

clear

# Variables Initialization

echo -e "${Cyan}----- Software Version -----${NC}"

echo -e "${Green}Pwninit Version : ${NC}"
read pinit

echo -e "${Green}Angry IP Scanner Version : ${NC}"
read aips

echo -e "${Green}Sublime Text : ${NC}"
read subt

echo -e "${Green}JD-GUI : ${NC}"
read jdver

echo -e "${Green}Bytecode Viewer : ${NC}"
read bver

clear

# Kali user passwd and Root passwd

echo -e "${Cyan}----- Kali user and Root Password -----${NC}"

passwd
sudo passwd

clear

# Installing Dependencies (Some are Specific so might not be updated)

echo -e "${Cyan}----- Installing Dependencies -----${NC}"

sudo apt-get update
sudo apt-get install python3.12 python3.12-venv -y  # SD --> GDB Plugins
sudo apt-get install git qemu-user libc6-armel-cross libc6-mipsel-cross ghidra checksec ropper alacarte aptitude patchelf gobuster gdb gdb-multiarch google-android-platform-tools-installer gcc-multilib ltrace strace -y
sudo pip install pwntools

clear

# Chrome Setup

echo -e "${Cyan}----- Chrome Setup -----${NC}"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

clear

# Postman Setup

echo -e "${Cyan}----- Postman Setup -----${NC}"

cd Software
curl -L https://dl.pstmn.io/download/latest/linux64 -o postman-linux-x64.tar.gz
tar -xvf postman-linux-x64.tar.gz

cd ~
clear

# IDA Free Setup

echo -e "${Cyan}----- IDA Free Setup -----${NC}"

cd Temp
wget https://out7.hex-rays.com/files/idafree84_linux.run

cd ~
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

# Binary Ninja

echo -e "${Cyan}----- Binary Ninja -----${NC}"

cd Software
wget https://cdn.binary.ninja/installers/binaryninja_free_linux.zip
unzip binaryninja_free_linux.zip

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

# Angry IP Scanner Setup

echo -e "${Cyan}----- Angry IP Scanner Setup -----${NC}"

wget "https://github.com/angryip/ipscan/releases/download/${aips}/ipscan_${aips}_amd64.deb"
sudo dpkg -i ./ipscan_${aips}_amd64.deb

clear

# Ghidra Script

echo -e "${Cyan}----- Ghidra Script -----${NC}"

cd Script/gauto
git clone https://gist.github.com/liba2k/d522b4f20632c4581af728b286028f8f
mv ./d522b4f20632c4581af728b286028f8f/ghidra.py ./gauto.py

cd ~
clear

# Frida

echo -e "${Cyan}----- Frida ----${NC}"

cd Script/Frida
python3 -m venv ./
cd bin
./pip3 install frida frida-tools

cd ~
clear

# SublimeText

echo -e "${Cyan}----- Sublime Text ----${NC}"

wget "https://download.sublimetext.com/sublime-text_build-${subt}_amd64.deb"
sudo dpkg -i "sublime-text_build-${subt}_amd64.deb"

cd ~
clear

# JD-GUI

echo -e "${Cyan}----- JD-GUI ----${NC}"

wget "https://objects.githubusercontent.com/github-production-release-asset-2e65be/32844456/ec518b00-272d-11ea-9cdc-e94fa418eaa5?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241019%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241019T045924Z&X-Amz-Expires=300&X-Amz-Signature=6511797e4856d5eb61d66ffd0843148b7b2c904c3986358c83320b1a4ffef519&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Djd-gui-${jdver}.rpm&response-content-type=application%2Foctet-stream"
sudo rpm -i "jd-gui-${jdver}.rpm"

cd ~
clear

# Bytecode Viewer

echo -e "${Cyan}----- Bytecode Viewer ----${NC}"

cd Software
mkdir BCViewer; cd BCViewer
wget "https://objects.githubusercontent.com/github-production-release-asset-2e65be/25201361/4572c427-6733-4dfa-8fb9-ecfa7a69884e?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241019%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241019T052957Z&X-Amz-Expires=300&X-Amz-Signature=074c7bdf628d94b26814b4ae6d546d55b210db5d8cea97a09cc5f42e10c914a8&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3DBytecode-Viewer-${bver}.jar&response-content-type=application%2Foctet-stream"
mv ./Bytecode-Viewer-${bver}.jar ./ bcv.jar

cd ~
clear

# MIPS

echo -e "${Cyan}----- MIPS ----${NC}"

sudo mkdir /etc/qemu-binfmt
sudo ln -s /usr/mipsel-linux-gnu /etc/qemu-binfmt/mipsel

cd ~
clear

# ARM5

echo -e "${Cyan}----- ARM5 ----${NC}"

sudo mkdir /etc/qemu-binfmt
sudo ln -s /usr/arm-linux-gnueabi /etc/qemu-binfmt/arm

cd ~
clear

# Config Files Setup

echo -e "${Cyan}----- Config Files ----${NC}"

echo 'alias gauto="python3 /home/kali/Script/gauto/gauto.py"' >> ./.zsh_aliases
echo 'alias update="sudo apt-get update && sudo apt-get upgrade"' >> ./.zsh_aliases
echo 'alias idafree="/opt/idafree/ida64"' >> ./.zsh_aliases
echo 'alias postman="/home/kali/Software/Postman/Postman"' >> ./.zsh_aliases
echo 'alias pwninit="/home/kali/Script/Pwninit/pwninit"' >> ./.zsh_aliases
echo 'alias binaryninja="/home/kali/Software/binaryninja/binaryninja"' >> ./.zsh_aliases
echo 'alias frida="/home/kali/Script/Frida/bin/frida"' >> ./.zsh_aliases
echo 'alias frida-apk="/home/kali/Script/Frida/bin/frida-apk"' >> ./.zsh_aliases
echo 'alias frida-compile="/home/kali/Script/Frida/bin/frida-compile"' >> ./.zsh_aliases
echo 'alias frida-create="/home/kali/Script/Frida/bin/frida-create"' >> ./.zsh_aliases
echo 'alias frida-discover="/home/kali/Script/Frida/bin/frida-discover"' >> ./.zsh_aliases
echo 'alias frida-itrace="/home/kali/Script/Frida/bin/frida-itrace"' >> ./.zsh_aliases
echo 'alias frida-join="/home/kali/Script/Frida/bin/frida-join"' >> ./.zsh_aliases
echo 'alias frida-kill="/home/kali/Script/Frida/bin/frida-kill"' >> ./.zsh_aliases
echo 'alias frida-ls="/home/kali/Script/Frida/bin/frida-ls"' >> ./.zsh_aliases
echo 'alias frida-ls-devices="/home/kali/Script/Frida/bin/frida-ls-devices"' >> ./.zsh_aliases
echo 'alias frida-ps="/home/kali/Script/Frida/bin/frida-ps"' >> ./.zsh_aliases
echo 'alias frida-pull="/home/kali/Script/Frida/bin/frida-pull"' >> ./.zsh_aliases
echo 'alias frida-push="/home/kali/Script/Frida/bin/frida-push"' >> ./.zsh_aliases
echo 'alias frida-rm="/home/kali/Script/Frida/bin/frida-rm"' >> ./.zsh_aliases
echo 'alias frida-trace="/home/kali/Script/Frida/bin/frida-trace"' >> ./.zsh_aliases
echo 'alias bcv="/home/kali/Software/BCViewer/bcv.jar"' >> ./.zsh_aliases
echo 'alias alsroff="echo 0 | sudo tee /proc/sys/kernel/randomize_va_space"' >> ./.zsh_aliases
echo 'source /home/kali/.zsh_aliases' >> ./.zshrc

clear

# Cleaning

echo -e "${Cyan}---- Cleaning ----${NC}"

rm -rf ~/Script/gauto/d522b4f20632c4581af728b286028f8f
rm ~/jd-gui-${jdver}.rpm
rm ~/sublime-merge_build-${subm}_amd64.deb
rm ~/sublime-text_build-${subt}_amd64.deb
rm ~/google-chrome-stable_current_amd64.deb
rm ~/Software/postman-linux-x64.tar.gz
rm ~/Software/binaryninja_free_linux.zip
rm ~/ipscan_${aips}_amd64.deb
sudo apt purge firefox-esr -y

clear

# TODO

echo -e "${Cyan}----- TODO -----${NC}"

echo "Android Lab Setup : https://medium.com/@SecureWithMohit/getting-started-with-frida-setting-up-on-an-emulator-47980170d2b2#id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6ImE1MGY2ZTcwZWY0YjU0OGE1ZmQ5MTQyZWVjZDFmYjhmNTRkY2U5ZWUiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiIyMTYyOTYwMzU4MzQtazFrNnFlMDYwczJ0cDJhMmphbTRsamRjbXMwMHN0dGcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIyMTYyOTYwMzU4MzQtazFrNnFlMDYwczJ0cDJhMmphbTRsamRjbXMwMHN0dGcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTIwNDAyOTMyMjg0OTkzOTI0NTUiLCJlbWFpbCI6InJvb3QwMzA2MjAwM0BnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwibmJmIjoxNzI4NDcxMDk3LCJuYW1lIjoiR2VlayBUZWNoIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FDZzhvY0toOHpJa1diUlY1alVwMEItSEs1dFpIVDBfdG1vTE9sWDUwdHhuVFZ0RUtOOFRMQjA9czk2LWMiLCJnaXZlbl9uYW1lIjoiR2VlayIsImZhbWlseV9uYW1lIjoiVGVjaCIsImlhdCI6MTcyODQ3MTM5NywiZXhwIjoxNzI4NDc0OTk3LCJqdGkiOiIwZDI2MDBhZTQ3OWRkMjFkZjY1ZDEyODQ5NjMyMThhNzhkZGNlOGQ1In0.DRqWxsxPLnHXMfxOrVpflV--pz6tOX-QzwgEgZX4t4BXQOAkzXwnsEYZ7MUlimdzlXWqKzwGU07sm9H4NxBz52aDg7HuGs0X6jHa69DDLPyHKy1Q5VXnPqs2y_62GsWpNa_JI3YP-t3mpvNbckkljQ5EgBrzYFHs0iliHWpXLH9e7CnYALJy-KLf-1HK5aSCPuqjeZb96xx9WClQLjUbll4A55cSMGa9tcIV-tAsjCF8tp1N3O257tVld9fUuqBH0ly9aBwjXA95u9_bAapMhCmegcS3ho7GMgMXkj7Qgp96npaCtSP09pSJzcq68kdQsh8R2eFnjLibA0uVUeCydA"
echo "Update path in gauto script" >> ./.todo
echo "Postman login" >> ./.todo
echo "Resolve Temp" >> ./.todo

clear
