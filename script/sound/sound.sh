#!/bin/bash

# Permet de récupérer la liste de cartes son
# pactl list cards

CARD_1="usb-Sony_Computer_Entertainment_Wireless_Stereo_Headset-00"             ### Carte WIRELESS
CARD_1_PROFILE_1="iec958-stereo"             # Casque wifi
CARD_0="pci-0000_01_00.1"                    ### CARTE NVidia - GP106 High Definition Audio Controller
CARD_0_PROFILE_1="hdmi-stereo-extra2"        # HDMI 3 


CHOICE=`echo -e "WIRELESS\nHDMI" | dmenu -i -p "Sortie audio :" `
if   [ "$CHOICE" == WIRELESS ]; then CARD="$CARD_1"; PROF="$CARD_1_PROFILE_1" # Casque Wireless
else 
    CARD="$CARD_0"; PROF="$CARD_0_PROFILE_1" # HDMI 3
fi
# Set the choosen card profile as sink
pactl set-card-profile "alsa_card.${CARD}" "output:${PROF}";

# Set the default sink to the new one
pacmd set-default-sink "alsa_output.${CARD}.${PROF}" &> /dev/null

# Redirect the existing inputs to the new sink
for i in $(pacmd list-sink-inputs | grep index | awk '{print $2}'); do
    pacmd move-sink-input "$i" "alsa_output.${CARD}.${PROF}" &> /dev/null
done
