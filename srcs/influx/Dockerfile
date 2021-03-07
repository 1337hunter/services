from	alpine:latest

run	apk update; \
	apk upgrade
run	apk add vim openrc bash
run	apk add influxdb
run	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing
run	mkdir -p /etc/telegraf
copy	./telegraf.conf /etc/telegraf/telegraf.conf
copy	./newuser /newuser
copy	entry.sh /
copy	initfile /

expose	8086
volume	/root/.influxdb
entrypoint	/entry.sh
