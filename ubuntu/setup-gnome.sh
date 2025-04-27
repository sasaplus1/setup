#!/bin/bash

# Change directory names in home directory for Ubuntu
LANG=C xdg-user-dirs-update --force

if gsettings writable org.gnome.desktop.interface gtk-key-theme Emacs
then
  # Change UI keybind to Emacs for GNOME on Ubuntu
  # NOTE: gsettings-desktop-schemas must be installed
  gsettings set org.gnome.desktop.interface gtk-key-theme Emacs
fi
