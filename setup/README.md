## Preparación de sistemas operativos
Los programas están ordenados en carpetas por sistema operativo. Si un programa sólo funciona en una versión del sistema operativo se indica al lado entre paréntesis y no se instalará ejecutando desde esa versión.

### Debian
Cada vez que instalo mi distribución Debian tengo que volver a descargar e instalar todos los programas que utilizo normalmente, generar los accesps directos en el escritorio, insertar binarios en el `PATH`... etc, así que he creado scripts para automatizar este proceso.  

Todos los scripts realizan los siguientes procesos:
  - Instalan el programa si no está instalado.
  - Incluyen el binario en el directorio `/usr/bin`
  - Generan un acceso directo `.desktop` apuntando al binario y al logo del programa y lo almacenan en el Escritorio.
  - (Opional) Almacenan los archivos del programa en `/usr/share`

> Para instalar todos los programas ejecuta desde este mismo directorio `sudo apt-get update && sudo apt-get upgrade && . all.sh`

En el siguiente listado se encuentran todos los scripts (por nombre que refiere a una categoría de programas) y los programas que incluyen. 

- `developer.sh`
  - [PyCharm Community](https://www.jetbrains.com/pycharm/download/#section=linux)
  - [VirtualBox](https://www.virtualbox.org/)
- `misc.sh`
  - [Ksnapshot](https://www.kde.org/applications/graphics/ksnapshot/)
  - [SimpleScreenRecorder](http://www.maartenbaert.be/simplescreenrecorder/)
  
Por ejemplo, desde este mismo directorio, para instalar programas relacionados a la programación ejecutamos `. developer.sh`