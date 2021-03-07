telegraf &
php-fpm7
nginx -g "daemon off;" &

sleep 3
while true
do
	if [[ -z $(ps axu | pgrep "telegraf") ]];
	then
		echo "telegraf process is dead"
		echo "container is going down too :("
		break
	fi
	if [[ -z $(ps axu | pgrep "php-fpm7") ]];
       	then
		echo "php-fpm7 process is dead"
                echo "container is going down too :("
		break
	fi
	if [[ -z $(ps axu | pgrep "nginx") ]];
        then
                echo "nginx daemon is dead"
                echo "container is going down too :("
                break
        fi
	echo "All services of conteiner is up! Keep going :D"
	sleep 5
done
