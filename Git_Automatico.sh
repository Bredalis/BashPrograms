#!/bin/bash
# Comandos de Git automatizados

# Clonar un repositorio

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

read -p "Ingrese la ruta de la carpeta para aplicarle Git: " carpeta
cd "$carpeta" || { echo "No se pudo cambiar de carpeta"; exit 1; }

# Inicializar la carpeta o no

read -p "¿Su carpeta esta inicializada? (s/n): " estado_init

if [[ $estado_init == "n" ]]; then
    git init
fi

git status
git add .

read -p "Ingrese el mensaje para el commit: " mensaje_commit
git commit -m "$mensaje_commit" || { echo "Error al crear el commit"; exit 1; }

# Manejar las configuraciones

read -p "¿Le aparece git config --global user.email y user.name? (s/n): " estado_config

if [[ $estado_config == "s" ]]; then
    read -p "Ingrese su correo electronico y su nombre: " correo nombre
    git config --global user.email "$correo"
    git config --global user.name "$nombre"
fi

read -p "¿Quieres agregar un repositorio remoto? (s/n): " repositorio_remoto

if [[ $repositorio_remoto == "s" ]]; then
    read -p "Ingrese la url del repositorio: " url_repositorio
    git remote add origin "$url_repositorio"
    git push -u origin master
fi

read -p "¿Quieres subir los cambios al repositorio remoto? (s/n): " subir_cambios

if [[ $subir_cambios == "s" ]]; then
    git push || { echo "Error al hacer push"; exit 1; }
fi