# Introducción

En esta práctica vamos a crear y desplegar dos aplicaciones simples en JakartaEE y en Spring en nuestro VPS.

Las url por las que se puede acceder a estas aplicaciones son las siguientes:

- Aplicacion Jakarta: [tomcat.catanduyago.duckdns.org/demo-1.0-SNAPSHOT](http://tomcat.catanduyago.duckdns.org/demo-1.0-SNAPSHOT)
- Aplicación Spring: [tomcat.catanduyago.duckdns.org/demo2-0.0.1-SNAPSHOT](http://tomcat.catanduyago.duckdns.org/demo2-0.0.1-SNAPSHOT)

## Creación aplicación JakartaEE

Para que la creación nos resulte más fácil, vamos a usar IntelliJ.

Debemos hacer click sobre ***New Project***. Se nos abrirá un cuado donde podemos configurar la aplicación que vamos a crear. Seleccionaremos ***JakartaEE*** en los ***Generators***. Para esta inicial no hace falta tocar mucho, solo tendremos que seleccionar en ***Template*** la opción de ***Web Aplication***. Tambien tenemos que seleccionar en ***Aplication Server*** nuestro tomcat descargado anteriormente. Ahora podemos continuar y seleccionar en las especificaciones ***Servlet***. Continuamos con la creación.

Si intentamos ejecutar nuestra aplicación, dará errror. Debemos clicar sobre el desplegable y acceder a la configuración. Se nos abrira una ventana en la que veremos varias opciones. Una de ellas es ***Deployment***. En esta deberemos eliminar ejemplo:war exploded y agregar ***Artifact*** ejemplo:war.

Si ahora lo ejecutamos se nos habrá creado un `.war` en la carpeta ***target***

## Creación aplicación Spring

Para la creación de esta aplicación tambien vamos a usar IntelliJ.

Debemos hacer click sobre ***New Project***. Se nos abrirá un cuado donde podemos configurar la aplicación que vamos a crear. Aquí seleccionaremos en ***Generators*** ***Spring Boot***. En el cuadro que nos sale ahora, yo que he hecho alguna cosa con spring siguiendo consejos de conocidos, he decidido escoger el lenguaje y el tipo de proyecto como ***Java*** y ***Maven***. Un poco más abajo nos indica si queremos que el ***Packaging*** sea `.jar` o `.war`. Escogemos `.war`.

Ahora si ejecutamos nuestra aplicación, se nos generará una carpeta ***target*** con el `.war` de nuestra aplicacion.

## Contenedor Tomcat en VPS

Yo he realizado el despligegue de Tomcat usando mi docker compose ya existente adjuntado junto a este `readme` usando las variables de entorno tambien adjuntadas en forma de ejemplo en `.env.ejemplo`.

## Despligue de aplicaciones en Tomcat

Este paso puede ser el más sencillo. Lo unico que tenemos que hacer es pasar nuestros `.war` generados anteriormente a nuestra carpeta de Tomcat en nuestro VPS.

Para esto vamos a usar el comando `scp`:

```
scp -i C:/Tu/directorio/.ssh/id_ed25519 C:\Tu\directorio\del\proyecto\jakarta\demo\target\demo-1.0-SNAPSHOT.war tuusuario@tudominio.asd.org:/directorio/destino/tomcat/aplicaciones
```

```
scp -i C:/Tu/directorio/.ssh/id_ed25519 C:\Tu\directorio\del\proyecto\spring\demo\target\demo2-0.0.1-SNAPSHOT.war tuusuario@tudominio.asd.org:/directorio/destino/tomcat/aplicaciones
```

Aquí, `-i`, sirve para especificar nuestra clave privada para la autenticación de la conexión

Para comprobar que se despliegan de manera correcta podemos dirigirnos a nuestra url o ejecutar `ls tomcat/aplicaciones/` y ver si se han desempaquetado nuestras aplicaciones.
