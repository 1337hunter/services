FROM	alpine:latest

RUN	apk update; \
	apk upgrade; \
	apk add vim openssh zsh openssl openrc curl ca-certificates sudo openssh-server
RUN	set -x ; \
  	addgroup -g 82 -S www-data ; \
  	adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1
RUN	curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub
RUN	sudo mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/
RUN	sudo apk add nginx
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School 21/CN=gbright"
RUN	mkdir -p /run/nginx
COPY	localhost.conf /etc/nginx/conf.d/localhost.conf
COPY	mainpage.html /var/www/index.html
RUN	rc-update add nginx default
RUN     chown -R www-data:www-data /var/www
run	rc-update add sshd
RUN	mkdir /var/run/sshd
RUN	sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
run	ssh-keygen -A
run	echo -e "test\ntest\n" | adduser test
ENV	NOTVISIBLE "in users profile"
RUN	echo "export VISIBLE=now" >> /etc/profile

run     apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing
run     mkdir -p /etc/telegraf
copy    ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE	80 443 22
COPY    entry.sh /entry.sh
entrypoint	/entry.sh
