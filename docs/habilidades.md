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


## Un ejemplo más: hacer que un actor se pueda mover con el mouse

Algo muy común en los juegos es que puedas
tomar piezas con el mouse y moverlas por la pantalla.

Esta habilidad llamada ``Arrastrable`` representa eso, puedes vincularlo
a cualquier actor y simplemente funciona:

```python
import pilasengine

pilas = pilasengine.iniciar()

mono = pilas.actores.Mono()
mono.aprender("arrastrable")
```

## Una habilidad más compleja: Disparar

Una habilidad que tiene más complejidad que las anteriores
es disparar, una habilidad que te permite hacer que un
personaje pueda crear "disparos" sean de la clase que sea.

Por ejemplo, lo mas sencillo es indicarle a un actor
que puede disparar, usando una munición por omisión:

```python
import pilasengine

pilas = pilasengine.iniciar()

mono = pilas.actores.Mono()
mono.aprender("moverseComoCoche")
mono.aprender("disparar")
```

Y como resultado vamos a conseguir que nuestro
actor se pueda mover con el teclado y disparar con la tecla
espacio.

Y si queremos cambiar la munición de la habilidad
disparar, podemos especificarlo con el parámetro ``municion``:


```python
mono.aprender("disparar", municion="aceituna")
```

Esta habilidad también es útil para hacer un enemigo que dispare
automáticamente cada determinado tiempo, por ejemplo 1 segundo:


```python
mono = pilas.actores.Mono()
mono.aprender("Disparar", control=None)

def dispara():
     mono.disparar()
     return True

pilas.tareas.agregar(1, dispara)
```

## Listado de habilidades existentes



| **Habilidad**                | **Parámetros**                                                                                           |
|------------------------------|----------------------------------------------------------------------------------------------------------|
| Arrastrable                  |                                                                                                          |
| AumentarConRueda             |                                                                                                          |
| Disparar                     | municion, grupo_enemigos, cuando_elimina_enemigo, frecuencia_de_disparo, angulo_salida_disparo ...       |
| EliminarseSiSaleDePantalla   |                                                                                                          |
| Imitar                       | objeto_a_imitar, con_escala, con_rotacion                                                                |
| LimitadoABordesDePantalla    |                                                                                                          |
| MirarAlActor                 | actor_a_seguir, lado_seguimiento="ARRIBA"                                                                |
| MoverseComoCoche             | control, velocidad_maxima, aceleracion, deceleracion, rozamiento, velocidad_rotacion                     |
| MoverseConElTeclado          | control, direcciones, velocidad_maxima, aceleracion, con_rotacion, velocidad_rotacion, marcha_atras      |
| PuedeExplotar                |                                                                                                          |
| PuedeExplotarConHumo         |                                                                                                          |
| RebotarComoCaja              |                                                                                                          |
| RebotarComoPelota            |                                                                                                          |
| RotarConMouse                |                                                                                                          |
| SeMantieneEnPantalla         | permitir_salida                                                                                          |
| SeguirAlMouse                |                                                                                                          |
| SeguirClicks                 |                                                                                                          |
| SiempreEnElCentro            |                                                                                                          |

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
