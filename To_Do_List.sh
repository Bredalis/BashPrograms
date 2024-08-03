#!/bin/bash
# Lista de tareas

tareas=()

read -p "¿Quieres agregar una tarea? (s/n) " respuesta

while [[ $respuesta == "s" ]]; 
do
	read -p "¿Quieres agregar una tarea? (s/n) " respuesta

	read -p "Ingresa la tarea: " tarea
	tareas+="$tarea"

done

echo -e "\n--- To Do List ---\n"

for ((i=0; i<${#tareas[*]}; i++));
do
	echo "$i ${tareas[i]}"
done

if [[ ${#tareas[*]} > 0 ]]; then

	echo -e "\n¿Quieres borrar una tarea? (s/n) "
	read respuesta

	if [[ $respuesta == "s" ]]; then
		read -p "Ingrese la tarea a borrar: " tarea
		unset tareas[$tarea]
	fi
fi