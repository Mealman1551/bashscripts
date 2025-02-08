#!/bin/bash

# Stap 1: Maak de benodigde mappen aan voor thema en iconen
echo "Mappen aanmaken voor thema en iconen..."
mkdir -p ~/.themes ~/.icons

# Stap 2: Chicago95 downloaden (indien niet aanwezig)
if [ ! -d "Chicago95-master" ]; then
    echo "Chicago95 niet gedownload, downloaden..."
    git clone https://github.com/grassmunk/Chicago95.git Chicago95-master
else
    echo "Chicago95 is al gedownload!"
fi

# Stap 3: Kopieer het GTK-thema naar de juiste map
echo "Het GTK-thema kopiëren naar ~/.themes..."
cp -r Chicago95-master/Theme/Chicago95 ~/.themes/

# Stap 4: Kopieer de iconen naar de juiste map
echo "De iconen kopiëren naar ~/.icons..."
cp -r Chicago95-master/Icons/* ~/.icons/

# Stap 5: Optioneel - systeemwijd installeren (alleen voor root)
read -p "Wil je Chicago95 systeemwijd installeren? (y/N): " install_systemwide
if [[ "$install_systemwide" =~ ^[Yy]$ ]]; then
    echo "Systeemwijde installatie uitvoeren..."
    sudo cp -r Chicago95-master/Theme/Chicago95 /usr/share/themes/
    sudo cp -r Chicago95-master/Icons/* /usr/share/icons/
    echo "Chicago95 is nu systeemwijd geïnstalleerd!"
else
    echo "Chicago95 is gebruikersspecifiek geïnstalleerd."
fi

echo "Installatie voltooid! Vergeet niet uit te loggen en weer in te loggen om de veranderingen toe te passen."
