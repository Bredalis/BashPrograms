
# Función para ejecutar y verificar un caso de prueba
funcion_test() {
	
	# Obtener los datos
	local entrada="$1"
	local salida_esperada="$2"

	# Ejecutar el script simulando la entrada del usuario
	salida=$(echo "$entrada" | bash "$ruta_script")

	# Verificar si la salida coincide con la esperada
	if [[ "$salida" == *"$salida_esperada"* ]]; then
		echo "Prueba pasada: $entrada -> $salida"
	else
		echo -e "\nPrueba fallida: $entrada"
		echo "Salida esperada: $salida_esperada"
		echo "Salida obtenida: $salida"
	fi
}