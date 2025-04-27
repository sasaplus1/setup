#!/bin/bash

# TODO: renovate
curl -fsSL --progress-bar --output-dir "$HOME/Desktop" \
  -O 'https://github.com/wezterm/wezterm/releases/download/20240203-110809-5046fc22/WezTerm-macos-20240203-110809-5046fc22.zip' \
  -O 'https://github.com/wezterm/wezterm/releases/download/20240203-110809-5046fc22/WezTerm-macos-20240203-110809-5046fc22.zip.sha256'

cd "$HOME/Desktop" && shasum --check WezTerm-macos-20240203-110809-5046fc22.zip.sha256
