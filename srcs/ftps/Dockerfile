from	alpine:latest

run	apk update
run	apk upgrade
run	apk add openssl vsftpd vim openrc
run     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School 21/CN=gbright"
run	echo "vsftp:gbright" | chpasswd
run	mkdir -p /var/log/vsftpd
run	touch /var/log/vsftpd/vsftpd.log
run	touch /etc/vsftpd.user_list

copy	./vsftpd.conf /etc/vsftpd/vsftpd.conf
copy	./ftpstart.sh /

run     mkdir -p /etc/telegraf
copy    ./telegraf.conf /etc/telegraf/telegraf.conf
run	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing

expose	20 21 21100-21104
volume	/var/lib/ftp

entrypoint	/ftpstart.sh
