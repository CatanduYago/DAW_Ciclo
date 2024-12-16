 # Establecemos la imagen base de Python
 FROM python:bookworm
 
 # Definimos el directorio de trabajo
 WORKDIR /app
 
 # Copiamos los archivos de requerimientos y la aplicación
 COPY requirements.txt ./
 COPY app.py ./
 
 # Instalamos las dependencias
 RUN pip install -r requirements.txt
 
 # Exponemos el puerto 5000 para comunicarnos con la aplicación
 EXPOSE 5000
 
 # Definimos el comando de arranque
 CMD ["python", "-m", "flask", "run"]