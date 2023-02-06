#!/bin/bash

set -e

PKGNAME="authy"
MAKEDEPENDENCIES=("squashfs-tools")
_SNAPID="H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn"
_SNAPREV="12"

# Install dependencies
sudo apt update
sudo apt install -y "${MAKEDEPENDENCIES[@]}"

# Download the snap file
curl -LJO "https://api.snapcraft.io/api/v1/snaps/download/${_SNAPID}_${_SNAPREV}.snap"

# Extract the snap file
echo "Extracting snap file..."
unsquashfs -q -f -d "${PKGNAME}" "${_SNAPID}_${_SNAPREV}.snap"

# Install the files
sudo install -d "/opt/${PKGNAME}"
sudo cp -r "${PKGNAME}/." "/opt/${PKGNAME}"

# Create the desktop entry
sed -i 's|${SNAP}/meta/gui/icon.png|authy|g' "/opt/${PKGNAME}/meta/gui/authy.desktop"
sudo install -Dm644 "/opt/${PKGNAME}/meta/gui/authy.desktop" -t "/usr/share/applications"
sudo install -Dm644 "/opt/${PKGNAME}/meta/gui/icon.png" "/usr/share/pixmaps/authy.png"

# Clean up unnecessary files
sudo rm -rf "/opt/${PKGNAME}"/{data-dir,gnome-platform,lib,meta,scripts,usr,*.sh}

# Symlink binary to /usr/bin
sudo ln -s "/opt/${PKGNAME}/authy" "/usr/bin"
