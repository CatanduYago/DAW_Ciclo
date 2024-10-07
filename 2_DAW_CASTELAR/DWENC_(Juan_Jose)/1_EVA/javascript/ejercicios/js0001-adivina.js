// Crea un script para adivinar un numero del 1 al 1000
// El script debe indicar si el numero es mayor o menor
// El script debe indicar el numero de intentos
const prompt = require('prompt-sync')();
let numero = Math.floor(Math.random() * 1000) + 1; 
let intentos = 0;
let adivinado = false;

while (adivinado === false) {
    if (intentos == 10) {
        console.log("Has superado el número de intentos");
        console.log("El número era: " + numero);
        break;
    }
    
    let numeroUsuario = Number(prompt("Intenta adivinar un número del  1 al 1000: ")); 

    if (numeroUsuario < numero) {
        console.log("El número es mayor");
        intentos++;
    }
    else if (numeroUsuario > numero) {
        console.log("El número es menor");
        intentos++;
    }
    else if (numeroUsuario === numero) {
        console.log("¡Has adivinado el número!");
        adivinado = true;
    }
}
