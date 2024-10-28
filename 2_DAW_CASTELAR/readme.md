# Introducción

Esta documentación describe el proceso de instalación y configuración de Docker, así como la configuración de un contenedor que ejecuta Apache con PHP. Además, se incluye la configuración para mejorar la seguridad de Apache.

## Creación de VPS

Nos dirigiremos a Azure y crearemos una máquina virtual con el SO Debian 12. Abriremos los puertos 443, 22 y 80.

Para conectarnos debemos añadir nuestra clave pública en la máquina virtual. Ahora solo tendremos que ejecutar en nuestra máquina local el comando ``ssh usuario@ip_publica``

## Instalación de Docker

1. Descargar el script de instalacion de Docker:

   ``curl -fsSL https://get.docker.com -o install-docker.sh``
2. Ejectuar el script:

   ``sh install-docker.sh``
3. Ejecutar Docker sin sudo ejecutaremos:

```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

## Configuración de Docker Compose

Crea un archivo docker-compose.yml con todos los contenedores necsarios conectados en la misma red y configurados para traefik:

```
networks:
  monitoring:
    driver: bridge

services:
  traefik:
    image: traefik:v2.5
    command:
      - "--api.insecure=true"
      - "--providers.docker=true"
    ports:
      - "80:80"
      - "8080:8080"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
    restart: unless-stopped

  php-apache:
    image: php:apache
    container_name: php-apache
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.php-apache.rule=Host(`catanduyago.duckdns.org`)"
    volumes:
      - ~/miapp/info.php:/var/www/html/info.php
    restart: unless-stopped

  duckdns:
    image: lscr.io/linuxserver/duckdns:latest
    container_name: duckdns
    environment:
      - TZ=Etc/UTC
      - SUBDOMAINS=${SUBDOMAIN}
      - TOKEN=${TOKEN}
    volumes:
      - ./duckdns:/data
    restart: unless-stopped

  uptime-kuma:
    image: louislam/uptime-kuma:latest
    container_name: uptime-kuma
    restart: unless-stopped
    ports:
      - 3001:3001
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.uptime-kuma.rule=Host(`uptime.catanduyago.duckdns.org`)"
```

## Crear archivo .env

En la misma carpeta donde se ecnuentre tu ``docker-compose.yml`` deberas crear este archivo. Que debe contener:
```
SUBDOMAIN=dominio.org
TOKEN=token
```

Ahora ya podremos hacer un `docker compose up -d` para montar los contenedores.

## Eliminar cabecera de la pagina web:

1. Entrar en el contenedor:

   ``docker exec -it php-apache bash``
2. Añadir configuraciones de seguridad:

   `echo 'ServerTokens Prod' >> /etc/apache2/conf-available/security.conf`

   `echo 'ServerSignature Off' >> /etc/apache2/conf-available/security.conf`

   `echo 'TraceEnable Off' >> /etc/apache2/conf-available/security.conf`

3. Reiniciar Apache:

   `service apache2 restart`

## Configuración kuma

Ahora podemos dirigirnos a uptime.nuestro_dominio para encontrar la pagina de monitorizacion de nuestra pagina. Nos registraremos y añadiremos un nuevo monitor con el enlace a nuestro dominio.

## Resultados

De ahora en adelante, para acceder a nuestro VPS por ssh podremos usar `ssh usuario@tudominio`. Además podremos dirigirnos a nuestro_dominio/info.php para encontrar nuestro archivo.

Si queremos visualizar el estado de las rutas, para abrir traefik deberemos ejecutar un tunel ssh y configurar el proxy socks con `ssh -ND 9999 usuario@tudominio`. Después nos podremos dirigir a la ip privada de la maquina, ene l puerto 8080 para encontrar el traefik.
