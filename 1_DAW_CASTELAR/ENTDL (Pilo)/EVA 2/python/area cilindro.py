import math


r=int(input("¿Cuál es el radio de la base? "))
h=int(input("¿Cúal es la altura del cilindro? "))

if h>r:
    arealado=2*math.pi*r*h
    print("El area lateral del cilindro es:",round(arealado,2))

else:
    volumen=(2*math.pi*r*h) + (2*math.pi*math.pow(r,2))
    print("El area total del cilindro es:",round(volumen,2))  

