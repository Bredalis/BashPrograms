#!/bin/bash
# Test_Git_Automatico

source Funcion_Test.sh
source "../Scripts/Git_Automatico.sh"

# Función para ejecutar y verificar un caso de prueba
funcion_test()

# Casos de prueba

# Caso 1: Clonar un repositorio en la ruta actual
funcion_test "s\nn\nhttps://github.com/usuario/repo.git" "Clonado el repositorio"

# Caso 2: Cambiar a una nueva ruta antes de clonar
mkdir -p /tmp/test_git_dir
funcion_test "s\ns\n/tmp/test_git_dir\nhttps://github.com/usuario/repo.git" "Clonado el repositorio"

# Caso 3: Inicializar un repositorio vacío y hacer un commit
mkdir -p /tmp/test_repo
funcion_test "n\n/tmp/test_repo\nn\nMensaje de commit" "Commit exitoso"

# Caso 4: Configurar usuario y correo electrónico
funcion_test "n\n/tmp/test_repo\nn\nMensaje de commit\ns\nuser@example.com nombre" "Configuración global actualizada"

# Caso 5: Añadir un repositorio remoto y hacer push
funcion_test "n\n/tmp/test_repo\nn\nMensaje de commit\nn\ns\nhttps://github.com/usuario/repo.git" "Push exitoso"

# Caso 6: Agregar un tag y hacer push del tag
funcion_test "n\n/tmp/test_repo\nn\nMensaje de commit\nn\nn\ns\ntag_v1\nMensaje del tag" "Push del tag exitoso"

# Caso 7: Opción de no realizar ninguna acción
funcion_test "n\n/tmp/test_repo\ns" "No se realizó ninguna acción"

# Limpiar después de las pruebas
[ -d /tmp/test_git_dir ] && rm -rf /tmp/test_git_dir
[ -d /tmp/test_repo ] && rm -rf /tmp/test_repo