# Habilidades

Pilas permite añadir funcionalidad a tus objetos
de manera sencilla, dado que usamos el concepto
de habilidades, un enfoque similar a la
programación orientada a [componentes](http://es.wikipedia.org/wiki/Programación_orientada_a_componentes)
y [mixins](http://es.wikipedia.org/wiki/Mixin).



## Un ejemplo

Una habilidad es una funcionalidad que está implementada
en alguna clase, y que si quieres la puedes vincular
a un actor cualquiera.

Veamos un ejemplo, imagina que tienes un actor en
tu escena y quieres que la rueda del mouse te permita
cambiarle el tamaño.

Puedes usar la habilidad ``AumentarConRueda`` y vincularla
al actor fácilmente.

El siguiente código hace eso:

```python
import pilasengine

pilas = pilasengine.iniciar()

mono = pilas.actores.Mono()
mono.aprender(pilas.habilidades.AumentarConRueda)
```

o bien:

    mono.aprender('AumentarConRueda')

así, cuando uses la rueda del mouse el tamaño del personaje aumentará
o disminuirá.

Nota que aquí usamos la metáfora de "aprender habilidades", porque
las habilidades son algo que duran para toda la vida
del actor.


## Un ejemplo mas: hacer que un actor se pueda mover con el mouse

Algo muy común en los juegos es que puedas
tomar piezas con el mouse y moverlas por la pantalla.

Esta habilidad llamada ``Arrastrable`` representa eso, puedes vincularlo
a cualquier actor y simplemente funciona:

```python
import pilasengine

pilas = pilasengine.iniciar()

mono = pilas.actores.Mono()
mono.aprender(pilas.habilidades.Arrastrable)
```

## Otro ejemplo: un actor que cambia de posición

Veamos otro ejemplo sencillo, si queremos que un actor
se coloque en la posición del mouse cada vez que hacemos
click, podemos usar la habilidad: ``SeguirClicks``.

```python
import pilasengine

pilas = pilasengine.iniciar()
mono = pilas.actores.Mono()
mono.aprender(pilas.habilidades.SeguirClicks)
```

## Mezclar habilidades

En pilas se ha intentado hacer que las habilidades sean
lo mas independientes posibles, porque claramente lo mas
divertido de este enfoque es poder combinar distintas
habilidades para lograr comportamientos complejos.

Así que te invitamos a experimentar y explorar la mezcla
de habilidades.

## Otras habilidades para utilizar

Pilas viene con varias habilidades incluidas, pero
lamentablemente este manual no las menciona a todas. Así
que te recomendamos abrir un intérprete de python
y consultarle directamente a él que habilidades tienes
disponibles en tu versión de pilas.

Para esto, abrí el intérprete de pilas y escribí lo siguiente:

```python
dir(pilas.habilidades)
```


esto imprimirá en pantalla todas las habilidades como una
lista de cadenas.


## Crear habilidades personalizadas

Para crear una habilidad nueva, tienes que crear una clase
y vincularla al módulo de habilidades.

La clase tiene que heredar de ``pilasengine.habilidades.Habilidad`` y
puede tener un método ``actualizar``, en donde generalmente se
coloca la acción a realizar:

```python
class GirarPorSiempre(pilasengine.habilidades.Habilidad):

    def actualizar(self):
        self.receptor.rotacion += 1

pilas.habilidades.vincular(GirarPorSiempre)

actor = pilas.actores.Actor()
actor.aprender('GirarPorSiempre')
```


El método ``actualizar`` de la habilidad se ejecutará 60 veces por segundo, y
en este caso harán que cualquier actor que aprenda la habilidad ``GirarPorSiempre``
de vueltas constantemente.

Notá que dentro de los métodos de la habilidad, la variable ``self.receptor`` apunta
al actor que conoce a esa habilidad.

Por último, en este ejemplo, vinculamos la nueva habilidad al módulo de
habilidades usando el método ``pilas.habilidades.vincular``.

### Argumentos iniciales para las habilidades

Hay casos en donde queremos que las habilidades pueda recibir argumentos
iniciales, para esos casos necesitamos crear el método ``iniciar`` y configurarlo
correctamente.

Siguiendo con nuestro ejemplo, imaginá que ahora queremos que esta habilidad
nos permita hacer girar a los actores pero a diferentes velocidades: en algunos
casos queremos enseñar a una actor a girar rápido y a otro mas lento. ¿Cómo
sería en pilas?.

Lo primero es crear la clase, muy parecida a la anterior, solamente que
ahora creamos el método iniciar con dos argumentos, el primer es ``receptor``, que
es obligatorio y el segundo es nuestro argumento de velocidad:

```python
class GirarPorSiemprePersonalizado(pilasengine.habilidades.Habilidad):

    def iniciar(self, receptor, velocidad):
        self.receptor = receptor
        self.velocidad = velocidad

    def actualizar(self):
        self.receptor.rotacion += self.velocidad

pilas.habilidades.vincular(GirarPorSiemprePersonalizado)
```

Ahora, la nueva habilidad necesita que le especifiquemos la velocidad
al iniciar, así que tenemos que usar algo así:


```python
actor_lento = pilas.actores.Actor()
actor_lento.aprender('GirarPorSiemprePersonalizado', 1)

actor_rapido = pilas.actores.Actor(y=100)
actor_rapido.aprender('GirarPorSiemprePersonalizado', 5)
```
