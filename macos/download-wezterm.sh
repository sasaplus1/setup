#!/bin/bash

# renovate: datasource=github-tags depName=wezterm/wezterm versioning=loose
WEZTERM_VERSION=20240203-110809-5046fc22

curl -fsSL --progress-bar --output-dir "$HOME/Desktop" \
  -O "https://github.com/wezterm/wezterm/releases/download/${WEZTERM_VERSION}/WezTerm-macos-${WEZTERM_VERSION}.zip" \
  -O "https://github.com/wezterm/wezterm/releases/download/${WEZTERM_VERSION}/WezTerm-macos-${WEZTERM_VERSION}.zip.sha256"

cd "$HOME/Desktop" && shasum --check "WezTerm-macos-${WEZTERM_VERSION}.zip.sha256"
