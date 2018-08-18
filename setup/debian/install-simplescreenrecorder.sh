#!/usr/bin/env bash

: '
    Instalación de SimpleScreenRecorder

    Por defecto instala la versión 16.08.3-2 en Debian 9 y
      y la 4.12.2-2 en Debian 8.

    Soporte:
      - Debian 9.
'

. conf.sh

program_name="SimpleScreenRecorder"
binary_filename="simplescreenrecorder"
binary_filepath="/usr/bin/$binary_filename"
desktop_filepath="$DESKTOP_FOLDER/$binary_filename.desktop"


logo_filename="simplescreenrecorder.jpg"
logo_url="https://gutl.jovenclub.cu/wp-content/uploads/2014/10/$logo_filename"

echo "Descargando logo..."
wget $logo_url

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
