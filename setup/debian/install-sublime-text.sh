#!/usr/bin/env bash

: '
    Instalador de Sublime Text

    Por defecto instala la versión 3.1.1 (Build 3176)
      para entornos de 64 bits en Linux.

    Soporte:
      - En teoría debería funcionar para cualquier distribución
          de Linux que tenga instalado `wget`.
'

. conf.sh

program_name="SublimeText3"
program_folder="sublime_text_3"
binary_filename="sublime_text"
desktop_filename="sublime-text.desktop"
desktop_filepath="$DESKTOP_FOLDER/$desktop_filename"
bz2_filename="sublime_text_3_build_3176_x64.tar.bz2"
url_download="https://download.sublimetext.com/sublime_text_3_build_3176_x64.tar.bz2"

echo "Descargando $program_name ..."
wget $url_download

echo "Extrayendo $bz2_filename ..."
tar xvf $bz2_filename
rm $bz2_filename

echo "Moviendo $program_folder a $PROGRAMS_FOLDER/$program_folder ..."
sudo mv $program_folder $PROGRAMS_FOLDER/$program_folder

# Creamos enlaces simbólicos al binario `sublime_text`
#    para ejecutarlo tanto como `sublime-text` como con `sublime_text`
if [ -e  "$BINARIES_FOLDER/$binary_filename" ]; then
    sudo rm $BINARIES_FOLDER/$binary_filename
fi
sudo ln -s $PROGRAMS_FOLDER/$program_folder/$binary_filename $BINARIES_FOLDER/$binary_filename

if [ -e "$BINARIES_FOLDER/sublime-text" ]; then
    sudo rm "$BINARIES_FOLDER/sublime-text"
fi
sudo ln -s $PROGRAMS_FOLDER/$program_folder/$binary_filename $BINARIES_FOLDER/sublime-text

cat > $desktop_filepath <<- EOM
[Desktop Entry]
Type=Application
Exec=$BINARIES_FOLDER/$binary_filename
Icon=$PROGRAMS_FOLDER/$program_folder/Icon/48x48/sublime-text.png
Name=$program_name
GenericName=$program_name
Categories=Programming;
EOM

chmod 755 $desktop_filepath



