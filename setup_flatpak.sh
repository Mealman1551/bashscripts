#!/bin/bash

# Ensure the script is run as root (for package installations)
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script as root (sudo)."
  exit 1
fi

echo "Starting Debian Quick Setup for Flatpak..."

# Step 1: Install Flatpak
echo "Installing Flatpak..."
apt update
apt install -y flatpak

# Step 2: Install GNOME Software plugin (if GNOME is in use)
echo "Checking for GNOME installation..."
if pgrep -x "gnome-shell" > /dev/null; then
  echo "GNOME detected. Installing GNOME Software plugin for Flatpak..."
  apt install -y gnome-software-plugin-flatpak
elif pgrep -x "plasmashell" > /dev/null; then
  # Step 3: Install Plasma Discover backend (if KDE Plasma is in use)
  echo "KDE detected. Installing Plasma Discover backend for Flatpak..."
  apt install -y plasma-discover-backend-flatpak
else
  echo "No recognized desktop environment detected. Proceeding without GUI plugin installation."
fi

# Step 4: Add the Flathub repository
echo "Adding Flathub repository for Flatpak apps..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Step 5: Restart system (prompt user to do it manually)
echo "Setup complete! Please restart your system to apply the changes."
echo "You can now install apps from Flathub using Flatpak."

exit 0
