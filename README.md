# Authy Snapless

This repository contains a script for installing the Authy two-factor authentication desktop application on Debian-based operating systems using APT. This script avoids using the Snap daemon from Ubuntu, making it a simple and straightforward way to install Authy on Debian-based systems.

## Clone this Repository

To clone this repository, run the following command in the terminal:

```bash
git clone https://github.com/tyleraharrison/authy-snapless.git
```

## Installation

To install Authy using this script, simply run the following command in the terminal:

```bash
cd authy-snapless
chmod +x install-authy.sh
sudo ./install-authy.sh
```

## License

This project is licensed under the GNU GPL license.

## Acknowledgements

I modeled this script after this [AUR script](https://aur.archlinux.org/packages/authy), so thanks tonkku107!
