#!/bin/bash
# Lista de tareas

echo -e "\n--- Uso del TO DO LIST ---\n"
echo "Ingresar tarea con s"
echo "No ingresar tarea con n"
echo -e "Borrar tareas con s y agregar el numero de linea de esa tarea\n"

cd /mnt/c/Users/Bradalis/Downloads/
touch Tareas.txt

to_do_list () {
	echo -e "\n--- To Do List ---\n"
	cat -n Tareas.txt
}

to_do_list

echo ""
read -p "¿Quieres agregar una tarea? " respuesta

if [[ $respuesta == "s" ]]; then
	read -p "Ingresa la tarea: " tarea
	echo "$tarea" >> Tareas.txt 
fi

if [[ $(cat Tareas.txt | wc -l) -ne 0 ]]; then
	read -p "¿Quieres borrar una tarea? " respuesta

	if [[ $respuesta == "s" ]]; then
		read -p "Ingrese la linea a borrar: " numero
		sed -i "$numero d" Tareas.txt
	fi
fi

to_do_list