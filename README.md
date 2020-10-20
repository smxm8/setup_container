# setup_container

Script para crear contenedores lxc.

Descarga: [setup_container.sh](../../raw/master/setup_container.sh)

Ejecutar:
  `bash setup_container.sh nombre carpeta`

El script:
- Crea el contenedor con el nombre `nombre`
- Instala apache2 en el contenedor.
- Si se especifica una `carpeta`, conecta con sshfs la carpeta del host `~/carpeta` con el directorio `/var/www/html` del contenedor.
