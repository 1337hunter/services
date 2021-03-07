telegraf &
chown -R vsftp:vsftp /var/lib/ftp
vsftpd /etc/vsftpd/vsftpd.conf &
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
	if [[ -z $(ps axu | pgrep "vsftpd") ]];
       	then
		echo "vsftpd process is dead"
                echo "container is going down too :("
		break
	fi
	echo "All services of conteiner is up! Keep going :D"
	sleep 5
done
