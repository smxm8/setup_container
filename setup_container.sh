lxc launch ubuntu:20.04 $1

echo -n "Esperando que el contenedor este listo"
for i in {0..20} 
do
	echo -n "."
	ok=$(lxc exec $1 -- ls /root/.ssh/authorized_keys 2> /dev/null)
	if [[ $ok != "" ]]
	then
		echo "OK"
		break
	fi
	sleep 1
done

ssh-keygen -q -f ~/.ssh/$1 -N ""
lxc file push ~/.ssh/$1.pub $1/root/.ssh/authorized_keys
lxc exec $1 -- chmod 600 /root/.ssh/authorized_keys
lxc exec $1 -- chown root:root /root/.ssh/authorized_keys

lxc exec $1 -- apt update
lxc exec $1 -- apt install -y apache2


mkdir ~/$1

IP=`lxc info $1 | grep -Po '\seth\d:\sinet\s+\K[0-9\.]+'`;

sshfs -o StrictHostKeyChecking=accept-new root@$IP:/var/www/html ~/$1/

echo "Servidor escuchando en http://$IP"
