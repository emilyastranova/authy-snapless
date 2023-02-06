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

## Uninstall

To uninstall the Authy desktop application installed through this script, use the following commands:

```bash
sudo rm /usr/bin/authy
sudo rm -rf /opt/authy-snapless
sudo rm /usr/share/applications/authy-snapless.desktop
sudo rm /usr/share/pixmaps/authy-snapless.png
```

Your Authy desktop application should now be completely uninstalled from your system.

## TODO

[ ] Add support for RHEL-based distros (Fedora/CentOS)
[ ] Add support for openSUSE distros (Leap/Tumbleweed)

## License

This project is licensed under the [GNU GPL v3](https://www.gnu.org/licenses/gpl-faq.en.html) license.

## Acknowledgements

I modeled this script after this [AUR script](https://aur.archlinux.org/packages/authy), so thanks tonkku107!

## Disclaimer

This script and repository are not affiliated with or endorsed by Authy Inc. The actual Authy program is the property of Authy Inc and its copyright holder(s). This script and repository are provided as is, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the script and repository or the use or other dealings in the script and repository.
