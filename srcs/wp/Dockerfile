from	alpine:latest

run	apk update
run	apk add vim nginx openrc
RUN	mkdir -p /run/nginx
RUN     set -x ; \
        addgroup -g 82 -S www-data ; \
        adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1
RUN     chown -R www-data:www-data /var/www

run	apk add php7 php7-fpm php7-openssl php7-common php7-iconv php7-json php7-gd php7-curl \ 
	php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
	php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \
	php7-session

#run	apk add wget php5-mysql mysql mysql-client php5-zlib
run	rm /etc/nginx/conf.d/*
run	wget -P /var/www https://wordpress.org/latest.tar.gz; \
	tar -xvzf /var/www/latest.tar.gz -C /var/www; \
	rm /var/www/latest.tar.gz
copy	wp-config.php /var/www/wordpress/wp-config.php
copy    nginx.conf /etc/nginx/nginx.conf
copy	php-fpm.conf /etc/php7/php-fpm.conf

run     apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing
run     mkdir -p /etc/telegraf
copy    ./telegraf.conf /etc/telegraf/telegraf.conf

copy	install.php /var/www/wordpress/wp-admin/install.php
copy	entry.sh /

expose	5050

entrypoint /entry.sh
