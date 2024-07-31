#!/bin/bash
# Calculadora Aritmetica

calculadora () {

    if [[ $3 == 0 ]]; then
        echo "No se puede dividir por cero"

    elif [[ $2 == "+" ]]; then
        echo "Suma: $(($1 + $3))"

    elif [[ $2 == "-" ]]; then 
        echo "Resta: $(($1 - $3))"

    elif [[ $2 == "x" ]]; then
        echo "Multiplicacion: $(($1 * $3))"

    elif [[ $2 == "/" ]]; then
        echo "Division: $(($1 / $3))"

    else
        echo "Operacion no registrada"
    fi
}

echo "Ingrese el primer numero, la operacion (+, -, x, /) y el segundo numero:"
read num1 signo num2
calculadora $num1 $signo $num2