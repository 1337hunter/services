telegraf &

echo "[dashboards.json]
enabled = true
path = /var/lib/grafana/dashboards" >> /etc/grafana.ini

mkdir -p /etc/grafana/
mkdir -p /etc/grafana/provisioning/
mkdir -p /etc/grafana/provisioning/dashboards
mv /local.yml /etc/grafana/provisioning/dashboards

cd /usr/share/grafana && /usr/sbin/grafana-server --config=/etc/grafana.ini &
sleep 7
/datas_export.sh
while true
do
	if [[ -z $(ps axu | pgrep "telegraf") ]];
	then
		echo "telegraf process is dead"
	sleep 5
		echo "container is going down too :("
		break
	fi
	if [[ -z $(ps axu | pgrep "/usr/sbin/grafana-server") ]];
       	then
		echo "influxd process is dead"
                echo "container is going down too :("
		break
	fi
	echo "All services of conteiner is up! Keep going :D"
	sleep 5
done
