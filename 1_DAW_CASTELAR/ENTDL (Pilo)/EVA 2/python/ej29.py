def calcular_potencia(base, exponente):
  """
  Función para calcular la potencia de un número.

  Parámetros:
    base (int): El número base.
    exponente (int): El exponente.

  Retorno:
    int: La potencia de base elevada a exponente.
  """
  if exponente == 0:
    return 1
  else:
    return base * calcular_potencia(base, exponente - 1)

total_granos = 0

for casilla in range(1, 65):
  total_granos += calcular_potencia(2, casilla - 1)

granoskg = 20000

total_kg = total_granos / granoskg
total_toneladas = total_kg / 1000

print(f"Total de granos de trigo: {total_granos}")
print(f"Total de toneladas de trigo: {total_toneladas}")