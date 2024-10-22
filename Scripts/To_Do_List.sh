#!/bin/bash
# Lista de tareas

# Ruta del archivo de tareas
archivo="/mnt/c/Users/Bradalis/Downloads/Tareas.txt"

# Crear el archivo de tareas si no existe
touch "$archivo"

# Verificar si se pudo crear el archivo
if [[ $? -eq 0 ]]; then
	echo "Error: No se pudo crear el archivo"
	exit 1
fi

# Función para mostrar la lista de tareas
to_do_list () {
	echo -e "\n--- To Do List ---\n"
	cat -n "$archivo"
}

# Mostrar la lista de tareas al inicio
to_do_list

# Preguntar si quiere agregar una tarea
read -p "¿Quieres agregar una tarea? (s/n): " respuesta

# Verificar que el usuario no deje vacía la respuesta
if [[ -z "$respuesta" ]]; then
	echo "No se puede dejar vacío, debes responder s/n"
	exit 1
fi

# Convertir respuesta a minúsculas y verificar si es 's'
if [[ "${respuesta,,}" == "s" ]]; then
	read -p "Ingresa la tarea: " tarea
	echo "$tarea" >> "$archivo"
	echo "Tarea agregada"
fi

# Verificar si el archivo tiene tareas (líneas)
if [[ $(wc -l < "$archivo") -gt 0 ]]; then
	read -p "¿Quieres borrar una tarea? (s/n): " respuesta

	# Verificar que el usuario no deje vacía la respuesta
	if [[ -z "$respuesta" ]]; then
		echo "No se puede dejar vacío, debes responder s/n"
		exit 1
	fi

	# Convertir respuesta a minúsculas y verificar si es 's'
	if [[ "${respuesta,,}" == "s" ]]; then
		# Obtener la cantidad de líneas en el archivo
		total_lineas=$(wc -l < "$archivo")

		read -p "Ingrese el número de la línea a borrar (1-$total_lineas): " numero

		# Verificar que el número ingresado sea válido
		if [[ "$numero" =~ ^[0-9]+$ && "$numero" -ge 1 && "$numero" -le "$total_lineas" ]]; then
			sed -i "${numero}d" "$archivo"
			echo "Tarea borrada"
		else
			echo "Número de línea no válido"
		fi
	fi
fi