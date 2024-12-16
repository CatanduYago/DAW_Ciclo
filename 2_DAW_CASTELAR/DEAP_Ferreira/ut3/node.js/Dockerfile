# Utiliza una imagen base de Node.js mínima
FROM node:alpine

# Establece el directorio de trabajo en el directorio raíz de la imagen
WORKDIR /usr/src/app

# Copia el package.json y el archivo lock (si lo tienes)
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos de la aplicación
COPY . .

# Exponer el puerto 3000
EXPOSE 3000

# Comando para iniciar la aplicación
CMD [ "npm", "start" ]
#ENTRYPOINT [ "node", "server.js" ]