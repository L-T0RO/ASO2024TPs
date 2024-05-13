TP3
ROJAS LUCAS
TUP

1)
A) con respecto al tiempo de ejecucion podemos notar que el archivo sinhilos.py tarda aproximadamente un segundo mas de promedio que conhilos.py debido a que el código sinhilos.py ejecuta las tareas de forma secuencial mientras que conhilos.py utiliza threads Con respecto a si es predecible podriamos decir que el que tiene threads (conhilos,py) es menos predecible que el codigo que es secuencial(sinhilos.py)

B) comparandolo con un compañero podriamos decir que no son exactamente iguales sino que son parecidos

C) Lo que paso fue que cambio el valor final y el tiempo aumento debido a que tiene un retardo artificial tambien conocido como "delay"

2A) CODIGO
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20

int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
pthread_mutex_t lock; // Mutex para controlar el acceso a la variable compartida
int turno = 0; // Variable para el turno de acceso

void *comer_hamburguesa(void *tid)
{
    while (1)
    {
        while(turno != (int)tid); // Esperar al turno
        pthread_mutex_lock(&lock); // Bloquear la sección crítica
        if (cantidad_restante_hamburguesas > 0)
        {
            printf("Hola! soy el hilo (comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
            cantidad_restante_hamburguesas--; // me como una hamburguesa
        }
        else
        {
            printf("SE TERMINARON LAS HAMBURGUESAS :( \n");
            pthread_mutex_unlock(&lock); // Desbloquear antes de salir de la función
            pthread_exit(NULL); // forzar terminacion del hilo
        }
        turno = (turno + 1) % NUMBER_OF_THREADS; // Cambiar el turno
        pthread_mutex_unlock(&lock); // Desbloquear la sección crítica
    }
}

int main(int argc, char *argv[])
{
    pthread_t threads[NUMBER_OF_THREADS];
    int status, ret;
    pthread_mutex_init(&lock, NULL); // Inicializar el mutex
    for (int i = 0; i < NUMBER_OF_THREADS; i++)
    {
        printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
        status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void *)i);
        if (status != 0)
        {
            printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
            exit(-1);
        }
    }

    for (int i = 0; i < NUMBER_OF_THREADS; i++)
    {
        void *retval;
        ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
    }

    pthread_mutex_destroy(&lock); // Destruir el mutex
    pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}
RESULTADO EN LA TERMINAL
![image](https://github.com/L-T0RO/ASO2024TPs/assets/159506610/a392e2a7-2bf6-4c36-a78a-b78966435373) ![image](https://github.com/L-T0RO/ASO2024TPs/assets/159506610/b58b1e34-28da-4a1d-a91c-99bc1ea91e84)



2B) 

IMAGEN
![image](https://github.com/L-T0RO/ASO2024TPs/assets/159506610/f007e191-11c9-472d-864e-12454abf6173)


