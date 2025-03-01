#!/bin/bash

echo "Wi-Fi handmatig inschakelen..."

# Schakel netwerkbeheer in
sudo nmcli networking on

# Schakel Wi-Fi in
sudo nmcli radio wifi on

# Start een nieuwe Wi-Fi-scan
echo "Start Wi-Fi-scan..."
sudo nmcli device wifi rescan

# Toon beschikbare Wi-Fi-netwerken
echo "Beschikbare Wi-Fi-netwerken:"
nmcli device wifi list

echo "Wi-Fi is opnieuw ingeschakeld en gescand naar netwerken."
