#!/usr/bin/env bash

: '
     Backup de archivos en local con disco duro externo.

     Este script copia los archivos que han sido modificados desde la carpeta
       origen (local) a la carpeta de destino (disco duro externo).

     Más información:
       - https://www.jveweb.net/archivo/2010/11/sincronizando-carpetas-con-rsync.html
'
if [ ! -f /usr/bin/rsync ]; then
  sudo apt-get install rsync -y
fi

HDISK_NAME="Elements"
WRAP_FOLDER="files/"

ORIGIN_FOLDER="$HOME/$WRAP_FOLDER"
TARGET_FOLDER="/media/$USER/$HDISK_NAME/$WRAP_FOLDER"

if [ ! -d $TARGET_FOLDER ]; then
  echo "La carpeta $TARGET_FOLDER parece no estar montada."
  echo "Inserta el disco duro externo '$HDISK_NAME' o configura correctamente este script."
  exit 1
fi

rsync -rtvu $ORIGIN_FOLDER $TARGET_FOLDER
