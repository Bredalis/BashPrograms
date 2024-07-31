#!/bin/bash
# Comandos de Git automatizados

echo "Comandos de Git automatizados:"
read -p "¿Quieres clonar un repositorio? (s/n): " clonar

if [[ $clonar == "s" ]]; then
    read -p "¿Quieres cambiar de ruta para clonar el repo? (s/n): " respuesta

    if [[ $respuesta == "s" ]]; then
        read -p "Ingresa la nueva ruta: " nueva_ruta
        cd "$nueva_ruta" || { echo "No se pudo cambiar de carpeta"; exit 1; }
    fi

    read -p "Ingrese la URL: " url
    git clone "$url" || { echo "Error al clonar el repositorio"; exit 1; }
    exit 0
fi

# Ejecutar comandos básicos

read -p "Ingrese la ruta de la carpeta para aplicarle el control de versiones: " carpeta

cd "$carpeta" || { echo "No se pudo cambiar de carpeta"; exit 1; }
git init
git status
git add .

read -p "Ingrese el mensaje para el commit: " mensaje_commit
git commit -m "$mensaje_commit" || { echo "Error al crear el commit"; exit 1; }
git push || { echo "Error al hacer push"; exit 1; }