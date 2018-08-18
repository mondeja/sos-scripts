#!/usr/bin/env bash

: '
    Copiar los archivos en el disco duro externo a archivos en local.

    Este script copia los archivos que han sido modificados desde la carpeta
       origen (disco duro externo) a la carpeta de destino (local).
'

if [ ! -f /usr/bin/rsync ]; then
  sudo apt-get install rsync -y
fi

HDISK_NAME="Elements"
WRAP_FOLDER="files/"

TARGET_FOLDER="$HOME/$WRAP_FOLDER"
ORIGIN_FOLDER="/media/$USER/$HDISK_NAME/$WRAP_FOLDER"

if [ ! -d $ORIGIN_FOLDER ]; then
  echo "La carpeta $ORIGIN_FOLDER parece no estar montada."
  echo "Inserta el disco duro externo '$HDISK_NAME' o configura correctamente este script."
  exit 1
fi

rsync -rtvu --delete $ORIGIN_FOLDER $TARGET_FOLDER
