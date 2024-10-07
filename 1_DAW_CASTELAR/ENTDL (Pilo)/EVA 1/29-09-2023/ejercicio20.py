import math

r=int(input("¿Cuál es el radio de la base? "))
h=int(input("¿Cúal es la altura del cilindro? "))
if h>r:
    volumen=math.pi*math.pow(r,2)*h
    print("Volumen del cilindro: ",volumen,)
elif h<r:
    area=2*math.pi*math.pow(r,2)+(2*math.pi*r*h) 
    print("Area superficial del cilindro: ",area)