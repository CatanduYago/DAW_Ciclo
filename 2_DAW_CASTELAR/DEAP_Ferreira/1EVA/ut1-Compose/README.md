# Práctica Docker CLI

Esta practica consiste en crear un conjunto de microservicios con docker.

Para esta practica deberemos tener Vagrant y Docker instalado en nuestra maquina virtual.

## Cambios Vagrantfile

Deberemos añádir la linea necesaria para poder visualizar info.php desde nuestro ordenador. La linea a agregar es:

```bash
    config.vm.network "forwarded_port", guest: 80, host: 8080
```

## Iniciar la maquina

Dentro de nuestra máquina, deberemos dirigirnos a la carpeta Vagrant ``` cd /vagrant ``` para tener los archivos tanto en la máquina virtual como en nuestra máquina física.

## Crear .env

```bash
# Variables MariaDB
MYSQL_ROOT_PASSWORD=rootpass
MYSQL_USER=pepe
MYSQL_PASSWORD=despliegue

# Variables phpMyAdmin
PMA_HOST=mariadb
```

## Crear docker-compose.yml

Creamos y desplegamos (```docker compose up -d```) el archivo docker compose.yml con el siguiente contenido:

```bash
services:
  mariadb:
    image: mariadb:latest
    container_name: mariadb
    networks:
      - internal_network
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_USER: ${MYSQL_USER}
      MYSQL_PASSWORD: ${MYSQL_PASSWORD}
    volumes:
      - mariadb_data:/var/lib/mysql
    expose:
      - 3306
    restart: always

  php-apache:
    image: php:apache
    container_name: php-apache
    networks:
      - internal_network
    ports:
      - "80:80"
    volumes:
      - ./info.php:/var/www/html/info.php
    restart: always

  phpmyadmin:
    image: phpmyadmin/phpmyadmin
    container_name: phpmyadmin
    networks:
      - internal_network
    ports:
      - "8080:80"
    environment:
      PMA_HOST: ${PMA_HOST}
    restart: always

networks:
  internal_network:
    driver: bridge

volumes:
  mariadb_data:
```

## Creamos el archivo info.php

En este archivo deberemos escribir:

```php
<?php
phpinfo();
?>
```

## Comprobación de que todo funciona correctamente

Si nos dirigimos a [localhost:8080/info.php](http://localhost:8080/info.php) en nuestro ordenador, podremos ver la pagina cargada con phpinfo().
