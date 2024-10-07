def volumen(radio, altura):
    if altura > radio:
        volumen = 3.1416 * (radio ** 2) * altura
        return volumen
    else:
        return "Error"

radio = 5
altura = 10
resultado = volumen(radio, altura)

if isinstance(resultado, str):
    print(resultado)
else:
    print(f"El volumen del cilindro es: {resultado} m^3")
