# Práctica Servidor DNS

Esta práctica consiste en configurar un servidor DNS usando dnsmasq que resuelva las IPs de un compañero, del profesor y de un registro MX.

## Creacion y despliegue del contenedor docker

Nuestro `docker-compose.yml` contenerá de primeras lo siguiente para iniciarlo con el volumen desactivado:

```bash
services:
  dns:
    ports:
      - 53:53/udp
      - 5380:8080
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        #max-file: "10"
    environment:
      - "HTTP_USER=foo"
      - "HTTP_PASS=bar"
    restart: always
    image: jpillora/dnsmasq
```

Capturaremos el contenido del volumen con `docker exec -it dnsmasq-dns-1 cat /etc/dnsmasq.conf > dnsmasq.conf`

## Configurar el archivo dnsmasq.conf

Ahora solo tenemos que editar el archivo dnsmasq.conf y agregamos las siguientes líneas para definir las direcciones:

```bash
address=/profesor/192.168.60.100
address=/antonio/192.168.60.156
address=/mail/192.168.60.104

mx-host=catanduyago.duckdns.org,mail.catanduyago.com,10
```

## Cambiamos el contenedor y lo actualizamos

Cambiaremos el conetenido de nuestro `docker-compose.yml` y añadiremos el volumes de nuevo:

```bash
services:
  dns:
    ports:
      - 53:53/udp
      - 5380:8080
    volumes:
      - ./dnsmasq.conf:/etc/dnsmasq.conf
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        #max-file: "10"
    environment:
      - "HTTP_USER=foo"
      - "HTTP_PASS=bar"
    restart: always
    image: jpillora/dnsmasq
```
Lo volvemos a ejecutar con docker compose up -d

Esto aplicará la nueva configuración.

## Agregar el despliegue del contenedor al archivo de provision.sh

Editamos el archivo de provisionamiento y agregamos la línea para levantar el contenedor:

```bash
docker compose up -d
```
Comprobación final

Salimos de la máquina virtual, la destruimos y la recreamos:

```bash
vagrant destroy -f
vagrant up
```

## Comprobaciones

Para comprobar que nuestro servidor DNS funciona correctamente usaremos el comando `nslookup`

```bash
nslookup [-opcion] [host] [servidor]

nslookup profesor 192.168.60.52
nslookup antonio 192.168.60.52
nslookup mail 192.168.60.52
```
En mi caso hemos capturado la salida del comando `nslookup` con el uso `tee` en los archivos `prueba-profesor.txt`, `prueba-antonio.txt`, `prueba-mx.txt`.