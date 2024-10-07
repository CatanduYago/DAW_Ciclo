import random 
def generarpq():
  return random.uniform(0, 30)

def imprimirpq(pq):
  if pq < 10:
    print("El paquete es menor de 10 y pesa:",pq, "kg")
    
  elif pq >= 10 and pq <= 20:
    print("El paquete está entre 10 y 20 y pesa:",pq, "kg")
    
  else:
    print("El paquete es mayor de 20 y pesa:",pq, "kg")

pq1 = generarpq()
pq2 = generarpq()
pq3 = generarpq()

imprimirpq(round(pq1,2))
imprimirpq(round(pq2,2))
imprimirpq(round(pq3,2))