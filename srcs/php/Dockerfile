from	alpine:latest

#run	mkdir -p /run/nginx

run	apk update; apk add nginx openrc
run	adduser -D -g 'www' www
run	mkdir /www; chown -R www:www /var/lib/nginx; chown -R www:www /www
run	rc-update add nginx default
run	mkdir -p /run/openrc/
#---------------------------
run	apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp \
	php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli \ 
	php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc \
	php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader \ 
	php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php-session
run	rc-update add php-fpm7 default
#---------------------------
run     wget -P /www \
	https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz; \
	mkdir -p /www/phpmyadmin; \
	tar -xvzf /www/phpMyAdmin-5.0.2-all-languages.tar.gz -C /www/phpmyadmin; \
	rm -rf /www/phpMyAdmin-5.0.2-all-languages.tar.gz; \
	mv /www/phpmyadmin/phpMyAdmin-5.0.2-all-languages/* /www/phpmyadmin; \
	rm -rf /www/phpmyadmin/phpMyAdmin-5.0.2-all-languages

#---------------------------
copy	nginx.conf /etc/nginx
copy	config.inc.php /www/phpmyadmin/config.inc.php
copy	phpinfo.php /www
#---------------------------
run     apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing
run     mkdir -p /etc/telegraf
copy    ./telegraf.conf /etc/telegraf/telegraf.conf

copy	entry.sh /entry.sh

expose	5000
entrypoint	/entry.sh
