# setup_container

Script para crear contenedores lxc. 

Ejecutar:
  `bash create_container.sh nombreContenedor`

- Instala apache2 en el contenedor.
- Conecta con sshfs el directorio del host `~/nombreContenedor` con el directorio `/var/www/html` del contenedor.
