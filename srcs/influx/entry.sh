influxd &
if [ ! -d /root/.influxdb ]
then
	influx setup -u "gbright" -p "adminadmin" -o "School 21" -b "gbright" < initfile;
	influx < newuser
fi
telegraf &
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
	if [[ -z $(ps axu | pgrep "influxd") ]];
       	then
		echo "influxd process is dead"
                echo "container is going down too :("
		break
	fi
	echo "All services of conteiner is up! Keep going :D"
	sleep 5
done
