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
    //Comprueba que la suma de los dados sea par O multiplo de tres
    Si (sumaDados MOD 3 = 0 O sumaDados MOD 2 = 0) 
		Entonces
		
        puntos <- puntos + 1
        Escribir "Has ganado un punto. Puntos actuales: ", puntos
		//Comprueba si la suma es impar y no es multriplo de 3 y resta un punto
    Sino Si (sumaDados MOD 2 <> 0 Y sumaDados MOD 3 <> 0) 
			Entonces
			
			puntos <- puntos - 1
			Escribir "Has perdidio un punto. Puntos restantes: ", puntos
		FinSi
	FinSi
		//Si la suma es 5 acaba el juego
	Si (sumaDados = 5) 
		Entonces
		
			Escribir "Has sacado un 5, lo siento, fin del juego"
			continuar <- Falso
			//Si sacas un 7 o te quedas sin puntos se acaba el juego
		Sino Si (sumaDados = 7 O puntos = 0) 
				Entonces
				
				Escribir "Mala suerte, has sacado una suma que ha agotado tus puntos, fin del juego"
				continuar <- Falso
			FinSi
			//Si agotas los puntos se acaba e juego
			Si (puntos = 0) 
				Entonces
				
				Escribir "Te has quedado sin puntos... Se acabó del juego"
				continuar <- Falso
			FinSi
		FinSi
	FinMientras
		Escribir "Has conseguido obtener", puntos, " puntos."
FinAlgoritmo
