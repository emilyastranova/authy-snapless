#!/bin/bash
# Authy Snapless

# Copyright (C) 2023 Tyler Harrison <https://tylerharrison.dev/>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
