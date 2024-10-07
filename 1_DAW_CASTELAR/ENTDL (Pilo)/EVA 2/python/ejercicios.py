def ej1():
    n = int(input("Ingrese el número de paquetes: "))
    pesos = []

    for i in range(n):
        peso = float(input("Ingrese el peso del paquete {}: ".format(i+1)))
        pesos.append(peso)

    promedio = sum(pesos) / n
    menor_valor = min(pesos)
    mayor_valor = max(pesos)

    print("Promedio de pesos:", promedio)
    print("Menor valor de pesos:", menor_valor)
    print("Mayor valor de pesos:", mayor_valor)
    
def ej2():
    def ej2():
        n = int(input("Ingrese el número de paquetes: "))
        menor_10 = []
        entre_10_20 = []
        mayor_20 = []

        for i in range(n):
            peso = float(input("Ingrese el peso del paquete {}: ".format(i+1)))
            if peso < 10:
                menor_10.append(peso)
            elif peso >= 10 and peso <= 20:
                entre_10_20.append(peso)
            else:
                mayor_20.append(peso)

        print("Paquetes con peso menor a 10 Kg:", menor_10)
        print("Paquetes con peso entre 10 y 20 Kg:", entre_10_20)
        print("Paquetes con peso mayor a 20 Kg:", mayor_20)
def ej3():
    def ej3():
        x = float(input("Ingrese un número: "))
        suma = 0
        n = 1

        while suma <= x:
            termino = n * 10 + n
            suma += termino
            n += 1

        print("Cantidad de términos:", n-1)
def ej4():
    def ej4():
        def gcd(a, b):
            while b != 0:
                a, b = b, a % b
            return a

        a = int(input("Ingrese el primer número: "))
        b = int(input("Ingrese el segundo número: "))

        mcd = gcd(a, b)
        print("Máximo común divisor:", mcd)


def main():
    while True:
        print("Menú de ejercicios:")
        print("1. Ejercicio 1")
        print("2. Ejercicio 2")
        print("3. Ejercicio 3")
        print("4. Ejercicio 4")

        opcion = input("Elige un ejercicio (0 para salir): ")

        if opcion == "0":
            break
        elif opcion == "1":
            ej1()
        elif opcion == "2":
            ej2()
        elif opcion == "3": 
            ej3()
        elif opcion == "4": 
            ej4()
main()