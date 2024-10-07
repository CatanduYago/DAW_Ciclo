def entero(n):
  return n % 1 == 0

def multiplo7(n):
  return n % 7 == 0

n = int(input("Introduce un número: "))

if entero(n):
  if multiplo7(n):
    print("El número es entero y múltiplo de 7.")
  else:
    print("El número es entero, pero no es múltiplo de 7.")
else:
  print("El número no es entero.")