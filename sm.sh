#!/bin/bash

# Función para enviar mensaje a WhatsApp
send_message() {
    local phone_number="$1"
    local message="Whoami"

    # Abre WhatsApp en segundo plano
    am start -n com.whatsapp/com.whatsapp.MainActivity --es "jid" "$phone_number@s.whatsapp.net" --es "text" "$message"

    # Verifica si el mensaje se envió correctamente
    if [ "$?" -eq 0 ]; then
        echo "Mensaje enviado correctamente a $phone_number"
    else
        echo "Error al enviar el mensaje a $phone_number"
    fi
}

# Menú principal
while true; do
    echo "Opciones:"
    echo "1. Ingresar número y enviar mensaje"
    echo "2. Salir"
    read -p "Selecciona una opción: " option

    case $option in
        1)
            read -p "Ingresa el número de teléfono: " phone_number
            send_message "$phone_number"
            ;;
        2)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Intenta de nuevo."
            ;;
    esac
done
