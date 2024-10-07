import random

def generar_voto():
  """Genera un voto aleatorio entre 0, 1, 2 o 3.
  
  0: Voto en blanco
  1: Voto para candidato 1
  2: Voto para candidato 2
  3: Voto para candidato 3
  """
  return random.randint(0, 4)


def contar_votos(votos):
  """Cuenta los votos para cada candidato, votos nulos y en blanco.

  Parámetros:
    votos: Lista que contiene los votos de cada persona.

  Retorno:
    Diccionario con los resultados:
      "candidato_1": total_votos_candidato_1,
      "candidato_2": total_votos_candidato_2,
      "candidato_3": total_votos_candidato_3,
      "votos_nulos": total_votos_nulos,
      "votos_en_blanco": total_votos_en_blanco
  """
  resultados = {
    "candidato_1": 0,
    "candidato_2": 0,
    "candidato_3": 0,
    "votos_nulos": 0,
    "votos_en_blanco": 0
  }

  for voto in votos:
    if voto == 1:
      resultados["candidato_1"] += 1
    elif voto == 2:
      resultados["candidato_2"] += 1
    elif voto == 3:
      resultados["candidato_3"] += 1
    elif voto == 0:
      resultados["votos_en_blanco"] += 1
    else:
      resultados["votos_nulos"] += 1

  return resultados

votantes = int(input("Introduzca el número de votantes: "))
votos = [generar_voto() for _ in range(votantes)]

resultados = contar_votos(votos)

print("Resultados de la elección:")
for candidato, total_votos in resultados.items():
  if candidato == "votos_nulos":
    print(f"{candidato}: {total_votos}")
  elif candidato == "votos_en_blanco":
    print(f"{candidato}: {total_votos}")
  else:
    print(f"{candidato}: {total_votos} ({total_votos / votantes:.2%})")

ganador = max(resultados.items(), key=lambda x: x[1])[0]

if ganador in ["candidato_1", "candidato_2", "candidato_3"]:
  print(f"\nEl ganador de la elección es: {ganador}")
else:
  print("\nNo hay ganador, la elección se debe repetir.")
