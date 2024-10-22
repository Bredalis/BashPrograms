#!/bin/bash
# Comandos de Git automatizados

# Función para cambiar de directorio
cambiar_directorio() {
    cd "$1" || { echo "No se pudo cambiar a la carpeta: $1"; exit 1; }
}

# Función para confirmar la entrada del usuario
confirmar() {
    read -p "$1 (s/n): " respuesta
    [[ "${respuesta,,}" == "s" ]]  # Convertir a minúsculas
}

echo "Comandos de Git automatizados:"

# Clonar un repositorio
confirmar "¿Quieres clonar un repositorio?"

if [[ $? -eq 0 ]]; then
    confirmar "¿Quieres cambiar de ruta para clonar el repo?"

    if [[ $? -eq 0 ]]; then
        read -p "Ingresa la nueva ruta: " nueva_ruta
        cambiar_directorio "$nueva_ruta"
    fi

    read -p "Ingrese la URL: " url
    git clone "$url" || { echo "Error al clonar el repositorio"; exit 1; }
    exit 0
fi

read -p "Ingrese la ruta de la carpeta para aplicarle Git: " carpeta
cambiar_directorio "$carpeta"

# Inicializar la carpeta o no
ls -lha
confirmar "¿Su carpeta tiene el archivo .git?"

if [[ $? -eq 1 ]]; then
    git init
fi

git status
git add .

read -p "Ingrese el mensaje para el commit: " mensaje_commit
git commit -m "$mensaje_commit" || { echo "Error al crear el commit"; exit 1; }

# Manejar las configuraciones
confirmar "¿Le aparece git config --global user.email y user.name?"

if [[ $? -eq 0 ]]; then
    read -p "Ingrese su correo electrónico y su nombre: " correo nombre
    git config --global user.email "$correo"
    git config --global user.name "$nombre"
fi

confirmar "¿Quieres agregar un repositorio remoto?"

if [[ $? -eq 0 ]]; then
    read -p "Ingrese la URL del repositorio: " url_repositorio
    git remote add origin "$url_repositorio"
    git push -u origin master
fi

confirmar "¿Quieres subir los cambios al repositorio remoto?"

if [[ $? -eq 0 ]]; then
    git push || { echo "Error al hacer push"; exit 1; }
fi

confirmar "¿Quieres agregar un tag?"

if [[ $? -eq 0 ]]; then
    read -p "Ingresa el tag: " tag
    read -p "Ingresa el mensaje del tag: " mensaje_tag
    
    git tag -a "$tag" -m "$mensaje_tag"
    git push origin "$tag"
fi