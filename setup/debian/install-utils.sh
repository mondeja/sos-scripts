#!/usr/bin/env bash

: '
    Instalación de utilidades generales.

    Este script instala los siguientes programass de propósito general:
      - wget
'

if [ ! -f "$BINARIES_FOLDER/wget" ]; then
  sudo apt-get install wget -y
fi

if [ ! -f "$BINARIES_FOLDER/git" ]; then
  sudo apt-get install git -y
fi

