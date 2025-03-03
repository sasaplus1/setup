#!/bin/bash

# Change directory names in home directory for Ubuntu
LANG=C xdg-user-dirs-gtk-update --force

# Change UI keybind to Emacs for GNOME on Ubuntu
gsettings set org.gnome.desktop.interface gtk-key-theme Emacs
