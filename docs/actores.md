# Actores

Los actores son una pieza clave de pilas, nos sirven para representar
a los personajes dentro de videojuego, con sus propios atributos, apariencia
y comportamiento.


## Galería de actores incluídos

Hay varios actores pre-diseñados incluidos en pilas, podés usarlos
siguiendo los ejemplos de esta página o adaptarlos para crear los
tuyos propios:

  - [Actor](#actor)
  - [Aceituna](#aceituna)

### Actor

Representa un objeto visible en pantalla, algo que se ve y tiene
la estructura inicial de actor

![](../imagenes/actores/actor.png)


Un objeto Actor se tiene que crear siempre indicando una imagen. Si no
se especifica una imagen, se verán los signos de interrogación de
color rojo.

Una forma de crear el actor con una imagen es:

    protagonista = Actor("planeta_azul.png")

incluso, es equivalente hacer lo siguiente:

    imagen = pilas.imagenes.cargar("planeta_azul.png")
    protagonista = Actor(imagen)

El resultado será:


![](../imagenes/actores/planeta_azul.png)

Luego, una vez que ha sido ejecutada la sentencia aparecerá
el nuevo actor para que puedas manipularlo. Por ejemplo
alterando sus propiedades:

    protagonista.x = 100
    protagonista.escala = 2
    protagonista.rotacion = 30

Estas propiedades también se pueden manipular mediante
interpolaciones. Por ejemplo, para aumentar el tamaño del
personaje de 1 a 5 en 7 segundos:

    protagonista.escala = 1
    protagonista.escala = [5], 7

Si quieres que el actor sea invisible, un truco es crearlo
con la imagen ``invisible.png``:

    invisible = pilas.actores.Actor('invisible.png')


### Aceituna

El actor aceituna es super simple

![](../imagenes/actores/aceituna.png)

    aceituna = pilas.actores.Aceituna()

*Métodos:*

- ``aceituna.saludar(mensaje)``
- ``aceituna.saltar()``
