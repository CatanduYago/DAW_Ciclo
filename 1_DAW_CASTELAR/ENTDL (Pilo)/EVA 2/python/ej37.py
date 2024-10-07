dinero = float(input("Ingrese la cantidad de dinero disponible: "))
precios = [10.5, 20.3, 5.2, 15.0, 8.75]
total = 0

print("Los artículos que puede comprar son:")

for i, precio in enumerate(precios):
    if dinero >= precio:
        dinero -= precio  
        total += precio
        print(f"Artículo {i + 1}: ${precio}")

print(f"El gasto total de la compra es: ${total}")