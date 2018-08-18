#!/usr/bin/env bash

: '
    Instalador de PyCharm Community

    Por defecto instala la versión 2018.2.1

    Soporte:
      - En teoría debería funcionar para cualquier distribución
          de Linux que tenga instalado `wget`.
'

. conf.sh

program_name="Pycharm Community"
program_folder="pycharm-community-2018.2.1"
binary_filename="pycharm"
tar_filename="$program_folder.tar.gz"
url_download="https://download-cf.jetbrains.com/python/$tar_filename"
desktop_filepath="$DESKTOP_FOLDER/$binary_filename.desktop"

echo "Descargando $program_name ..."
wget $url_download

echo "Extrayendo $tar_filename ..."
tar -xf $tar_filename
#rm $tar_filename

echo "Moviendo $program_folder a $PROGRAMS_FOLDER/$program_folder ..."
sudo mv $program_folder $PROGRAMS_FOLDER/$program_folder

# Creamos el enlace simbólico al binario `pycharm.sh`
#   para ejecutarlo como `pycharm` desde consola
sudo ln -s $PROGRAMS_FOLDER/$program_folder/bin/$binary_filename.sh /usr/bin/$binary_filename

cat > $desktop_filepath <<- EOM
[Desktop Entry]
Type=Application
Exec=$BINARIES_FOLDER/$binary_filename
Icon=$PROGRAMS_FOLDER/$program_folder/bin/$binary_filename.png
Name=$program_name
GenericName=$program_name
Categories=Programming;
EOM

chmod 755 $desktop_filepath
