#!/bin/bash
# Monitoreo de recursos y notificacion 
# si se pasa de los limite

# Definicion de colores usando el escape ANSI

rojo="\033[0;31m"
azul="\033[0;34m"
no_color="\033[0m"

echo -e "${rojo} Monitoreo de los recursos del so ${no_color}"

echo -e "\n ${azul} --- CPU --- ${no_color}"
echo -e "\n ${rojo} Uso de la CPU en tiempo real: ${no_color}"
ps aux

echo -e "\n ${rojo} Detalles sobre la arquitectura de la CPU: ${no_color}"
lscpu

echo -e "\n ${azul} --- RAM --- ${no_color}"
echo -e "\n ${rojo} Uso de la memoria del sistema: ${no_color}"
free

echo -e "\n ${rojo} Estadísticas sobre la memoria: ${no_color}"
vmstat

echo -e "\n ${azul} --- DISCO --- ${no_color}"

echo -e "\n ${rojo} Uso del espacio en disco de los sistemas de archivos: ${no_color}"
df

echo -e "\n ${rojo} Información sobre los dispositivos de bloque (discos y particiones): ${no_color}"
lsblk

echo -e "\n ${azul} --- DISPOSITIVOS E/S --- ${no_color}"

echo -e "\n ${rojo} Dispositivos USB conectados: ${no_color}"
lsusb

echo -e "\n ${rojo} Dispositivos PCI conectados: ${no_color}"
lspci

echo -e "\n ${rojo} Registro del kernel: ${no_color}"
dmesg

echo -e "\n ${rojo} Estadísticas de E/S de dispositivos de almacenamiento: ${no_color}"
iostat

echo -e "\n ${azul} --- RED --- ${no_color}"

echo -e "\n ${rojo} Estadísticas sobre las conexiones de red y su estado: ${no_color}"
netstat

# Evaluacion del paso del limite de uso

cpu=$(top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}')
ram=$(free | awk '/Mem:/ {printf("%.2f\n", ($3/$2) * 100)}')
disco=$(df --total | awk '/^total/ {print $5}' | sed 's/%//')

echo -e "\n ${rojo} Rendimiento: ${no_color} \n"

echo -e "${azul} CPU: ${no_color} ${cpu}"
echo -e "${azul} RAM: ${no_color} ${ram}"
echo -e "${azul} DISCO: ${no_color} ${disco}"

if [[ $cpu > 80 || $ram > 80 || $disco > 80 ]]; then
	echo "Esta pasando el limite de uso" 
fi