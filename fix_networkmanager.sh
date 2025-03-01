#!/bin/bash

CONFIG_FILE="/etc/NetworkManager/NetworkManager.conf"

# Controleer of de instelling al correct is
if grep -q "managed=true" "$CONFIG_FILE"; then
    echo "De NetworkManager is al ingesteld om interfaces te beheren."
else
    echo "Pas NetworkManager-configuratie aan om interfaces te beheren..."
    
    # Maak een back-up van het huidige configuratiebestand
    sudo cp "$CONFIG_FILE" "$CONFIG_FILE.bak"

    # Voeg de juiste configuratie toe of wijzig deze
    sudo sed -i '/^\[ifupdown\]/!b;n;cmanaged=true' "$CONFIG_FILE"

    # Als de sectie [ifupdown] niet bestaat, voeg het dan toe aan het einde van het bestand
    if ! grep -q "^\[ifupdown\]" "$CONFIG_FILE"; then
        echo -e "\n[ifupdown]\nmanaged=true" | sudo tee -a "$CONFIG_FILE" > /dev/null
    fi

    echo "Configuratie bijgewerkt! NetworkManager wordt herstart..."
    
    # Herstart NetworkManager om de wijzigingen door te voeren
    sudo systemctl restart NetworkManager
    echo "NetworkManager is succesvol herstart."
fi
