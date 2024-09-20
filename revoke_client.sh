#!/bin/bash
# Verificar si se ha proporcionado un nombre de usuario
if [ -z "$1" ]; then
  echo "Uso: $0 <nombre_de_usuario>"
  exit 1
fi

export MENU_OPTION="2"
export CLIENT="$1"
./openvpn-install.sh
