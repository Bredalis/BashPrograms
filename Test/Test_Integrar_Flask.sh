#!/bin/bash
# Testing para el script de creación de estructura de Flask

source Funcion_Test.sh
source "../Scripts/Integrar_Flask.sh"

# Función para ejecutar y verificar un caso de prueba
funcion_test()

# Preparación: Crear carpetas y archivos temporales para pruebas
mkdir -p HTML CSS IMG JS
touch HTML/index.html HTML/about.html
touch CSS/style.css IMG/logo.png JS/app.js

# Casos de prueba

# Caso 1: Verificar si las carpetas templates y static se crean
funcion_test "" "templates static"

# Caso 2: Mover las carpetas HTML, CSS, IMG, y JS a sus respectivas ubicaciones
funcion_test "" "Moviendo las carpetas a static..."

# Caso 3: Verificar que los archivos .html se muevan de HTML a templates
funcion_test "" "Archivos .html movidos a templates/"

# Caso 4: Verificar la eliminación de la carpeta HTML tras mover los archivos
funcion_test "" "Carpeta HTML eliminada"

# Caso 5: Probar el movimiento de una carpeta adicional ingresada por el usuario
mkdir -p ExtraFolder
funcion_test "ExtraFolder\n" "Carpeta ExtraFolder movida a static"

# Caso 6: Sin ingresar una carpeta adicional
funcion_test "\n" "No se movió ninguna carpeta adicional"

# Limpiar después de las pruebas
rm -rf templates static ExtraFolder