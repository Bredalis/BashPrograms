#!/bin/bash
# Test_To_Do_List

source Funcion_Test.sh
source "../Scripts/To_Do_List.sh"

# Función para ejecutar y verificar un caso de prueba
funcion_test()

# Casos de prueba

# Caso 1: Lista de tareas vacía
funcion_test "n\nn" "--- To Do List ---"

# Caso 2: Agregar una tarea y verificarla
funcion_test "s\nTarea 1\nn\n" "Tarea agregada"

# Caso 3: Borrar una tarea de la lista
echo "Tarea 1" > /mnt/c/Users/Bradalis/Downloads/Tareas.txt  # Prepara archivo de tareas
funcion_test "n\ns\n1\n" "Tarea borrada"

# Caso 4: Ingresar una respuesta vacía en la confirmación de agregar tarea
funcion_test "\n" "No se puede dejar vacío, debes responder s/n"

# Caso 5: Ingresar una respuesta no válida al preguntar si desea borrar una tarea
echo "Tarea 1" > /mnt/c/Users/Bradalis/Downloads/Tareas.txt  # Prepara archivo de tareas
funcion_test "n\nx\n" "No se puede dejar vacío, debes responder s/n"

# Limpiar después de las pruebas
rm -f /mnt/c/Users/Bradalis/Downloads/Tareas.txt