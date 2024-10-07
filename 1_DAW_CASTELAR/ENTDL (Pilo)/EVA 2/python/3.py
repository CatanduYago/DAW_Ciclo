
def suma(n):
    suma = 0
    for i in range(1, n + 1):
        suma += i * i
    return suma

def determinar(x):
    n = 1   
    while suma(n) <= x:
        n += 1
    return n

x = float(input("Ingrese el valor de x: "))

termino = determinar(x)

print(f"Se deben sumar {termino} términos para que la suma sea mayor a {x}.")
