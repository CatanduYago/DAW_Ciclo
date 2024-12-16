# Proyecto de Configuración de Servicios con Docker

Este proyecto implementa una arquitectura basada en contenedores para un servidor web apache seguro y autenticado mediante LDAP (administrado por phpldapadmin), utilizando Traefik como proxy inverso. El sistema está diseñado para integrarse con servicios de DuckDNS para la gestión de subdominios.

## Características

- **Seguridad en Apache**: Configuración avanzada con desactivación de información sensible en las cabeceras de las peticiones:

  - `ServerTokens Prod`
  - `ServerSignature Off`
  - Eliminación de encabezados `X-Powered-By` y `Server`.

- **Autenticación LDAP**:

  - Configuración para autenticar el acceso al contenido de `/var/www/html` mediante un servidor LDAP.
  - Se utiliza un usuario administrador para la conexión LDAP (`AuthLDAPBindDN`).

- **Gestión de subdominios**:

  - Integración con DuckDNS para la gestión dinámica de subdominios.

- **Traefik como Proxy Inverso**:
  - Redireccionamiento de tráfico HTTP y servicios a través de contenedores Docker.
  - Interfaz de administración habilitada en el puerto `8080`.

## Servicios

### Traefik

- Imagen: `traefik:latest`
- Funciones:
  - Proxy inverso y balanceo de carga.
  - Gestión de rutas para servicios Docker.

### Servidor PHP-Apache

- Imagen: `php:8.2-apache-bullseye`
- Funciones:
  - Servidor web con soporte PHP.
  - Configuración de seguridad avanzada en Apache.

### Servidor LDAP

- Imagen: `osixia/openldap:latest`
- Funciones:
  - Gestión de usuarios y autenticación.
  - Organización basada en `ou=users,dc=example,dc=org`.

### phpLDAPadmin

- Imagen: `osixia/phpldapadmin:latest`
- Funciones:
  - Interfaz gráfica para administrar LDAP.
  - Acceso mediante subdominio configurado.

### DuckDNS

- Imagen: `lscr.io/linuxserver/duckdns:latest`
- Funciones:
  - Gestión automática de subdominios.
  - Integración con Traefik.

## Archivos Importantes

- **`docker-compose.yaml`**:
  Define la arquitectura completa de servicios y dependencias.

- **`apache-security.conf`**:
  Contiene las configuraciones de seguridad del servidor Apache.

- **Volumenes de Datos**:
  - `ldap-data`: Almacena los datos persistentes del servidor LDAP.
  - `ldap-config`: Almacena las configuraciones del servidor LDAP.
  - `duckdns`: Contiene la configuración del cliente DuckDNS.
  - `miApp`: Contiene los archivos de la aplicación servida por Apache.

## Instrucciones de Uso

1. Clonar este repositorio en tu sistema local.

2. Configurar las variables de entorno en el archivo `.env`:

   ```env
  LDAP_ORGANISATION="Example Organisation"
  LDAP_DOMAIN="example.org"
  LDAP_ADMIN_PASSWORD="admin_password"
  SUBDOMAIN=tu-subdominio
  TOKEN=tu-token-de-duckdns
   ```

3. Cargar un archivo php o index en la carpeta miApp

4. Levantar los servicios:

  ```bash
  docker-compose up -d

  ```

5. Acceder a los servicios:

   - phpLDAPadmin: `http://phpldapadmin.<tu-subdominio>`

   - Aplicación web: `http://ldap.<tu-subdominio>`

6. Configuración para conseguir acceso a la Aplicación web.
    Tendremos que acceder a nuestro `phpLDAPadmin` e introducir el usuario DN `cn=admin,dc=example,dc=org` y la contraseña que hemos establecido en el .env
    
    Para crear el usuario debemos crear un grupo al que pertenecerá. Para esto:
      - Hacemos clic en `dc=ejemplo,dc=org` y seleccionamos **Create a child entry**.
      - Seleccionamos **Generic: Posix Group** 
      - Configuraremos el nombre como `users`
      - Hacemos clic en **Create Object** y luego en **Commit**.
    
    Ahora vamos a crear el usuario:
      - Volvemos a desplegar `dc=ejemplo,dc=org`, hacer click sobre `cn=users` y seleccionamos **Create a child entry**.
      - Seleccionamos **Generic: User Account**.
      - Rellenamos los datos y enviamos y clicamos en **Commit**


> [!NOTE]
> Todas las credenciales son por defecto. Lo suyo es cambiarlo para producción

## Autores

Este proyecto ha sido desarrollado por:

- Antonio Martín alumno01_smr1_20@iescastelar.com
- Yago Catalano ycatalanoa01@educarex.es
