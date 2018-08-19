#!/usr/bin/env bash

: '
    Etcher es una aplicación para crear USBs booteables.

    Por defecto se instala la versión 1.4.4 en Linux.
'

. conf.sh

if [ ! -f "$BINARIES_FOLDER/unzip" ]; then
  sudo apt-get install unzip
fi

binary_filename="etcher"
program_filename="Etcher"
zip_filename="etcher-electron-1.4.4-linux-x64.zip"
appimage_filename="etcher-electron-1.4.4-x86_64.AppImage"

url_download="https://github.com/resin-io/etcher/releases/download/v1.4.4/$zip_filename"

echo "Descargando $program_name ..."
wget $url_download

echo "Extrayendo $program_name"
unzip $zip_filename
rm $zip_filename

if [ ! -d "$program_folder" ]; then
  sudo mkdir "$program_folder"
fi

mv $appimage_filename "$DESKTOP_FOLDER/$binary_filename"
sudo chmod 755 "$DESKTOP_FOLDER/$binary_filename"
sudo cp "$BINARIES_FOLDER/$binary_filename"
