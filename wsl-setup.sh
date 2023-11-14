#!/bin/bash

# *********************************************************
# *********************************************************
# **                                                     **
# **               SET UP PROXMOX VM                     **
# **                                                     **
# *********************************************************
# *********************************************************

DEPENDENCIES="zsh git fonts-font-awesome"
LSD_BINARY="lsd_0.23.1_amd64.deb"

RED='\033[0;31m'  # Red Color
BLUE='\033[0;34m' # Blue Color
NC='\033[0m'      # No Color

# set up the root as default user for the wsl
# ubuntu2004.exe config --default-user root

# *** Install latest ubuntu packages ***
echo -e "${BLUE}Updating ubuntu packages${NC}"
sudo apt update && sudo apt upgrade -y
echo -e "${RED}Ubuntu has been updated${NC}"
sleep 5

# *** Enhancing the cli with some charms ***
# (1) installing lsd
echo -e "${BLUE}Installing LS Super charged${NC}"

sudo dpkg -i $LSD_BINARY
rm -f $LSD_OUTPUT
echo -e "${RED}LSD has been installed ${NC}"
sleep 5

# (2) setting up zsh
echo -e "${BLUE}Setting up zsh and its plugings${NC}"

# echo -e "${RED}creating directory to store plugins${NC}"
# mkdir -p ~/.zsh/.plugins

# echo -e "${RED}cd to the plugins directory${NC}"
# cd ~/.zsh/.plugins

echo -e "${RED}cloning p10k${NC}"
git clone https://github.com/romkatv/powerlevel10k.git .zsh/.plugins/powerlevel10k

echo -e "${RED}cloning zsh-completion${NC}"
git clone https://github.com/zsh-users/zsh-completions.git .zsh/.plugins/zsh-completions

echo -e "${RED}cloning zsh-syntax-highlighting${NC}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .zsh/.plugins/zsh-syntax-highlighting

echo -e "${RED}cloning zsh-autosuggestions${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git .zsh/.plugins/zsh-autosuggestions

echo -e "${RED}All Plugins have been cloned and added to zsh plugins directory${NC}"

# *** Install zsh
echo -e "${BLUE}Installing zsh${NC}"
sudo apt install zsh -y

sleep 5

# *** setting up dev dependencies
echo -e "${RED}All dev dependencies have been installed${NC}"
sudo apt install $DEPENDENCIES -y

# setting zsh as the default shell
echo -e "${BLUE}Setting zsh as the default shell${NC}"
chsh -s $(which zsh)
