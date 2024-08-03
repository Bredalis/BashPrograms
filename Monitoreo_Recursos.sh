#!/bin/bash
# Monitoreo de recursos y notificacion 
# si se pasa de los limite

echo "Monitoreo de los recursos del so"

echo "--- CPU ---"
echo "Uso de la CPU en tiempo real:"
ps aux

echo "Detalles sobre la arquitectura de la CPU:"
lscpu

echo "--- RAM ---"
echo "Uso de la memoria del sistema:"
free

echo "Estadísticas sobre la memoria:"
vmstat

echo "--- DISCO ---"

echo "Uso del espacio en disco de los sistemas de archivos:"
df

echo "Información sobre los dispositivos de bloque (discos y particiones):"
lsblk

echo "--- DISPOSITIVOS E/S ---"

echo "Dispositivos USB conectados:"
lsusb

echo "Dispositivos PCI conectados:"
lspci

echo "Registro del kernel:"
dmesg

echo "Estadísticas de E/S de dispositivos de almacenamiento:"
iostat

echo "--- RED ---"

echo "Estadísticas sobre las conexiones de red y su estado:"
netstat

# Notificar si pasa del limite de uso

cpu="top -bn1 | grep 'Cpu(s)' | awk '{print $2 + $4}'"
ram="free | awk '/Mem:/ {printf('%.2f\n', ($3/$2) * 100)}'"
disco="df --total | awk '/^total/ {print $5}' | sed 's/%//'"

if [[ $cpu > 80 || $ram > 80 || $disco > 80 ]]; then
	echo "Esta pasando el limite de uso:" 
	echo "CPU: $cpu | RAM: $ram | DISCO: $disco"
fi