#!/bin/bash
# Calculadora Aritmética

calculadora () {

    if [[ "$3" == 0 && "$2" == "/" ]]; then
        echo "No se puede dividir por cero"
        exit 1
    fi

    case "$2" in
        "+") echo "Suma: $(("$1" + "$3"))" ;;
        "-") echo "Resta: $(("$1" - "$3"))" ;;
        "x") echo "Multiplicación: $(("$1" * "$3"))" ;;
        "/") echo "División: $(("$1" / "$3"))" ;;
        *) echo "Operación no registrada" ;;
    esac
}

echo "Ingrese el primer número, la operación (+, -, x, /) y el segundo número:"
read num1 signo num2

# Verificar que no deja las variables vacías
if [[ -z "$num1" || -z "$signo" || -z "$num2" ]]; then
    echo "Error: Debes ingresar los números y el signo"
    exit 1
fi

# Verificar que lo datos ingresados sean números enteros
if ! [[ "$num1" =~ ^-?[0-9]+$ && "$num2" =~ ^-?[0-9]+$ ]]; then
    echo "Error: Solo puedes ingresar números enteros"
    exit 1
fi

# Verificar que el signo sea correcto
if ! [[ "$signo" =~ ^[\+\-x/]$ ]]; then
    echo "Error: El signo es incorrecto"
    exit 1
fi

# Llamar a la función
calculadora "$num1" "$signo" "$num2"