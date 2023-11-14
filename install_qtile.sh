#!/bin/bash

sudo apt update && sudo apt upgrade -y

# Declare variables for directories
bin_dir="$HOME/.local/bin"
qtile_src="$HOME/.local/src/qtile"
qtile_venv="$qtile_src/qtile_venv"

# Install Qtile dependencies
sudo apt install -y python3-pip python3-venv python3-v-sim python-dbus-dev
sudo apt install -y libxkbcommon-dev libxkbcommon-x11-dev
sudo apt install -y libpangocairo-1.0-0 python3-xcffib python3-cairocffi

# Check and create declared directories
[ -d "$qtile_src" ] || mkdir -p "$qtile_src"
[ -d "$bin_dir" ] || mkdir -p "$bin_dir"

# Create python virtual environment (venv) for qtile installation
python3 -m venv "$qtile_venv"

# Install Qtile using pip from created venv
"$qtile_venv/bin/pip" install --no-cache-dir cairocffi
"$qtile_venv/bin/pip" install qtile

# Add qtile to PATH by creating symlink
ln -sf "$qtile_venv/bin/qtile" "$bin_dir/qtile"