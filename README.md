# setup_container

Script para crear contenedores lxc.

Descarga: [setup_container.sh](../../raw/master/setup_container.sh)

Ejecutar:
  `bash setup_container.sh nombreContenedor`

- Instala apache2 en el contenedor.
- Conecta con sshfs el directorio del host `~/nombreContenedor` con el directorio `/var/www/html` del contenedor.
