import random

def descuento(dinero):
    rnum = random.randint(1, 9)  

    if rnum < 7:
        descuento = 0.1 * dinero  
        return descuento, rnum
    else:
        return 0, rnum  


dinero = float(input("Ingrese la cantidad de dinero: "))

descuento, rnum = descuento(dinero)

if descuento > 0:
    print(f"Se aplicó un descuento de {descuento} €")
    print(f"Total: {dinero - descuento} €")
else:
    print(f"No hay descuento")
    print(f"Total: {dinero} €")