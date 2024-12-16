# Importar librería
from flask import Flask

# Crear instancia a clase Flask
app = Flask(__name__)

# Asociar ruta a función
@app.route("/")
def hello_world():
  return "<p>Hola mundo, este es el Flask de Yago!</p>"