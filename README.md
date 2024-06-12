TP3
ROJAS LUCAS
TUP

1)
A) con respecto al tiempo de ejecucion podemos notar que el archivo sinhilos.py tarda aproximadamente un segundo mas de promedio que conhilos.py debido a que el código sinhilos.py ejecuta las tareas de forma secuencial mientras que conhilos.py utiliza threads Con respecto a si es predecible podriamos decir que el que tiene threads (conhilos,py) es menos predecible que el codigo que es secuencial(sinhilos.py)

B) comparandolo con un compañero podriamos decir que no son exactamente iguales sino que son parecidos

C) Lo que paso fue que cambio el valor final y el tiempo aumento debido a que tiene un retardo artificial tambien conocido como "delay"

2A) CODIGO
```
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20
int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
int turno = 0;

void comer_hamburguesa(voidtid)
{
    while (1 == 1)
    { 
        while (turno != (int) tid);
        // INICIO DE LA ZONA CRÍTICA
        if (cantidad_restante_hamburguesas > 0)
        {
            printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
            cantidad_restante_hamburguesas--; // me como una hamburguesa
        }
        else
        {
            printf("SE TERMINARON LAS HAMBURGUESAS 😦 \n");
        turno = (turno + 1) % NUMBER_OF_THREADS;
            pthread_exit(NULL); // forzar terminacion del hilo
        }
        // SALIDA DE LA ZONA CRÍTICA
turno = (turno + 1) % NUMBER_OF_THREADS;
    }
}

int main(int argc, char argv[])
{
    pthread_t threads[NUMBER_OF_THREADS];
    int status, i, ret;
    for (int i = 0; i < NUMBER_OF_THREADS; i++)
    {
        printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
        status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void)i);
        if (status != 0)
        {
            printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
            exit(-1);
        }
    }

    for (i = 0; i < NUMBER_OF_THREADS; i++)
    {
        void *retval;
        ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
    }
    pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}

```
RESULTADO EN LA TERMINAL
![image](https://github.com/L-T0RO/ASO2024TPs/assets/159506610/a392e2a7-2bf6-4c36-a78a-b78966435373) ![image](https://github.com/L-T0RO/ASO2024TPs/assets/159506610/b58b1e34-28da-4a1d-a91c-99bc1ea91e84)



2B) 

IMAGEN
![comensal A](https://github.com/L-T0RO/ASO2024TPs/assets/159506610/44ad8278-aeda-4794-bb1c-26320c37ea20)




