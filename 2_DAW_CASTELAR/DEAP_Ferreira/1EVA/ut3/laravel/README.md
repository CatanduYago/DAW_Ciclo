

# Introducción

En esta práctica vamos a crear y desplegar una aplicación Laravel utilizando la imagen de Bitnami, sin necesidad de instalar PHP y Composer directamente en el sistema.

La URL para acceder a la aplicación Laravel será la siguiente:

- Aplicación Laravel: [laravel.catanduyago.duckdns.org](http://laravel.catanduyago.duckdns.org)

## Preparación del Proyecto Laravel con Docker

Para no tener que instalar PHP y Composer directamente en el sistema, utilizaremos los siguientes alias para ejecutar los comandos de PHP y Composer dentro de los contenedores Docker:

### Alias para PHP y Composer

Primero, definimos los alias para ejecutar los comandos de PHP y Composer dentro del contenedor.

```
alias php='docker run -u $(id -u):$(id -g) --rm -it -v $(pwd):/usr/src/myapp -w /usr/src/myapp php:8.2-cli php'
alias composer='docker run -u $(id -u):$(id -g) --rm -it -v $(pwd):/app composer composer'
```

Ahora podemos usar php y composer directamente desde la terminal, y estos comandos se ejecutarán dentro de un contenedor Docker sin necesidad de tener PHP y Composer instalados.

Vamos a ejecutar las siguientes lineas para que se instalen las imagenes y podamos usarlos de forma más rapida más adelante.

```
php -v
composer -v
```

## Creación del proyecto Laravel 

Este comando creará una nueva aplicación Laravel en la carpeta holamundo.

```
composer create-project laravel/laravel holamundo
```

## Bitnami para Laravel y Mariadb

Para desplegar la aplicación Laravel, vamos a usar una imagen de Bitnami para Laravel y MariaDB en Docker.

En el docker-compose adjuntado, en el contenedor de laravel hay una linea `depends_on`. El parámetro depends_on en la configuración de Laravel hace que el contenedor de Laravel no se inicie hasta que el contenedor de MariaDB esté completamente en funcionamiento. Esto evita errores comunes al intentar conectar Laravel a la base de datos antes de que MariaDB esté listo.

## Migraciones

Una vez tengamos el contendor creado y corriendo, debemos ejecutar las migraciones necesarias de laravel.

```
docker exec -it laravel php artisan migrate
```
