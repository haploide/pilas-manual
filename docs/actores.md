# Actores

Los actores son una pieza clave de pilas, nos sirven para representar
a los personajes dentro de videojuego, con sus propios atributos, apariencia
y comportamiento.

Puedes utilizar los actores prediseñados de pilas, o crear tus propios
actores. Existe una página separada del manual que explica [como crear tus
propios actores](/actores_personalizados/index.html), en lugar de utilizar los incluidos en pilas.


## Galería de actores incluídos

Hay varios actores pre-diseñados incluidos en pilas, podés usarlos
siguiendo los ejemplos de esta página o adaptarlos para crear los
tuyos propios:

  - [Actor](#actor)
  - [Aceituna](#aceituna)
  - [Animacion](#animacion)
  - [Animado](#animado)
  - [Bala](#bala)
  - [Banana](#banana)
  - [ActorEliminadoException](#actor)
  - [ActorEliminado](#actor)
  - [Banana](#banana)
  - [Bomba](#bomba)
  - [Boton](#boton)
  - [Caja](#caja)
  - [Calvo](#calvo)
  - [Controlador](#controlador)
  - [Cooperativista](#cooperativista)
  - [DeslizadorHorizontal](#deslizador_horizontal)
  - [Dialogo](#dialogo)
  - [Dinamita](#dinamita)
  - [DisparoLaser](#disparo_laser)
  - [Ejes](#ejes)
  - [Emisor](#emisor)
  - [Energia](#energia)
  - [Estrella](#estrella)
  - [EstrellaNinja](#estrella_ninja)
  - [Estudiante](#estudiante)
  - [Explosion](#explosion)
  - [ExplosionDeHumo](#explosion_de_humo)
  - [Fantasma](#fantasma)
  - [Globo](#globo)
  - [Grupo](#grupo)
  - [Humo](#humo)
  - [ManejadorPropiedad](#manejador_propiedad)
  - [Manzana](#manzana)
  - [Mapa](#mapa)
  - [MapaTiled](#mapa_tiled)
  - [Martian](#martian)
  - [Maton](#maton)
  - [MensajeError](#mensaje_error)
  - [Menu](#menu)
  - [Menu](#menu)
  - [Misil](#misil)
  - [Moneda](#moneda)
  - [Mono](#mono)
  - [Municion](#municion)
  - [Nave](#nave)
  - [NaveKids](#nave_kids)
  - [NaveRoja](#nave_roja)
  - [Opcion](#opcion)
  - [Ovni](#ovni)
  - [Pacman](#pacman)
  - [Palo](#palo)
  - [Particula](#particula)
  - [Pelota](#pelota)
  - [Piedra](#piedra)
  - [Pingu](#pingu)
  - [Pizarra](#pizarra)
  - [Planeta](#planeta)
  - [Puntaje](#puntaje)
  - [Shaolin](#shaolin)
  - [Sombra](#sombra)
  - [Sonido](#sonido)
  - [Temporizador](#temporizador)
  - [Texto](#texto)
  - [TextoInferior](#texto_inferior)
  - [Tortuga](#tortuga)
  - [Zanahoria](#zanahoria)


### Actor

Representa un objeto visible en pantalla, algo que se ve y tiene
la estructura inicial de actor

![](imagenes/actores/actor.png)


Un objeto Actor se tiene que crear siempre indicando una imagen. Si no
se especifica una imagen, se verán los signos de interrogación de
color rojo.

Una forma de crear el actor con una imagen es:

    protagonista = Actor("planeta_azul.png")

incluso, es equivalente hacer lo siguiente:

    imagen = pilas.imagenes.cargar("planeta_azul.png")
    protagonista = Actor(imagen)

El resultado será:


![](imagenes/actores/planeta_azul.png)

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

![](imagenes/actores/aceituna.png)

    aceituna = pilas.actores.Aceituna()

*Comportamientos:*

- ``aceituna.saludar(mensaje)``
- ``aceituna.saltar()``


### Animacion

Representa una animación de una grilla de imágenes.

Este actor toma una grilla de cuadros de animación
y los reproduce hasta que la animación termina. Cuando
la animación termina se elimina a si mismo.

El constructor tiene algunos parámetros de utilidad:

- El parámetro ``ciclica`` permite hacer animaciones infinitas,
que se repiten siempre, por defecto vale ``False`` que significa que
la animación terminará y no se repetirá.
- El parámetro ``velocidad`` tiene que ser un número que indicará la
cantidad de cuadros por segundo que se tienen que mostrar
en la animación.

Por ejemplo, para mostrar una explosión infinita podrías escribir:

```
grilla = pilas.imagenes.cargar_grilla("explosion.png", 7)
animacion = pilas.actores.Animacion(grilla, ciclica=True, velocidad=1)
```

![](imagenes/actores/explosion.png)


*Comportamientos:*

- ``animacion.definir_velocidad_de_animacion(velocidad_de_animacion)``
- ``animacion.obtener_velocidad_de_animacion()``


### Animado

Representa un actor que tiene asociada una grilla con cuadros de animacion.

Una de las variantes que introduce este actor es el
método 'definir_cuadro', que facilita la animación de personajes.

Por ejemplo, si tenemos una grilla con un pingüino, podríamos
mostrarlo usando este código:

```
grilla = pilas.imagenes.cargar_grilla("pingu.png", 10)
actor = Animado(grilla)
actor.definir_cuadro(2)
actor.definir_cuadro(5)
```

![](imagenes/actores/pingu.png)

*Comportamientos:*

- ``actor.definir_cuadro(indice)``


### Bala

Representa un disparo que avanza en linea recta, con un ángulo
de dirección y un sentido determinado.

```
bala = pilas.actores.Bala(rotacion=0, velocidad_maxima=9, angulo_de_movimiento=90)
```


y opcionalmente, si queremos que se llame a una función en el momento
de eliminación del disparo podemos hacer así:


```
bala.cuando_se_elimina = funcion_a_invocar
```

### Banana

Muestra una banana que se combina (temáticamente) con el actor Mono.

![](imagenes/actores/banana.png)


Este actor se podría usar cómo alimento o bonus para otros
actores.

Este actor tiene solo dos cuadros de animación que se pueden
mostrar con los métodos ``abrir`` y ``cerrar``:

```
banana = pilas.actores.Banana()
banana.abrir()
banana.cerrar()
```


*Comportamientos:*

- ``banana.abrir()``
- ``banana.cerrar()``


### Bomba

Representa una bomba que puede explotar...

La bomba adquiere la habilidad explotar al momento de crearse, así
que puedes invocar a su método "explotar" y la bomba hará un
explosión en pantalla con sonido.

![](imagenes/actores/bomba.png)


```
bomba = pilas.actores.Bomba()
bomba.explotar()
```

*Comportamientos:*

- ``bomba.explotar()``


### Boton

Representa un boton que reacciona al ser presionado

![](imagenes/actores/boton.png)

*Comportamientos:*

- ``boton.conectar_normal(funcion, argumentos...)``
- ``boton.conectar_presionado(funcion, argumentos...)``
- ``boton.activar()``
- ``boton.desactivar()``
- ``boton.desconectar_normal(function)``
- ``boton.desconectar_presionado(function)``


### Caja

Representa una caja que posee fisica.

![](imagenes/actores/caja.png)


### Calvo


Representa un personaje de juego tipo RPG.

![](imagenes/actores/calvo.png)


### Cooperativista


Representa un Cooperativista que puede caminar y trabajar.

![](imagenes/actores/cooperativista.png)

*Comportamientos:*

- ``cooperativista.cambiar_animacion(nombre)``




### DeslizadorHorizontal


*Comportamientos:*

- ``deslizador.conectar(function)``
- ``deslizador.desconectar(function)``


### Dialogo

Representa una secuencia de mensajes entre varios actores.

>>> mono = pilas.actores.Mono()
>>> mono2 = pilas.actores.Mono()
>>> dialogo = pilas.actores.Dialogo()
>>> dialogo.decir(mono, "Hola Mundo")
>>> dialogo.decir(mono2, "Estoy diciendo algo")
>>> dialogo.comenzar()

![](imagenes/actores/mono_dice.png)

*Comportamientos:*

- ``dialogo.decir(actor, mensaje)``
- ``dialogo.comenzar()``


### Dinamita

Una dinamita que puede explotar.

![](imagenes/actores/dinamita.png)

*Comportamientos:*

- ``dinamita.explotar()``


### DisparoLaser

Muestra un disparo que avanza por la pantalla.

    .. image:: images/actores/disparo_laser.png

    Este actor se podría usar como arma para juegos de naves
    generalmente. Por ejemplo, el actor NaveRoja dispara usando
    este actor como munición.

![](imagenes/actores/disparo_laser.png)



### Ejes


...

![](imagenes/actores/ejes.png)

*Comportamientos:*

- ``..``


### Emisor


...

![](imagenes/actores/emisor.png)

*Comportamientos:*

- ``..``


### Energia


...

![](imagenes/actores/energia.png)

*Comportamientos:*

- ``..``


### Estrella


...

![](imagenes/actores/estrella.png)

*Comportamientos:*

- ``..``


### EstrellaNinja


...

![](imagenes/actores/estrella_ninja.png)

*Comportamientos:*

- ``..``


### Estudiante


...

![](imagenes/actores/estudiante.png)

*Comportamientos:*

- ``..``


### Explosion


...

![](imagenes/actores/explosion.png)

*Comportamientos:*

- ``..``


### ExplosionDeHumo


...

![](imagenes/actores/explosion_de_humo.png)

*Comportamientos:*

- ``..``


### Fantasma


...

![](imagenes/actores/fantasma.png)

*Comportamientos:*

- ``..``


### Globo


...

![](imagenes/actores/globo.png)

*Comportamientos:*

- ``..``


### Grupo


...

![](imagenes/actores/grupo.png)

*Comportamientos:*

- ``..``


### Humo


...

![](imagenes/actores/humo.png)

*Comportamientos:*

- ``..``


### ManejadorPropiedad


...

![](imagenes/actores/manejador_propiedad.png)

*Comportamientos:*

- ``..``


### Manzana


...

![](imagenes/actores/manzana.png)

*Comportamientos:*

- ``..``


### Mapa


...

![](imagenes/actores/mapa.png)

*Comportamientos:*

- ``..``


### MapaTiled


...

![](imagenes/actores/mapa_tiled.png)

*Comportamientos:*

- ``..``


### Martian


...

![](imagenes/actores/martian.png)

*Comportamientos:*

- ``..``


### Maton


...

![](imagenes/actores/maton.png)

*Comportamientos:*

- ``..``


### MensajeError


...

![](imagenes/actores/mensaje_error.png)

*Comportamientos:*

- ``..``


### Menu


...

![](imagenes/actores/menu.png)

*Comportamientos:*

- ``..``


### Menu


...

![](imagenes/actores/menu.png)

*Comportamientos:*

- ``..``


### Misil


...

![](imagenes/actores/misil.png)

*Comportamientos:*

- ``..``


### Moneda


...

![](imagenes/actores/moneda.png)

*Comportamientos:*

- ``..``


### Mono


...

![](imagenes/actores/mono.png)

*Comportamientos:*

- ``..``


### Municion


...

![](imagenes/actores/municion.png)

*Comportamientos:*

- ``..``


### Nave


...

![](imagenes/actores/nave.png)

*Comportamientos:*

- ``..``


### NaveKids


...

![](imagenes/actores/nave_kids.png)

*Comportamientos:*

- ``..``


### NaveRoja


...

![](imagenes/actores/nave_roja.png)

*Comportamientos:*

- ``..``


### Opcion


...

![](imagenes/actores/opcion.png)

*Comportamientos:*

- ``..``


### Ovni


...

![](imagenes/actores/ovni.png)

*Comportamientos:*

- ``..``


### Pacman


...

![](imagenes/actores/pacman.png)

*Comportamientos:*

- ``..``


### Palo


...

![](imagenes/actores/palo.png)

*Comportamientos:*

- ``..``


### Particula


...

![](imagenes/actores/particula.png)

*Comportamientos:*

- ``..``


### Pelota


...

![](imagenes/actores/pelota.png)

*Comportamientos:*

- ``..``


### Piedra


...

![](imagenes/actores/piedra.png)

*Comportamientos:*

- ``..``


### Pingu


...

![](imagenes/actores/pingu.png)

*Comportamientos:*

- ``..``


### Pizarra


...

![](imagenes/actores/pizarra.png)

*Comportamientos:*

- ``..``


### Planeta


...

![](imagenes/actores/planeta.png)

*Comportamientos:*

- ``..``


### Puntaje


...

![](imagenes/actores/puntaje.png)

*Comportamientos:*

- ``..``


### Shaolin


...

![](imagenes/actores/shaolin.png)

*Comportamientos:*

- ``..``


### Sombra


...

![](imagenes/actores/sombra.png)

*Comportamientos:*

- ``..``


### Sonido


...

![](imagenes/actores/sonido.png)

*Comportamientos:*

- ``..``


### Temporizador


...

![](imagenes/actores/temporizador.png)

*Comportamientos:*

- ``..``


### Texto


...

![](imagenes/actores/texto.png)

*Comportamientos:*

- ``..``


### TextoInferior


...

![](imagenes/actores/texto_inferior.png)

*Comportamientos:*

- ``..``


### Tortuga


...

![](imagenes/actores/tortuga.png)

*Comportamientos:*

- ``..``


### Zanahoria


...

![](imagenes/actores/zanahoria.png)

*Comportamientos:*

- ``..``
