Algoritmo Juegovida
	// Definición de variables iniciales
Definir vidas, puntos, sumaDados Como Entero
Definir continuar Como Lógico
continuar <- Verdadero

Escribir "Juguemos a un juego..."
//generador de puntos aleatorios entre 1 y 10 y deja saber con cuantos puntos comienza
Escribir "Generando puntos...."
puntos <- Aleatorio(1, 10)

Escribir "Comienzas con ",puntos," puntos."
// La variable continuar, antes, ha sido definida como logica (booleana) y verdadera, para que en el moment en el 
// que el usuario se quede sin puntos se convierta en falso y terminar el mientras
Mientras (continuar)
	
    Escribir "Lanzando los dados...."
	//Hacemos la tirada del primer dado
    Dado1 <- Aleatorio(1, 6)
	Escribir "El resultado del primer dado es..."
	Escribir Dado1
	//Hacemos la tirada del segundo dad o
    Dado2 <- Aleatorio(1, 6)
	Escribir "El resultado del segundo dado es..."
	Escribir Dado2
	//se suman ambos dados.
    Dados <- Dado1 + Dado2
    Escribir "La suma es ", Dados
    //Comprueba que la suma de los dados sea par O multiplo de tres y suma un punto.
    Si (Dados MOD 3 = 0 O Dados MOD 2 = 0) 
		Entonces
        puntos <- puntos + 1
        Escribir "Has ganado un punto. Puntos actuales: ", puntos
		//Si e l numero de resultado de los dados es impar y no es multiplo de 3, resta un pnuto.
    Sino Si (Dados MOD 2 <> 0 Y Dados MOD 3 <> 0) 
			Entonces
			puntos <- puntos - 1
			Escribir "Has perdidio un punto. Puntos restantes: ", puntos
		FinSi
	FinSi
		//Si la suma da 5 termina el juego
	Si (Dados = 5) 
		Entonces
			Escribir "Has sacado un 5, lo siento, fin del juego"
			continuar <- Falso
			//Si sacas un 7 o terminas sin puntos termina el programa
		Sino Si (Dados = 7 O puntos = 0) 
				Entonces
				Escribir "Mala suerte, has sacado una suma que ha agotado tus puntos, fin del juego"
				continuar <- Falso
			FinSi
			//Si te has qeudado sin puntos termina el jugeo
			Si (puntos = 0) 
				Entonces
				
				Escribir "Te has quedado sin puntos... Se acabó del juego"
				continuar <- Falso
			FinSi
		FinSi
		//Si el booleano continuar se convierte en falso, es decir, has perdido, termina el mientras
	FinMientras
		Escribir "Has terminado con ", puntos, " puntos."
FinAlgoritmo
