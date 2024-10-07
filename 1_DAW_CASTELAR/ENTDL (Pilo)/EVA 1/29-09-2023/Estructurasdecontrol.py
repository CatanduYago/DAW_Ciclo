#si condicion entonces hacer
# sentencia1
#fsi
num=int(input("Ingrese un numero: "))
if num % 2 == 0: 
    print("El numero es par")
    num=num+1
    print("El nuevo numero es: ", num)
elif num % 2 !=0:
    print("El numero es impar")
    num=num+2
    print("El nuevo numero es: ", num)
    print("Sigo el programa")
    