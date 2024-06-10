# Generar un número aleatorio entre 1 y 100
numero_aleatorio=$((RANDOM % 100 + 1))

echo "juego de adivinar el numero"
echo "se genero un numero entre 1 y 100, Adivina cual es"

intento=0

while [ $intento -ne $numero_aleatorio ]; do
  read -p "Introduce tu numero: " intento

  if [ $intento -lt $numero_aleatorio ]; then
    echo "Numero demasiado bajo,Intenta de nuevo"
  elif [ $intento -gt $numero_aleatorio ]; then
    echo "Numero demasiado alto,Intenta de nuevo"
  else
    echo "Felicidades adivinaste el numero correcto"
  fi
done
