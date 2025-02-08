#!/bin/bash

sudo apt purge -y \
  kde-plasma-desktop \
  kde-full \
  kde-baseapps \
  kde-workspace \
  kde-runtime \
  plasma-desktop \
  plasma-workspace \
  plasma-nm \
  plasma-pa \
  plasma-widget-networkmanagement \
  plasma-widget-multimedia \
  plasma-widget-notifications \
  plasma-widget-lancelot \
  plasma-widget-kickoff \
  plasma-widget-folderview \
  plasma-widget-clock \
  plasma-widget-cpu-usage \
  plasma-widget-memory-usage \
  plasma-widget-battery \
  plasma-widget-system-monitor \
  plasma-widget-weather \
  plasma-widget-quickaccess \
  plasma-widget-battery-monitor \
  plasma-widget-keyboard-layouts \
  plasma-widget-window-list \
  plasma-widget-clipboard \
  plasma-widget-x11 \
  kde-config-sddm \
  konsole \
  konqueror \
  dolphin \
  kate \
  spectacle \
  okular \
  kgpg \
  kleopatra \
  muon \
  muon-installer \
  muon-updater \
  kdeconnect \
  kdeconfig-gtkstyle \
  kde-config-pk-gtk2
sudo apt purge -y \
  kde-l10n-* \
  kde-config-* \
  plasma-workspace-wallpapers \
  kde-wallpapers \
  kde-base-runtime \
  kde-plasma-discover \
  kde-plasma-systemsettings \
  kde-plasma-workspace \
  kde-base-bin \
  kdeaccessibility
sudo apt autoremove --purge -y
sudo apt clean
