def par(numero):
  return numero / 2 == 0

n1 = int(input("Escriba el primer número: "))
n2 = int(input("Escriba el segundo número: "))

tot = n1 + n2

if par(tot):
  print("Es una suma par")
else:
  print("Es una suma impar")