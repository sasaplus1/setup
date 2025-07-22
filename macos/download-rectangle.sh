#!/bin/bash

# renovate: datasource=github-tags depName=rxhanson/Rectangle versioning=loose
RECTANGLE_VERSION=v0.89

ARCHIVE=Rectangle${RECTANGLE_VERSION#v}.dmg

curl -fsSL --progress-bar --output-dir "$HOME/Desktop" -O "https://github.com/rxhanson/Rectangle/releases/download/${RECTANGLE_VERSION}/${ARCHIVE}"
