#!/usr/bin/env bash
# Install blinkt.py (lgpio version) for Raspberry Pi 5
set -e

TARGET="/usr/lib/python3/dist-packages/blinkt.py"
SOURCE="$(cd "$(dirname "$0")" && pwd)/blinkt.py"

if [ "$(id -u)" -ne 0 ]; then
    echo "Run with sudo: sudo ./install.sh"
    exit 1
fi

# Backup original if it exists and no backup yet
if [ -f "$TARGET" ] && [ ! -f "${TARGET}.bak" ]; then
    cp "$TARGET" "${TARGET}.bak"
    echo "Backed up original to ${TARGET}.bak"
fi

cp "$SOURCE" "$TARGET"
echo "Installed blinkt.py (lgpio/Pi 5) to $TARGET"
