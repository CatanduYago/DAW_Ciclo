# Introducción

En esta práctica vamos a realizar la practica de despliegue con Git en la que automatizaremos el proceso de poner en produccion un archivo de un servidor remoto..

La URL para acceder a la aplicación es la siguiente:

- Aplicación: [ut4.catanduyago.duckdns.org](http://ut4.catanduyago.duckdns.org)

## Configuración del servidor

Creamos el repositorio en el servidor remoto:

```bash
mkdir hardfloat-blog.git
cd hardfloat-blog.git
git init --bare
```
Ahora configuraremos el hook editando el archivo `hooks/post-receive` con las lineas del archivo adjunto:

```bash
nano hooks/post-receive
```
Ahora deberemos dar permisos de ejecucion al script:

```bash
chmod +x hooks/post-receive
```

## Configuración del cliente

Crearemos el repositorio local:
```bash
git init hardfloat-blog
cd hardfloat-blog
```
Ahora tendremos que conectar con el servidor remoto:

```bash
git remote add prod ssh://usuario@ut4.SUBDOMINIO.duckdns.org/home/usuario/hardfloat-blog.git
```
Ahora podemos crear un archivo `index.html` con nuestro contenido en nuestro respositorio y realizar el commit.

```bash
nano index.html # <h1>Este es mi Git Bare</h1>

git add index.html
git commit -m "Primer commit con index"
git push

```

