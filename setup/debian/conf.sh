#!/usr/bin/env

: '
    Configuración común para la instalación de programas en Debian.
    Este script también es invocado al principio de cada script de instalación,
      para instalar algunas dependencias necesarias como wget
      o realizar actualizaciones.

    La condiguración puede ser modificada a través de las siguientes
      variables de entorno:

    $PROGRAMS_FOLDER -> Directorio donde serán almacenados los programas
      que necesiten de almacenaje en carpetas. Por defecto `"/usr/share"`.
    $BINARIES_FOLDER -> Directorio donde se almacenarán los binarios.
      Por defecto sólo estarán disponibles para el usuario que instala,
      ya que se establece como `"/usr/bin"`.
    $ICONS_FOLDER -> Directorio donde se almacenan los iconos del sistema.
      Por defecto `/usr/share/icons`.
    $DESKTOP_FOLDER -> Variable que hace referencia a la carpeta del Escritorio.
      por defecto es `$HOME/Escritorio` si esta existe. Esto podría mejorarse para
      soportar directorios de Escritorio soportando otros lenguajes. Ver:
      https://askubuntu.com/questions/194124/how-to-get-language-variables-desktop-folder-name-document-folder-name-etc 
'

PROGRAMS_FOLDER="/usr/share"
BINARIES_FOLDER="/usr/bin"
ICONS_FOLDER="$PROGRAMS_FOLDER/icons"

if [ -d "$HOME/Escritorio" ]; then
  DESKTOP_FOLDER="$HOME/Escritorio"
elif [ -d "$HOME/Desktop" ]; then
  DESKTOP_FOLDER="$HOME/Desktop"
else
  echo "No has configurado el directorio del Escritorio en conf.sh" 
fi

DEBIAN_VERSION_NUMBER=$(cat /etc/debian_version)
DEBIAN_VERSION_NUMBER_MAYOR=$(echo $DEBIAN_VERSION_NUMBER | cut -d "." -f1)
ARCH=$(dpkg --print-architecture)

bash install-utils.sh


