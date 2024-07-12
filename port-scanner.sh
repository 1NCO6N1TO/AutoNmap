#!/bin/bash 

# Definir colores
rojo='\033[0;31m'
verde='\033[0;32m'
amarillo='\033[1;33m'
sin_color='\033[0m'

# Función para validar IP
function ValidarIP() {
    local ip=$1
    local regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

    if [[ $ip =~ $regex ]]; then
        # Validar que cada octeto esté en rango de 0 y 255
        IFS='.' read -r -a octetos <<< $ip
        for octeto in "${octetos[@]}"; do
            if [[ $octeto -lt 0 ]] || [[ $octeto -gt 255 ]]; then
                echo -e "${rojo}[!]Error: El octeto $octeto no está en el rango de 0 y 255.${sin_color}"
                exit 1
            fi
        done
        return 0
    else
        return 1 
    fi
}

if [ $# -ne 1 ]; then
    echo -e "${amarillo}[!]Uso incorrecto: Debe ingresar una dirección IP como argumento.${sin_color}"
    echo -e "${amarillo}[+]Ejemplo: $0 192.168.1.1${sin_color}"
    exit 1
fi

if ValidarIP $1; then
    echo -e "${verde}[+]La dirección IP es válida. Procediendo con el escaneo...${sin_color}"
    echo -e "${verde}\n[+]Iniciando escaneo de todos los puertos abiertos...${sin_color}"
    sudo nmap -p- --open -sS --min-rate 5000 -n -Pn $1 -oG allPorts > /dev/null
    sleep 2
    echo -e "${verde}\n[+]Extrayendo puertos abiertos...${sin_color}"
    port="$(cat allPorts | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    echo -e "${verde}[+]Puertos abiertos detectados: $port${sin_color}"
    echo -e "${verde}[+]Dirección IP objetivo: $1${sin_color}"
    sleep 2
    echo -e "${verde}\nEscaneando servicios en los puertos abiertos...${sin_color}"
    sudo nmap -p $port -sCV $1 -oN target
else
    echo -e "${rojo}[!]Error: La dirección IP ingresada no es válida.${sin_color}"
fi
