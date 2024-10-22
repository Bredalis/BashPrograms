#!/bin/bash
# Test_Calculadora

source Funcion_Test.sh
source "../Scripts/Calculadora.sh"

# Función para ejecutar y verificar un caso de prueba
funcion_test()

# Casos de prueba
funcion_test "3 + 5" "Suma: 8"
funcion_test "3 - 5" "Resta: -2"
funcion_test "3 x 5" "Multiplicación: 15"
funcion_test "10 / 2" "División: 5"
funcion_test "3 / 0" "No se puede dividir por cero"
funcion_test "3 * 5" "Operación no registrada"
funcion_test "5" "Error: Debes ingresar los números y el signo"
funcion_test "m + 5" "Error: Solo puedes ingresar números enteros"
funcion_test "3 ? 5" "Error: El signo es incorrecto"