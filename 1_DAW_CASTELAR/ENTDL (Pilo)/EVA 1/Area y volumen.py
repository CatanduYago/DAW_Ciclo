import math
r=int(input("¿Cuál es el radio de la base? "))
h=int(input("¿Cúal es la altura del cilindro? "))
volumen=math.pi*math.pow(r,2)*h
area=2*math.pi*math.pow(r,2)+2*math.pi*r*h
print("Volumen del cilindro:",volumen,)
print("Area del cilindro:",area)    
