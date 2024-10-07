
num=int(input("Ingrese un numero: "))
if num % 2 == 0: 
    print("El numero es par")
    num=num+1
    print("El nuevo numero es: ", num)
elif num % 2 !=0:
    print("El numero es impar")
    num=num+2
    print("El nuevo numero es: ", num)
    
#Refactorizacion por patron extraer metodo.
 
def determinar_paridad(numero):
    if numero % 2 == 0:
        print("El numero es par")
        return numero + 1
    else:
        print("El numero es impar")
        return numero + 2

num = int(input("Ingrese un numero: "))
nuevo_numero = determinar_paridad(num)
print("El nuevo numero es:", nuevo_numero)

# Refactorizacion por patron eliminar asignaciones a parámetros.

def determinar_paridad(numero):
    resultado = None  

    if numero % 2 == 0:
        print("El numero es par")
        resultado = numero + 1
    else:
        print("El numero es impar")
        resultado = numero + 2

    return resultado 

num = int(input("Ingrese un numero: "))
nuevo_numero = determinar_paridad(num)
print("El nuevo numero es:", nuevo_numero)


