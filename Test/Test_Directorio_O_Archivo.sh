#!/bin/bash
# Test_Directorio_O_Archivo

source Funcion_Test.sh
source "../Scripts/Directorio_O_Archivo.sh"

# Función para ejecutar y verificar un caso de prueba
funcion_test()

# Casos de prueba

# Caso 1: Crear un directorio que no existe
funcion_test "1\ntest_dir" "El directorio fue creado"

# Caso 2: Intentar crear un directorio que ya existe
mkdir -p test_dir
funcion_test "1\ntest_dir" "El directorio ya existe"

# Caso 3: Crear un archivo que no existe y agregar texto
funcion_test "2\ntest_file.txt\nEste es un archivo de prueba" "Este es un archivo de prueba"

# Caso 4: Intentar crear un archivo que ya existe
touch test_file.txt
funcion_test "2\ntest_file.txt" "El archivo ya existe"

# Caso 5: Opción fuera de rango
funcion_test "3" "Opción fuera de rango"

# Limpiar después de las pruebas
[ -d test_dir ] && rm -rf test_dir
[ -f test_file.txt ] && rm -f test_file.txt