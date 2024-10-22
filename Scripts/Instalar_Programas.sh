#!/bin/bash
# Script que instala programas

read -p "Ingrese el nombre del programa: " programa

# Verificar que el usuario ingrese un valor
if [[ -z "$programa" ]]; then
	echo "Error: Tienes que ingresar el nombre del programa, no se puede quedar vacío"
	exit 1
fi

# Verificar si el programa ya está instalado
if dpkg -l | grep -q "^ii.*$programa*"; then
	echo "El programa '$programa' ya está instalado"
	exit 0
fi

# Actualizar el sistema e instalar el programa
echo "Actualizando lista de paquetes"

if ! sudo apt update && sudo apt upgrade -y; then
	echo "Error al actualizar los paquetes"
	exit 1
fi

echo "Instalando el programa '$programa' ..."
if ! sudo apt install -y "$programa"; then
	echo "Error al instalar el programa '$programa'"
	exit 1	
fi

echo "El programa '$programa' se ha instalado correctamente"