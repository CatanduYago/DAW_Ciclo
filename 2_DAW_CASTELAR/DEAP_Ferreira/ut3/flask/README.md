# Introducción

En esta práctica vamos a crear y desplegar una aplicación Flask.

La URL para acceder a la aplicación Flask será la siguiente:

- Aplicación Flask: [flask.catanduyago.duckdns.org](http://flask.catanduyago.duckdns.org)

## Archivos adjuntados

1. **`app.py`**: Con tiene el codigo de la aplicaciñón.
2. **`requirements.txt`**: La unica dependendencia que necesitamos es `Flask`.
3. **`Dockerfile`**: Definicion de la contrstrucción de la imagen para la aplicación.
4. **`docker-compose.yml`**: Archivo para configurar y ejecutar los servicios.

## Construcción de la imagen Docker

Una vez tengamos creados todos estos archivos con el contenido adjuntado, podemos hacer un par de comandos para desplegar nuestra aplicacion

```
docker compose build
docker compose up -d
```

