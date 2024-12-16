apt-get update && apt-get install -y curl

sudo -u vagrant docker --version
if [[ ! $? -eq 0 ]]; then
	sudo -u vagrant curl -fsSL https://get.docker.com -o install-docker.sh
	sh install-docker.sh

	groupadd docker
	usermod -aG docker vagrant

	docker network create microservicios_net
	docker run -d --name mariadb --network microservicios_net -e MYSQL_ROOT_PASSWORD=rootpass -e MYSQL_USER=pepe -e MYSQL_PASSWORD=despliegue mariadb:latest
	docker run -d --name php-apache --network microservicios_net -p 80:80 -v /vagrant/info.php:/var/www/html/info.php php:apache
	docker run -d --name phpmyadmin --network microservicios_net -p 8080:80 -e PMA_HOST=mariadb phpmyadmin/phpmyadmin

fi
sudo -u vagrant docker --version

ip a | grep "inet "