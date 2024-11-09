#!/bin/bash
# Script de testing para el Monitoreo de Recursos

source "../Scripts/Monitoreo_Recursos.sh"

# Ejecutar el script de monitoreo
salida=$(bash "$ruta_script")

# Comprobar si los valores se encuentran en la salida
comprobar_salida() {
    local termino="$1"
    local mensaje="$2"

    if echo "$salida" | grep -q "$termino"; then
        echo "Prueba pasada: $mensaje"
    else
        echo "Prueba fallida: No se encontró '$termino' en la salida"
    fi
}

# Pruebas

# Comprobar que se esté monitoreando la CPU
comprobar_salida "CPU" "Monitoreo de CPU"

# Comprobar que se esté monitoreando la RAM
comprobar_salida "RAM" "Monitoreo de RAM"

# Comprobar que se esté monitoreando el disco
comprobar_salida "DISCO" "Monitoreo de Disco"

# Comprobar que se está mostrando una advertencia si se exceden los límites
comprobar_salida "Advertencia" "Mensaje de advertencia por uso elevado de recursos"

# Comprobar si la salida contiene uso de red
comprobar_salida "RED" "Monitoreo de red"