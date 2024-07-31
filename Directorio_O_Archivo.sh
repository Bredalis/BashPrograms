#!/bin/bash
# Crear un directorio o archivo

input_type=""
input_name=""

read -p "Desea generar un directorio(1) o un archivo (2)? " input_type

if (($input_type != 1 && $input_type != 2)); then
    echo "Error al crear el directorio o archivo"
fi

if (($input_type == 1)); then
    read -p "Ingrese el nombre del directorio: " input_name
    mkdir -m 777 $input_name
fi

if (($input_type == 2)); then
    read -p "Ingrese el nombre del archivo: " input_name
    touch $input_name
fi