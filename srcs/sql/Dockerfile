from	alpine:latest

run	apk add mysql mysql-client
copy	mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
copy	initfile /initfile

run     apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing
run     mkdir -p /etc/telegraf
copy    ./telegraf.conf /etc/telegraf/telegraf.conf

volume	/var/lib/mysql
copy    entry.sh /entry.sh

entrypoint	/entry.sh
