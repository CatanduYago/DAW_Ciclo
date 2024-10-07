Algoritmo Ahorcado
	definir palabr, palabra, casillas como caracter
	definir aciertos, turnos como real
	
	Escribir "      *Menú*"
	
	Escribir "   1. Nivel Bàsico"
	Escribir "   2. Nivel Medio"
	escribir "   3. Salir "
	escribir"   Ingrese su opciòn (1-3)"
	leer OP
	Segun OP hacer
		1:
			
			p_tb<-20
			oportunidades<-8
			dimension palabra[p_tb]
			
			palabra[1]<-"duda"
			palabra[2]<-"ojo"
			palabra[3]<-"anima"
			palabra[4]<-"duro"
			palabra[5]<-"arco"
			palabra[6]<-"ahoga"
			palabra[7]<-"digo"
			palabra[8]<-"come"
			palabra[9]<-"acero"
			palabra[10]<-"echo"
			palabra[11]<-"uso"
			palabra[12]<-"apoye"
			palabra[13]<-"cuña"
			palabra[14]<-"rio"
			palabra[15]<-"alma"
			palabra[16]<-"gota"
			palabra[17]<-"via"
			palabra[18]<-"amigo"
			palabra[19]<-"copa"
			palabra[20]<-"feo"
			
			
			a_<-' '
			h_<-' '
			o_<-' '
			r_<-' '
			c_<-' '
			ax<-' '
			d_<-' '
			ox<-' '
			
			turnos<-0
			aciertos<-0
			
			palabr<-palabra[azar(p_tb)+1]
			n<-Longitud(palabr)
			Dimension casillas(n)
			Para x<-1 Hasta n Con Paso 1 Hacer
				casillas[x]<-"_"
			Fin Para
			Repetir
				Escribir ""
				escribir "Oportuniddes restantes: ", oportunidades-turnos
				Para x<-1 Hasta n Con Paso 1 Hacer
					Escribir Sin Saltar " ", casillas[x]
				Fin Para
				escribir " "
				Escribir Sin Saltar "Escriba la letra: "
				leer letra
				encontrando<-Falso
				Para x<-1 Hasta n Con Paso 1 Hacer
					chr<-Subcadena(palabr, x,x)
					Si Mayusculas(letra)=Mayusculas(chr) Entonces
						encontrando<-Verdadero
						si casillas[x]="_" Entonces
							casillas[x]<-chr
							aciertos<-aciertos+1
							
						FinSi
					Fin Si
				FinPara
				si no encontrando Entonces
					turnos<-turnos+1
					Escribir "Letra no encontrada."
					Segun turnos hacer
						1:
							a_<-'A'
						2:
							h_<-'H'
						3:
							o_<-'O'
						4 :
							r_<-'R'
						5:
							c_<-'C'
						6:
							ax<-'A'
						7:
							d_<-'D'
						8:
							Ox<-'O'
							
							
					FinSegun	
				FinSi
				Escribir "",a_
				Escribir "",h_
				Escribir "",o_
				Escribir "",r_
				Escribir "",c_
				Escribir "",ax
				Escribir "",d_
				Escribir "",ox
				
				
			Hasta Que turnos>=oportunidades o aciertos>=n;
			si aciertos=n Entonces
				
				Escribir "Felicidades, has ganado"
			sino
				Escribir "Has perdido."
			FinSi
			Escribir "La palabra secreta es: ", palabr;
			escribir "Aciertos: ",aciertos,"  Fallos: ",turnos
			escribir "PRESIONE CUALQUIER TECLA PARA CONTINUAR";
			esperar Tecla;
		2:
			
			p_tb<-20
			oportunidades<-8
			dimension palabra[p_tb]
			
			palabra[1]<-"fabricado"
			palabra[2]<-"camiseta"
			palabra[3]<-"ninguno"
			palabra[4]<-"zapato"
			palabra[5]<-"habaneros"
			palabra[6]<-"cebolleta"
			palabra[7]<-"telefono"
			palabra[8]<-"cobija"
			palabra[9]<-"habilidad"
			palabra[10]<-"eliminar"
			palabra[11]<-"galleta"
			palabra[12]<-"alarma"
			palabra[13]<-"vaciados"
			palabra[14]<-"bolsillo"
			palabra[15]<-"archivar"
			palabra[16]<-"espejismo"
			palabra[17]<-"compilado"
			palabra[18]<-"celebrar"
			palabra[19]<-"rebotar"
			palabra[20]<-"comida"
			
			a_<-' '
			h_<-' '
			o_<-' '
			r_<-' '
			c_<-' '
			ax<-' '
			d_<-' '
			ox<-' '
			
			turnos<-0
			aciertos<-0
			
			palabr<-palabra[azar(p_tb)+1]
			n<-Longitud(palabr)
			Dimension casillas(n)
			Para x<-1 Hasta n Con Paso 1 Hacer
				casillas[x]<-"_"
			Fin Para
			Repetir
				Escribir ""
				or=oportunidades-turnos
				escribir "Oportuniddes restantes: ", or
				Para x<-1 Hasta n Con Paso 1 Hacer
					Escribir Sin Saltar " ", casillas[x]
				Fin Para
				escribir " "
				Escribir Sin Saltar "Escriba la letra: "
				leer letra
				encontrando<-Falso
				Para x<-1 Hasta n Con Paso 1 Hacer
					chr<-Subcadena(palabr, x, x)
					Si Mayusculas(letra)=Mayusculas(chr) Entonces
						encontrando<-Verdadero
						si casillas[x]='_' Entonces
							casillas[x]<-nose
							aciertos<-aciertos+1
							
						FinSi
					Fin Si
				FinPara
				si no encontrando Entonces
					turnos<-turnos+1
					Escribir "Letra no encontrada."
					Segun turnos hacer
						1:
							a_<-'A'
						2:
							h_<-'H'
						3:
							o_<-'O'
						4 :
							r_<-'R'
						5:
							c_<-'C'
						6:
							ax<-'A'
						7:
							d_<-'D'
						8:
							Ox<-'O'
							
							
					FinSegun	
				FinSi
				Escribir "",a_
				Escribir "",h_
				Escribir "",o_
				Escribir "",r_
				Escribir "",c_
				Escribir "",ax
				Escribir "",d_
				Escribir "",ox
				
				
				
			Hasta Que turnos>=oportunidades o aciertos>=n;
			si aciertos=n Entonces
				
				Escribir "Felicidades, has ganado"
			sino
				Escribir "Has perdido."
			FinSi
			Escribir "La palabra secreta es: ", palabr;
			escribir "Aciertos: ",aciertos,"  Fallos: ",fallos, "  Intentos: ",intentos
			
			
	FinSegun
	
		
FinAlgoritmo
