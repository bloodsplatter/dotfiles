#!/bin/env  bash

set IS_ROOT= [[ "`whoami`" == root ]] # root check
set AURMAN_INSTALLED= [[ `pacman -Qi aurman` -eq 1 ]] 2>/dev/null # check for aurman - mute error output
set GKSUDO_INSTALLED= [[ `pacman -Qi gksu` -eq 1 ]] 2>/dev/null # check for gksu - mute error output

# check if we have aurman
if [[ $AURMAN_INSTALLED == 0 ]]; then
    >&2 echo "Please install aurman first!"; exit 1;
fi

if [[ $GKSUDO_INSTALLED == 0 ]]; then
    aurman --noconfirm -S gksu 2>/dev/null
fi
GKSUDO_INSTALLED = [[ `pacman -Qi gksu` -eq 1]] 2>/dev/null # check for gksu - mute error output
if [[ $GKSUDO_INSTALLED == 0 ]]; then #check if gksudo is installed now
    >&2 echo "Please install gksudo manually"; exit 1;
fi

check_installed () {
    return [[ `aurman -Qi "$1"` -eq 1]] 2>/dev/null
}

REQUIRED_PACKAGES=("polybar" "ranger" "mediainfo" "atool" "newsboat" "alsa-lib" "ttf-unifont" "cpupower" "python3")
toinstall=()

for pkg in $REQUIRED_PACKAGES; do
    printf "Checking if %s is installed...\n" "$pkg"
    pkg_installed= [[ `aurman -Qi "$1"` -eq 1]] 2>/dev/null
    if [[ $pkg_installed == 0 ]]; then
        toinstall+="$pkg"
    fi
done

if [[ ${#toinstall[*]} == 0 ]]; then
    #no packages to install
    echo "All required packages are already installed"
else
    printf "Installing %s... Please enter your sudo password when asked" "$toinstall"
    aurman -S $toinstall
fi

# INVENTORY_INSTALLABLE = $(ls -lh | awk '{print $1, $9}')
