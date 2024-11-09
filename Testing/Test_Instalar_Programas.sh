#!/bin/bash
# Test_Instalar_Programas

source Funcion_Test.sh
source "../Scripts/Instalar_Programas.sh"

# Función para ejecutar y verificar un caso de prueba
funcion_test()

# Casos de prueba

# Caso 1: El usuario no ingresa ningún nombre de programa
funcion_test "\n" "Error: Tienes que ingresar el nombre del programa, no se puede quedar vacío"

# Caso 2: El programa ya está instalado
# Asumimos que el programa 'curl' ya está instalado en el sistema
funcion_test "curl\n" "El programa 'curl' ya está instalado"

# Caso 3: Error al actualizar la lista de paquetes
funcion_test "paquete_inexistente\n" "Error al actualizar los paquetes"

# Caso 4: Error al instalar el programa
# Intentar instalar un programa inexistente
funcion_test "paquete_inexistente\n" "Error al instalar el programa 'paquete_inexistente'"

# Caso 5: Instalación exitosa
# Asumimos que 'htop' no está instalado y el script debería instalarlo correctamente
funcion_test "htop\n" "El programa 'htop' se ha instalado correctamente"