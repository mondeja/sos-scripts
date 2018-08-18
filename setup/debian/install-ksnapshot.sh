#!/usr/bin/env bash

: '
    Instalación de Ksnapshot

    Por defecto instala la versión 16.08.3-2 en Debian 9 y
      y la 4.12.2-2 en Debian 8.

    Soporte:
      - Debian 8 y 9. Arquitecturas i386 y amd64.
'

. conf.sh

program_name="Ksnapshot"
desktop_filepath="$DESKTOP_FOLDER/ksnapshot.desktop"
binary_filepath="/usr/bin/ksnapshot"

logo_filename="ksnapshot_48.png"
logo_url="https://www.kde.org/images/icons/$logo_filename"

echo "Descargando logo..."
wget $logo_url

# Los iconos se agrupan por directorios, por lo que si no
#   está creado el de Ksnapshot debemos crearlo:
if [ ! -d "$ICONS_FOLDER/ksnapshot" ]; then
  sudo mkdir "$ICONS_FOLDER/ksnapshot"
fi
sudo mv $logo_filename "$ICONS_FOLDER/ksnapshot/$logo_filename"


if [ ! -f  $$binary_filepath ]; then
  echo "Instalando $program_name ..."
  sudo apt-get install ksnapshot -y
else
  echo "$program_name ya está instalado."
fi

cat > $desktop_filepath <<- EOM
[Desktop Entry]
Type=Application
Exec=$binary_filepath
Icon=$ICONS_FOLDER/ksnapshot/$logo_filename
Name=$program_name
GenericName=$program_name
Categories=Screenshot;
EOM

chmod 755 $desktop_filepath