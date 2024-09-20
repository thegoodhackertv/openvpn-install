#!/bin/bash
# Comprobar que extraiga correctamente los datos que son del status.log ya que crear entradas tambien de ultimos usuarios conectados.
# Ruta del archivo status.log
STATUS_LOG="/var/log/openvpn/status.log"

# Comprobar si hay usuarios conectados
CONNECTED_USERS=$(grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+,' "$STATUS_LOG")

if [ -z "$CONNECTED_USERS" ]; then
            echo "No hay usuarios conectados."
                exit 0
fi

# Mostrar el encabezado
echo "Virtual Address     Common Name     Real Address      Last Ref"
echo "--------------------------------------------------------------"

# Mostrar la información de los usuarios conectados en formato de tabla
grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+,' "$STATUS_LOG" | while IFS=',' read -r virtual_address common_name real_address last_ref; do
    printf "%-18s %-15s %-18s %-20s\n" "$virtual_address" "$common_name" "$real_address" "$last_ref"
done
