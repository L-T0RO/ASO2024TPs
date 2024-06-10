echo "Ingrese un nombre para conocer la edad probable:"
read nombre

# Hace la solicitud 
response=$(curl -s "https://api.agify.io/?name=$nombre")

# Extrae la edad probable
edad=$(echo $response | jq -r '.age')

if [ "$edad" != "null" ]; then
    echo "La edad probable de $nombre es: $edad años."
    sleep 4
else
    echo "No se pudo determinar la edad probable de $nombre."
fi

