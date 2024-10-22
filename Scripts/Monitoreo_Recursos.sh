#!/bin/bash
# Monitoreo de recursos y mensaje si se exceden los límites

# Definición de colores usando el escape ANSI
rojo="\033[0;31m"
azul="\033[0;34m"
no_color="\033[0m"

echo -e "${rojo}Monitoreo de los recursos del SO${no_color}"

# Monitoreo de la CPU
echo -e "\n${azul}--- CPU ---${no_color}"
echo -e "\n${rojo}Uso de la CPU en tiempo real:${no_color}"
ps aux

echo -e "\n${rojo}Detalles sobre la arquitectura de la CPU:${no_color}"
lscpu

# Monitoreo de la RAM
echo -e "\n${azul}--- RAM ---${no_color}"
echo -e "\n${rojo}Uso de la memoria del sistema:${no_color}"
free

echo -e "\n${rojo}Estadísticas sobre la memoria:${no_color}"
vmstat

# Monitoreo de Disco
echo -e "\n${azul}--- DISCO ---${no_color}"
echo -e "\n${rojo}Uso del espacio en disco de los sistemas de archivos:${no_color}"
df

echo -e "\n${rojo}Información sobre los dispositivos de bloque (discos y particiones):${no_color}"
lsblk

# Monitoreo de Dispositivos E/S
echo -e "\n${azul}--- DISPOSITIVOS E/S ---${no_color}"

echo -e "\n${rojo}Dispositivos USB conectados:${no_color}"
lsusb

echo -e "\n${rojo}Dispositivos PCI conectados:${no_color}"
lspci

echo -e "\n${rojo}Registro del kernel:${no_color}"
dmesg

echo -e "\n${rojo}Estadísticas de E/S de dispositivos de almacenamiento:${no_color}"
iostat

# Monitoreo de Red
echo -e "\n${azul}--- RED ---${no_color}"
echo -e "\n${rojo}Estadísticas sobre las conexiones de red y su estado:${no_color}"
netstat

# Evaluación del uso de recursos y límites
cpu=$(top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}')
ram=$(free | awk '/Mem:/ {printf("%.2f\n", ($3/$2) * 100)}')
disco=$(df --total | awk '/^total/ {print $5}' | sed 's/%//')

echo -e "\n${rojo} Rendimiento:${no_color} \n"
echo -e "${azul} CPU:${no_color} ${cpu}"
echo -e "${azul} RAM:${no_color} ${ram}"
echo -e "${azul} DISCO:${no_color} ${disco}"

# Mensaje si algún recurso supera el 80%
if (( $(echo "$cpu > 80" | bc -l) || $(echo "$ram > 80" | bc -l) || $(echo "$disco > 80" | bc -l) )); then
	echo -e "\n${rojo}Advertencia: Se está excediendo el límite de uso de recursos${no_color}"
fi