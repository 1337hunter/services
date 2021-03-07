telegraf &
sleep 1
/usr/sbin/sshd -D &
sleep 1
nginx -g "daemon off;" &

sleep 3
while true
do
	if [[ -z $(ps axu | pgrep "telegraf") ]];
	then
		echo "telegraf process is dead"
	sleep 5
		echo "container is going down too :("
		break
	fi
	if [[ -z $(ps axu | pgrep "nginx") ]];
       	then
		echo "nginx process is dead"
                echo "container is going down too :("
		break
	fi
	if [[ -z $(ps axu | pgrep "sshd") ]];
        then
                echo "sshd process is dead"
                echo "container is going down too :("
                break
        fi
	echo "All services of conteiner is up! Keep going :D"
	sleep 5
done
