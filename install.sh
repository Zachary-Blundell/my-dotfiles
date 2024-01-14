#!/bin/bash
#  ___           _        _ _                    _                         
# |_ _|_ __  ___| |_ __ _| | |  _ __   __ _  ___| | ____ _  __ _  ___  ___ 
#  | || '_ \/ __| __/ _` | | | | '_ \ / _` |/ __| |/ / _` |/ _` |/ _ \/ __|
#  | || | | \__ \ || (_| | | | | |_) | (_| | (__|   < (_| | (_| |  __/\__ \
# |___|_| |_|___/\__\__,_|_|_| | .__/ \__,_|\___|_|\_\__,_|\__, |\___||___/
#                              |_|                         |___/           
# Author : Zachary Blundell
# This script install all packages listed in aur_installed_packages.conf and installed_packages.conf
# These files are generated using:
# pacman -Qm | awk '{print $1}' > aur_installed_packages.conf
# pacman -Qe | awk '{print $1}' > installed_packages.conf

# files to look for the packages to install.
installedPackages="./installed_packages.conf"
thirdPartyPackages="./aur_installed_packages.conf"
# systemd services
systemdServices="./services.conf"

# Function to clear the line and show new content.
clearLine() {
  echo -e "\e[1A\e[K$1"
}

sudo pacman --sync --refresh

echo "🏁 Preparing installation..."

# looping through the list & avoiding the empty spaces
installedPackagesTogether=$(cat ${installedPackages} | grep -v "^$")
thirdPartyPackagesTogether=$(cat ${thirdPartyPackages} | grep -v "^$")

# installing `yay` if not installed.
if ! which yay >/dev/null; then
  currentDirectory=$pwd
  tmpDirectory="/tmp/yay"
  sudo pacman --sync --needed --noconfirm base-devel git
  mkdir $tmpDirectory
  git clone https://aur.archlinux.org/yay.git $tmpDirectory
  cd $tmpDirectory
  makepkg --force --syncdeps --rmdeps --install
  cd $currentDirectory
  rm -rf $tmpDirectory
fi

# installing trusted packages.
# regular packages can also be installed with `yay`.
sudo pacman --sync --needed --noconfirm $trustedPackagesTogether


# installing third party packages.
yay --sync --needed $thirdPartyPackagesTogether

clearLine "⚙ Enabling serivces..."

# looping through the list & avoiding the empty spaces
sed '/^[ \t]*$/d' $systemdServices | while read service; do
  sudo systemctl enable $service
done

clearLine "🎉 Installation complete! You can restart your PC."
