# Introducción

Esta documentación busca recoger como se ha llevado acabo el examen de Despliegue de Aplicaciones Web del día 28-10-2024. Antes que nada, mi dominio es `catanduyago.duckdns.org`, pero los que están configurados son `cosa.catanduyago.duckdns.org` y `monitor.catanduyago.duckdns.org`. 

La carpeta miapp/ que contiene index.html, es lo que he usado para servir la pagina.

## Instalación de docker

Si no contamos con docker instalado en nuestra MV, podemos ejecutar las siguientes lineas para instalarlo y asignarle permisos de `sudo` a docker:

1. Descargamos el script de instalación

  `curl -fsSL https://get.docker.com -o get-docker.sh`

2. Ejecutamos el script

  `sudo sh get-docker.sh`

3. Agregamos docker a un grupo con permisos de sudo

```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```



## Creacion archivo .env

Para poder ejecutar el compose, deberás crear un .env en la misma carpeta en la que se encuentre el `docker-compose.yml` de la siguiente manera:

``` 
SUBDOMAIN=tudominio.org
TOKEN=TOKEN
```

## Instalacion de contenedores

Deberemos crear un archivo nombrado docker-compose.yml

``` 
networks:
  monitoring:
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
      - "traefik.http.routers.php-apache.rule=Host(`cosa.catanduyago.duckdns.org`)"
    volumes:
      - ~/miapp:/var/www/html
    restart: unless-stopped

  duckdns:
    image: lscr.io/linuxserver/duckdns:latest
    container_name: duckdns
    environment:
      - TZ=Etc/Utc
      - SUBDOMAINS=${SUBDOMAIN}
      - TOKEN=${TOKEN}
    volumes:
      - ./duckdns:/data
    restart: unless-stopped

  uptime-kuma:
    image: louislam/uptime-kuma:latest
    container_name: uptime-kuma
    ports:
      - 3001:3001
    labels:
      - "traefik.enable=true"
      - "traefik.httpd.routers.uptime-kuma.rule=Host(`monitor.catanduyago.duckdns.org`)"
    restart: unless-stopped
```

A continuació1n realizaremos un `compose up -d`

A partir de ahora podremos conectarnos a nuestro VPS con `ssh azureyago@catanduyago.duckdns.org`

## Eliminar cabecera (Anonimizar)

Para ocultarnos de los posibles hackers que pretendan hacer cosas malas sobre nuestra web. La manera en la que yo he hecho ha sido:

1. Acceder al contenedor de php-apache

`docker exec -it php-apache bash`

2. Agregar por comando las lineas necesarias para eliminar la cabezera

 `echo 'ServerTokens Prod' >>/etc/apache2/conf-available/security.conf`

 `echo 'ServerSignature Off' >>/etc/apache2/conf-available/security.conf`

 `echo 'TraceEnable  Off' >>/etc/apache2/conf-available/security.conf`

3. Reiniciar apache para aplicar los cambios

`service apache2 restart`


## Uptime Kuma

Si nos dirigimos a `monitor.catanduyago.duckdns.org`, podremos encontrar nuestro uptime kuma configurado. 
 
Si pide inicio de sesión:
Usuario: yago 
Contraseña: 1234567890Dd

[!NOTE]

La tilde de mi apellido el en archivo de index.html no se muestra como una tilde.
