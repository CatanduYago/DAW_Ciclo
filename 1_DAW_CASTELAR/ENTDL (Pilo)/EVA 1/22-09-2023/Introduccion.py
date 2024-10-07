nombre=input("¿Cómo te llamas?\n")
seguro = input("Confirma tu nombre, por favor: \n")
while nombre != seguro:
  nombre = input("Los nombres no coinciden, por favor repite tu nombre: \n")
  seguro = input("Confirma tu nombre de nuevo: ")
valor = int(input("Introduce tu número favorito: "))
if valor == 33:
    print("COMO QUE 33?? ME REPITES ESE NUMERÍN?")
else:
    print("El número introducido es " + valor + "!")
print("Encantado, " + nombre + ". Me gusta mucho el número " + valor + "!")
for i in nombre:
  print("Dame una ", i)
print("¡" + nombre.upper() + "!")
