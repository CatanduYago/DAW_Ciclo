def calcular_total(kw, precio):
    if kw > 700:
        precio *= 1.05  
    total = kw * precio
    return total

kw = float(input("Ingrese la cantidad de Kw consumidos: "))
precio = float(input("Ingrese el precio por Kw: "))

total = calcular_total(kw, precio)

print(f"El total a pagar es: {total} €")