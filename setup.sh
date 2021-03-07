# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbright <gbright@student.21-school.ru>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/15 17:42:24 by gbright           #+#    #+#              #
#    Updated: 2020/08/29 19:51:15 by gbright          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SECONDS=0

minikube stop
minikube delete
minikube start --driver=virtualbox --cpus=2 --memory='3072'
minikube addons enable metrics-server
minikube addons enable dashboard
eval $(minikube docker-env)
gnome-terminal -e "bash -c \"minikube dashboard; exec bash\""

#installing and runing Metal Load Balancer
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metalLB/metalLB.yaml

#building and runing nginx
docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx-deploy.yaml
kubectl apply -f ./srcs/nginx/nginx-svc.yaml

#building and runing ftps on vsftpd
docker build -t ftps ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps-vlm.yaml
kubectl apply -f ./srcs/ftps/ftps-dpt.yaml
kubectl apply -f ./srcs/ftps/ftps-svc.yaml

#mysql (mariadb)
docker build -t mariadb ./srcs/sql
kubectl apply -f ./srcs/sql/sql-dpt.yaml
kubectl apply -f ./srcs/sql/sql-svc.yaml
kubectl apply -f ./srcs/sql/sql-vlm.yaml

#phpmyadmin
docker build -t phpmyadmin ./srcs/php
kubectl apply -f ./srcs/php/php-dpt.yaml
kubectl apply -f ./srcs/php/php-svc.yaml

#wordpress
docker build -t wordpress ./srcs/wp
kubectl apply -f ./srcs/wp/wp-dpt.yaml
kubectl apply -f ./srcs/wp/wp-svc.yaml

#influxdb
docker build -t influxdb ./srcs/influx
kubectl apply -f ./srcs/influx/influx-dpt.yaml
kubectl apply -f ./srcs/influx/influx-svc.yaml
kubectl apply -f ./srcs/influx/influx-vlm.yaml

#grafana
docker build -t grafana ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana-dpt.yaml
kubectl apply -f ./srcs/grafana/grafana-svc.yaml

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds."

#go into tunnel
#gnome-terminal -e "bash -c \"minikube tunnel; exec bash\""

