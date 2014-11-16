# Actores personalizados

Cuando tu juego crece, comienza la necesidad de crear
tus propios actores, darles personalidad y lograr
funcionalidad personalizada.

Esta página describe como crear tus propios actores
usando imágenes y algunos comportamientos propios.

## Creando una clase

El primer paso para crear un actor personalizado
es construir una clase para agrupar toda la funcionalidad
esperada.

Comencemos con una imagen sencilla para el
actor, este archivo se llama ``alien.png`` y está
en el directorio de nuestro código:

![imagen alien.png](../imagenes/actores_personalizados/alien.png)

Luego, es momento de crear el código de la clase para
agrupar todo lo relacionado a este nuevo actor. Por
ejemplo con un código así:


```
import pilasengine

class Alien(pilasengine.actores.Actor):

    def iniciar(self):
        self.imagen = "alien.png"
```

## Mostrando el actor en la pantalla

Meditante la clase solamente hemos creado la "definición"
del actor, pero no lo hemos incorporado en el juego
aún.

El siguiente paso es incorporarlo al juego usando
la sentencia:

```
alien = Alien(pilas)
```

Ahora con el código completo, tendrías que ver al personaje
en el centro de la pantalla:

![imagen alien.png](../imagenes/actores_personalizados/completo.png)


## Comportamiento heredado

Algo interesante de los nuevos actores es que incorporan
por herencia lo que saben hacer casi todos los actores
de ``pilas``, ya que le hemos indicado que heredará
de clase actor con la linea ``class Alien(pilasengine.actores.Actor):``.


Por ejemplo, podrías escribir algo como:

    alien.decir(u"¡oh, no, humanos!")


![](../imagenes/actores_personalizados/decir.png)



## Creando métodos nuevos


Ten en cuenta que ahora con nuestra nueva
clase podemos crear funcionalidad nueva y específica
para este actor alien.

Solo tenemos que tener precaución de dirigirnos al
actor como ``self`` dentro de los métodos. Por ejemplo,
si quiero crear un método para saludar puedo escribir:


```
import pilasengine

class Alien(pilasengine.actores.Actor):

    def iniciar(self):
        self.imagen = "alien.png"

    def saludar(self):
        self.decir("Hola mundo!!!, soy el nuevo actor alien")

    def dar_vuelta(self):
        self.rotacion = [360]
```


Y ahora tenemos dos métodos nuevos para invocar:

    alien.saludar()


![](../imagenes/actores_personalizados/saludar.png)

y otro un poquito mas complejo:

    alien.dar_vuelta()


![](../imagenes/actores_personalizados/dar_vuelta.gif)



## El método especial "actualizar"


Una de las cosas mas importantes de la clase actor
es que incorpora un método especial llamado ``actualizar``. Este método se llamará automáticamente
60 veces por segundo.


Por ejemplo, imagina que buscamos hacer que el
actor se mueva para los costados usando las flechas
del teclado, podemos usar esté método, simplemente
así:


```
class Alien(pilasengine.actores.Actor):

    def iniciar(self):
        self.imagen = "alien.png"

    def saludar(self):
        self.decir("Hola mundo!!!, soy el nuevo actor alien")

    def dar_vuelta(self):
        self.rotacion = [360]

    def actualizar(self):
        if pilas.control.izquierda:
            self.x -= 5
            self.espejado = True
        if pilas.control.derecha:
            self.x += 5
            self.espejado = False
```


Es decir, como el método actualizar se llama casi
todo el tiempo, podemos usarlo para consultar
el estado del teclado y hacer algo.

En este caso, si se pulsa hacia la izquierda movemos
el actor un poquito a la izquierda (con ``self.x -= 5``)
y además invertimos el gráfico del actor para que mire a la izquierda (con ``self.espejado = True``). Y claro, hacemos lo opuesto para el lado
derecho.

Así se ve mientras voy pulsando las teclas ``izquierda``
y ``derecha``:

![](../imagenes/actores_personalizados/caminando.gif)



## Leyendo el código de otros actores

Pilas viene con una función especial llamada
``pilas.ver``, que te permite ver el código de
cualquier objeto y conocer su funcionamiento.

Esta función es super útil para conocer el código
de otras clases actor, e incluso aprender algunas
ideas interesantes.

Estos son algunos ejemplos de invocación, cada
una de estas sentencias te mostrará el código
de la clase completa:

    pilas.ver(pilasengine.actores.Mono)
    pilas.ver(pilasengine.actores.Aceituna)
    pilas.ver(pilasengine.actores.Pacman)
    pilas.ver(mono)
