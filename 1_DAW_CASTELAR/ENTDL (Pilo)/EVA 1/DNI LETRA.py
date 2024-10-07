nums = int(input("Introduce el serial numérico: "))
resto = (nums % 23)
letras = [  "T", "R", "W", "A", "G", "M", "Y", "F", "P", "D", "X", "B", "N", "J", "Z", "S", "Q", "V", "H", "L", "C", "K", "E"]
print("Tu DNI es: ", nums, letras[resto])