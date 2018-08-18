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

deb_filename=$(printf "virtualbox-5.2_5.2.18-124319~Debian~%s_%s.deb" "$debian_version_string" "$ARCH")
download_url="https://download.virtualbox.org/virtualbox/5.2.18/$deb_filename"
desktop_filename="$DESKTOP_FOLDER/virtualbox.desktop"
program_name="VirtualBox"
logo_filename="Virtualbox_logo.png"
logo_url="https://upload.wikimedia.org/wikipedia/commons/d/d5/$logo_filename"

echo "Instalando dependencias..."
sudo apt-get install libcurl3

echo "Descargando $deb_filename ..."
#wget $download_url

echo "Descargando logo..."
wget $logo_url
sudo mv $logo_filename $PROGRAMS_FOLDER/virtualbox/$logo_filename

echo "Instalando VirtualBox ..."
#sudo dpkg -i $deb_filename
#rm $deb_filename

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
