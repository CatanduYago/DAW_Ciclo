def irpf(sueldo):
    bruto = sueldo * 0.17
    total_neto = sueldo - bruto
    return total_neto

def desgravacion(desgr_concepto, sueldo):
    total_desgr = 0.17 + desgr_concepto
    bruto = sueldo * total_desgr
    total_neto = sueldo - bruto
    return total_neto

concep_desgravar = 0
salario_bruto = 0
num_ss = 0
selec_categoria = 0
categoria = ""
nombre = input("Introduce el nombre: ")
num_ss = int(input("Introduce el numero de la Seguridad Social: "))
print("Categoria Profesional:\n" +
      "1.-Profesor Secundaria\n" +
      "2.-Jefe de Servicio Adm.Publica\n" +
      "3.-Economista Adm.Publica\n" +
      "4.-Abogado\n" +
      "5.-Ingeniero\n" +
      "6.-Maestro de Primaria\n" +
      "7.-Ing.Técnico\n" +
      "8.-Tec.Sistemas Informaticos\n" +
      "9.-Administrativo\n" +
      "10.-Aux.De Justicia")
selec_categoria = int(input())
if selec_categoria == 1:
    categoria = "Profesor Secundaria"
elif selec_categoria == 2:
    categoria = "Jefe de Servicio Adm.Publica"
elif selec_categoria == 3:
    categoria = "Economista Adm.Publica"
elif selec_categoria == 4:
    categoria = "Abogado"
elif selec_categoria == 5:
    categoria = "Ingeniero"
elif selec_categoria == 6:
    categoria = "Maestro de Primaria"
elif selec_categoria == 7:
    categoria = "Ing.Tecnico"
elif selec_categoria == 8:
    categoria = "Tec.Sistemas Informaticos"
elif selec_categoria == 9:
    categoria = "Administrativo"
elif selec_categoria == 10:
    categoria = "Aux.De Justicia"

salario_bruto = float(input("Introduce salario bruto: "))
print("Aplicar desgravación\n" +
      "1.-Si\n" +
      "2.-No")
desgravar = int(input())
if desgravar == 1:
    print("Concepto por el que desgrava\n" +
          "1.-Médicos sin fronteras\n" +
          "2.-STOP Guera Ucrania\n" +
          "3.-Save The Children\n" +
          "4.-ACNUR")
    desgravar = int(input())
    if desgravar == 1:
        concep_desgravar = 0.02
    elif desgravar == 2:
        concep_desgravar = 0.05
    elif desgravar == 3 or desgravar == 4:
        concep_desgravar = 0.01
    print("Nombre:", nombre)
    print("Categoria profesinoal:", categoria)
    print("Nº Seguridad Social:", num_ss)
    print("Salario bruto:", salario_bruto)
    print("Salario neto:", desgravacion(concep_desgravar, salario_bruto))
else:
    print("Nombre:", nombre)
    print("Categoria profesional:", categoria)
    print("Nº Seguridad Social:", num_ss)
    print("Salario bruto:", salario_bruto)
    print("Salario neto:", irpf(salario_bruto))

