#!/bin/bash
# Crear la estructura de Flask

# Crear carpetas

mkdir templates
mkdir static

# Mover las carpetas

echo -e "Mover carpetas a static \n"

ls
sudo mv HTML templates
mv CSS static
mv IMG static
mv JS static

ls
read -p "Ingresa el nombre de la carpeta que falta: " carpeta

mv $carpeta static

# Mover los archivos de HTML a templates

cd templates/HTML
ls

mv *.html ../

ls
cd

# Borrar la carpeta HTML

sudo rm -rf HTML
ls