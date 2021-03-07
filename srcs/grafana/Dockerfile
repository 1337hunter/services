from	alpine:latest

run	apk update; apk upgrade; apk add vim openrc curl
run     apk add grafana telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing

run     mkdir -p /etc/telegraf
copy	./telegraf.conf /etc/telegraf/telegraf.conf
#run	mkdir /var/lib/grafana
#run	mkdir /var/lib/grafana/dashboards
copy	./gcfg/* /var/lib/grafana/dashboards/
run	mkdir data_sources
copy	./data_sources/* /data_sources/
copy	datas_export.sh /datas_export.sh
copy	local.yml /usr/share/grafana/conf/provisioning/dashboards/
copy	entry.sh /entry.sh

expose	3000

entrypoint	/entry.sh
