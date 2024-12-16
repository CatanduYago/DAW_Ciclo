# Introducción

En esta práctica vamos a crear y desplegar una aplicación Node.js utilizando Docker, sin necesidad de instalar Node.js directamente en nuestro VPS.

La URL para acceder a la aplicación Node.js será la siguiente:

- Aplicación Node.js: [node.catanduyago.duckdns.org](http://node.catanduyago.duckdns.org)

## Preparación del proyecto Node.js

Para no tener que instalar Node.js directamente en el sistema, utilizaremos los siguientes alias para ejecutar los comandos de Node y NPM dentro del contenedor Docker.

```
alias node='docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):/app -w /app node:latest'
```
Para comprobar que las imágenes están disponibles y podemos usarlas, ejecutamos:

```
node -v
```

## Creación del proyecto

Primero tendremos que crear un archivo `server.js`, con el contenido adjuntado junto a esta documentacion.

Ahora podemos crear el proyecto e instalaremos las dependencias con los siguientes comandos:

```
node npm init
node npm install express
```

Crearemos un `Dockerfile` con el contenido adjuntado en esta carpeta junto a esta documentación.


Tenemos que añadir el servicio que construya la imagen del `Dockerfile` y desplegarlo

## Despliegue del proyecto

Para el despliegue es muy sencillo. Si hemos hecho todo bien, podemos ejecutar las siguientes 2 líneas y acceder a nuestro node.subdominio.org:

```
docker compose build
docker compose up

```
