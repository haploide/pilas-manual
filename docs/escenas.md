# Escenas


Las escenas te permiten dividir el juego en partes
reconocibles y que interactúan de manera diferente
con el usuario.

Un juego típico tendrá al menos una escena como
el menú principal, una presentanción y una
pantalla de juego.


![](imagenes/escenas/escenas_juego.png)


## Cosas a tener en cuenta

Hay algunas cosas a tener en cuenta
a la hora de manejar escenas, porque
simplifican mucho el trabajo posterior:

- La escena actual siempre está señalada por el atributo ``pilas.escena_actual()``.
- Solo puede existir una escena activa a la vez.


## La escena Normal

Cuando iniciamos pilas por primera vez se creará
una escena llamada ``Normal``. Esta escena no
tiene un comportamiento muy elaborado, simplemente
imprime toda la pantalla de azul para que
podamos colocar actores sobre ella y veamos una
escena limpia.

## Cambiando el fondo de las escenas

Para hacer una pequeña prueba sobre una
escena, podrías ejecutar la siguiente sentencia
de código:

    pilas.fondos.Volley()

Esto le dará a tu escena una vista
mas agradable, porque carga un fondo de
pantalla colorido y mas divertido:

![](imagenes/escenas/paisaje.jpg)

o podrías usar un fondo de atardecer:

    pilas.fondos.Tarde()

![](imagenes/escenas/tarde.jpg)

## Cómo crear nuevas escenas

Imagina que tienes un juego con dos pantallas, una
que simplemente dice "bienvenido" y  otra con
un personaje para mover.

Claramente tendríamos que hacer dos escenas, e iniciar
nuestro juego creando la escena principal.

La primer escena tendríamos que representarla
con una clase, que herede de la escena Normal
así:

```python
class PantallaBienvenida(pilasengine.escenas.Escena):

    def iniciar(self):
        self.fondo = self.pilas.fondos.Volley()
        pass

    def ejecutar(self):
        pass
```

Ahora, para poner en funcionamiento esta escena
simplemente tienes que decirle a pilas que esta escena es la activa:


    pilas.escenas.vincular(PantallaBienvenida)
    pilas.escenas.PantallaBienvenida()

Esto eliminará las escenas almacenadas y se colocará como la escena
actual y activa:

![](imagenes/escenas/escena_simple.jpg)

Ahora, si quieres salir de la escena, simplemente tendrías
que cargar una escena nueva, por ejemplo:

    pilas.escenas.Normal()

Es decir, en el momento que creamos la escena aparecerá automáticamente.


## Escenas con argumentos

Si quieres crear una escena pasándole un argumento de esta forma:

    pilas.escenas.vincular(PantallaBienvenida)
    pilas.escenas.PantallaBienvenida("Mi mensaje personalizado")

Lo que necesitas hacer es especificar ese nuevo argumento en el método
``iniciar`` así:

```python
class PantallaBienvenida(pilasengine.escenas.Escena):

    def iniciar(self, mensaje):
        pilas.fondos.Pasto()
        self.texto = pilas.actores.Texto(mensaje)

    def actualizar(self):
        self.texto.rotacion += 1
```

pilas, en este caso, va a tomar el argumento ``"Mi mensaje personalizado"`` y lo
va a enviar al método ``iniciar`` con el nombre ``mensaje``.
