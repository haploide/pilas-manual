# Manejo de tiempo con tareas

Una necesidad muy común en los videojuegos
es poder planificar tareas para ser ejecutadas
por tiempo.

Por ejemplo, en un juego de naves podríamos
querer que aparezcan naves enemigas cada
dos segundos.


## Tareas

Las tareas son acciones que elegimos ejecutar
en un determinado momento.

Al momento de crear la tarea tenemos que
pensar "en qué momento se tiene que ejecutar
la tarea", y dependiendo de lo que queramos,
tenemos que escribir algo cómo:


```python
pilas.tareas.agregar(tiempo, funcion, parametros)
```

Por ejemplo, para hacer que un actor espere 5 segundos
antes de emitir un mensaje:


```python
mono = pilas.actores.Mono()

def emitir_mensaje():
  mono.decir("Hola")

pilas.tareas.agregar(5, emitir_mensaje)  
```

Hay tres tipos de creaciones de tareas:

- tareas que se ejecutan una vez.
- tareas que se ejecutan siempre.
- tareas condicionales.


las tareas condicionales se ejecutarán siempre y cuando
la función que las representa retorna True. Si la función
retorna False la tarea dejará de ejecutarse.


## Eliminar tareas

Una forma sencilla de detener una tarea es iniciarla
cómo condicional, y que la función que le asignamos
retorne False.

Otra forma es simplemente capturar el retorno de
la función que ha creado la tarea y detenerla.

Por ejemplo:

```python
una_tarea = pilas.tareas.siempre(5, funcion)
```

y luego, cuando queramos que la tarea finalice
y no se vuelva a ejecutar, tendríamos que ejecutar
una sentencia como esta:


```python
una_tarea.terminar()
```
