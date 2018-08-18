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
tar_filename="$program_folder.tar.gz"
download_url="https://download-cf.jetbrains.com/python/$tar_filename"
desktop_filepath="$DESKTOP_FOLDER/pycharm.desktop"

echo "Descargando $program_name ..."
wget $download_url

echo "Extrayendo $tar_filename ..."
tar -xf $tar_filename
#rm $tar_filename

echo "Moviendo $program_folder a $PROGRAMS_FOLDER/$program_folder ..."
sudo mv $program_folder $PROGRAMS_FOLDER/$program_folder

# Creamos el enlace simbólico al binario `pycharm.sh`
#   para ejecutarlo como `pycharm` desde consola
sudo ln -s $PROGRAMS_FOLDER/$program_folder/bin/pycharm.sh /usr/bin/pycharm

cat > $desktop_filepath <<- EOM
[Desktop Entry]
Type=Application
Exec=$BINARIES_FOLDER/pycharm
Icon=$PROGRAMS_FOLDER/$program_folder/bin/pycharm.png
Name=$program_name
GenericName=$program_name
Categories=Programming;
EOM

chmod 755 $desktop_filepath
