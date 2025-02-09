#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}Wine Installer Script for Debian (Stable, Testing, Sid)${NC}"

if [[ $EUID -ne 0 ]]; then
  echo -e "${RED}This script must be run as root. Use sudo.${NC}"
  exit 1
fi

VERSION=$(lsb_release -cs)
echo -e "${GREEN}Detected Debian version: $VERSION${NC}"

if [[ "$VERSION" == "bookworm" ]]; then
  REPO_NAME="bookworm"
elif [[ "$VERSION" == "trixie" || "$VERSION" == "sid" ]]; then
  REPO_NAME="sid"
else
  echo -e "${RED}Unsupported Debian version: $VERSION. Exiting.${NC}"
  exit 1
fi

echo -e "${CYAN}Adding WineHQ repository for $REPO_NAME...${NC}"
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/$REPO_NAME/winehq-$REPO_NAME.sources
echo -e "${GREEN}Repository for $REPO_NAME added.${NC}"

echo -e "${CYAN}Enabling multi-arch...${NC}"
dpkg --add-architecture i386
apt update

echo -e "${CYAN}Installing Wine and required components...${NC}"
apt install --install-recommends winehq-stable -y || {
  echo -e "${RED}Failed to install WineHQ Stable. Trying Debian's default Wine packages.${NC}"
  apt install wine wine32:i386 -y
}

if wine --version &>/dev/null; then
  echo -e "${GREEN}Wine installed successfully! Version: $(wine --version)${NC}"
else
  echo -e "${RED}Error installing Wine. Please check for issues manually.${NC}"
  exit 1
fi

echo -e "${CYAN}Installing Winetricks and additional libraries...${NC}"
apt install winetricks -y
winetricks corefonts vcrun6 vcrun2019

echo -e "${GREEN}Installation complete! Wine is ready to use.${NC}"
