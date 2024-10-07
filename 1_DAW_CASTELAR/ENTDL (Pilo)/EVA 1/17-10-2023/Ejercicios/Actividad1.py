# Un trabajador cobra brutos 2800€. Retenciones por IRPF 16 si es interino o 21 si es funcionario de carrera. Por cada trienio cobra bruto 54€ y se le aplica a misma retencion IRPF.
# Por el primer sesenio cobra 54€, por el segundo 86€ y por el tercero 125€.
# Si tiene familia numerosa, se le reduce en un punto el IRPF.
# Queremos un programa que se ejecute hasta que se pulse la F de fin.
# Hasta entonces tiene que preguntar los datos oportunos e
# imprimir un informe con el nombre, funcionario o interino,trienios y sesnios, familila numerosas (si/No) y sueldo neto.
def calcularsueldoneto(tipo_empleado, trienios, sesenios, familia_numerosa):
    salariobase = 2800
    retencionirpf = 21 if tipoempleado == "F" else 16

    sueldoneto = salariobase - (retencionirpf / 100) * salariobase
    sueldoneto += trienios * 54

    if sesenios == 1:
        sueldoneto += 54
    elif sesenios == 2:
        sueldoneto += 86
    elif sesenios == 3:
        sueldoneto += 125

    if familianumerosa == "SÍ"or "SI":
        retencionirpf -= 1
        sueldoneto = salariobase - (retencionirpf / 100) * salariobase

    return sueldoneto


while True:
    nombre = input("Introduzca el nombre del trabajador o " "F" "para salir: ")
    if nombre.upper() == "F":
        break
    tipoempleado = input("¿Es funcionario de carrera (F) o interino (I)? ").upper()
    trienios = int(input("Número de trienios del trabajador: "))
    sesenios = int(input("Número de sesenios del trabajador: "))
    familianumerosa = input("¿Tiene familia numerosa (Sí/No)? ").upper()

    sueldoneto = calcularsueldoneto(tipoempleado, trienios, sesenios, familianumerosa)

    print("\n\nInforme del trabajador:")
    print("Nombre:", nombre)
    print(
        "Tipo de empleado:",
        "Funcionario de carrera" if tipoempleado == "F" else "Interino",
    )
    print("Trienios:", trienios)
    print("Sesenios:", sesenios)
    print("Familia numerosa:", familianumerosa)
    print("Sueldo neto:", sueldoneto, "€")
