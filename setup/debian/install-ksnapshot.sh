#!/usr/bin/env bash

: '
    Instalación de Ksnapshot

    Por defecto instala la versión 16.08.3.

    Soporte:
      - Distribuciones basadas en Debian.
'

. conf.sh

program_name="Ksnapshot"
binary_filename="ksnapshot"
desktop_filepath="$DESKTOP_FOLDER/$binary_filename.desktop"
binary_filepath="/usr/bin/$binary_filename"

logo_filename="$binary_filename.png"
logo_url_download="$ASSETS_REMOTE_URL/$logo_filename"

echo "Descargando logo..."
wget $logo_url_download

# Los iconos se agrupan por directorios, por lo que si no
#   está creado el de Ksnapshot debemos crearlo:
if [ ! -d "$ICONS_FOLDER/$binary_filename" ]; then
  sudo mkdir "$ICONS_FOLDER/$binary_filename"
fi
sudo mv $logo_filename "$ICONS_FOLDER/$binary_filename/$logo_filename"


if [ ! -f  $$binary_filepath ]; then
  echo "Instalando $program_name ..."
  sudo apt-get install $binary_filename -y
else
  echo "$program_name ya está instalado."
fi

cat > $desktop_filepath <<- EOM
[Desktop Entry]
Type=Application
Exec=$binary_filepath
Icon=$ICONS_FOLDER/$binary_filename/$logo_filename
Name=$program_name
GenericName=$program_name
Categories=Screenshot;
EOM

chmod 755 $desktop_filepath
