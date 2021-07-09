#!/usr/bin/env bash

# Download and install starcraft headless build
wget http://blzdistsc2-a.akamaihd.net/Linux/SC2.$VERSION.zip &&
  unzip -P iagreetotheeula SC2.$PART_FILENAME.zip -d ~/ &&
  rm *.zip

VERSIONS_WITH_DIFFERENT_FOLDER=(4.8.2 4.8.3 4.8.4 4.8.6 4.9.0 4.9.1 4.9.2 4.9.3)
# shellcheck disable=SC2199
# shellcheck disable=SC2076
if [[ " ${VERSIONS_WITH_DIFFERENT_FOLDER[@]} " =~ " $VERSION " ]]; then
  mv ~/SC2.$VERSION/* ~/
  rmdir ~/SC2.$VERSION
fi

# Download and install starcraft maps
wget -i maps.txt &&
  grep -E '[a-zA-Z0-9\_]+\.zip' maps.txt -o | xargs -I '{}' unzip -P iagreetotheeula -o '{}' -d ~/StarCraftII/Maps/ &&
  rm *.zip &&
  rm maps.txt
