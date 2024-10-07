import random

def es_primo(num):
    if num <= 1:
        return False
    elif num <= 3:
        return True
    elif num % 2 == 0 or num % 3 == 0:
        return False
    i = 5
    while i * i <= num:
        if num % i == 0 or num % (i + 2) == 0:
            return False
        i += 6
    return True

numero_aleatorio = random.randint(1, 100)

while not es_primo(numero_aleatorio):
    numero_aleatorio = random.randint(1, 100)

print(f" El numero aleatorio primo es: {numero_aleatorio}")
