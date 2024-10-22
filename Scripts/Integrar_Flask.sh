#!/bin/bash
# Crear la estructura de Flask

# Crear carpetas si no existen
mkdir -p templates static

# Mover las carpetas a static
echo -e "Moviendo las carpetas a static... \n"

# Verificar la existencia de las carpetas antes de moverlas
[[ -d "HTML" ]] && sudo mv HTML templates/
[[ -d "CSS" ]] && sudo mv CSS static/
[[ -d "IMG" ]] && sudo mv IMG static/
[[ -d "JS" ]] && sudo mv JS static/

# Verificar que las carpetas se movieron correctamente
ls templates/
ls static/

# Pedir al usuario que ingrese el nombre de una carpeta adicional si es necesario
read -p "Ingresa el nombre de la carpeta que falta (o dejalo vacío si no falta ninguna): " carpeta

if [[ -n "$carpeta" ]]; then
	mv "$carpeta" static/
	echo "Carpeta $carpeta movida a static"
fi

# Verificar si existe la carpeta templates/HTML
if ! [[ -d "templates/HTML" ]]; then
	echo "La carpeta templates/HTML no existe, no hay archivos que mover"
	exit 0
fi

# Mover los archivos .html de la carpeta HTML a templates
cd templates/HTML || { echo "No se pudo acceder a la carpeta templates/HTML"; exit 1; }
ls
mv *.html ../
echo "Archivos .html movidos a templates/"
ls
cd ..

# Borrar la carpeta HTML si se ha movido correctamente
if [[ -d "HTML" ]]; then
	sudo rm -rf HTML
	echo "Carpeta HTML eliminada"
fi

ls