#!/usr/bin/env bash

: '
    Instalador de Virtual Box

    Por defecto instala la versión 5.2.18

    Soporte:
      - Debian 8 y 9. Arquitecturas i386 y amd64.
'

. conf.sh

if [ $DEBIAN_VERSION_NUMBER_MAYOR -eq 9 ]; then
  debian_version_string="stretch"
elif [ $DEBIAN_VERSION_NUMBER_MAYOR -eq 8 ]; then
  debian_version_string="jessie"
else
  echo "Tu versión de Debian no está soportada por este instalador."
  exit 1
fi

deb_filename=$(printf "virtualbox-6.0_6.0.10-132072~Debian~%s_%s.deb" "$debian_version_string" "$ARCH")
url_download="https://download.virtualbox.org/virtualbox/6.0.10/$deb_filename"
desktop_filename="$DESKTOP_FOLDER/virtualbox.desktop"
program_name="VirtualBox"
logo_filename="virtualbox.png"
logo_url="$ASSETS_REMOTE_URL/$logo_filename_origin"

echo "Instalando dependencias..."
sudo apt-get install libcurl3 libqt5opengl5 -y

echo "Descargando $deb_filename ..."
wget $url_download

echo "Descargando logo..."
wget $logo_url
sudo mv $logo_filename $PROGRAMS_FOLDER/virtualbox/$logo_filename

echo "Instalando VirtualBox ..."
sudo dpkg -i $deb_filename
rm -f $deb_filename

cat > $desktop_filename <<- EOM
[Desktop Entry]
Type=Application
Exec=$BINARIES_FOLDER/virtualbox
Icon=$PROGRAMS_FOLDER/virtualbox/$logo_filename
Name=$program_name
GenericName=$program_name
Categories=VirtualMachines;
EOM

chmod 755 $desktop_filename
