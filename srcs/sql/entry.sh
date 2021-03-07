chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]
then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	mysql < initfile
fi
telegraf &
mysqld --user=mysql --init-file=/initfile &

sleep 3
while true
do
	if [[ -z $(ps axu | pgrep "telegraf") ]];
	then
		echo "telegraf process is dead"
		echo "container is going down too :("
		break
	fi
	if [[ -z $(ps axu | pgrep "mysqld") ]];
       	then
		echo "mysqld process is dead"
                echo "container is going down too :("
		break
	fi
	echo "All services of conteiner is up! Keep going :D"
	sleep 5
done
