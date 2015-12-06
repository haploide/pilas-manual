# Etiquetas

Las etiquetas nos permite clasificar actores y describir
a los actores de manera simple.

Cada etiqueta es solamente una palabra, por ejemplo "enemigo",
"protagonista", "munición" etc... y podemos vincularla
con cualquier actor o grupo, para señalar el rol de ese actor
o grupo.

La utilidad mas inmediata de las etiquetas es poder
simplificar la creación de colisiones, que vimos en el
capítulo anterior.

## Conociendo las Etiquetas

Cada actor que existe en pilas tiene un atributo ``etiquetas``,
que inicialmente tiene el nombre de la clase que originó
al actor, por ejemplo:

    >>> mono = pilas.actores.Mono()
    >>> mono.etiquetas
    ['mono']

    >>> aceituna = pilas.actores.Aceituna()
    >>> aceituna.etiquetas
    ['aceituna']

y estas etiquetas, a su vez, se pueden añadir usando el método ``agregar``:

    >>> mono.etiquetas.agregar('protagonista')
    ['mono', 'protagonista'] 

o incluso consultar si un actor tiene o no una determinada etiqueta:

    >>> mono.tiene_etiqueta("enemigo")
    False
    >>> mono.tiene_etiqueta("mono")
    True

## Usando grupos

Los grupos también nos brindan la posibilidad de consultar o definir las
etiquetas de varios actores al mismo tiempo:

```
naves = pilas.actores.Nave()
naves.etiquetas.agregar('enemigo')

items = pilas.actores.Banana()
items.etiquetas.agregar('comestible')

otro_grupo = pilas.actores.Manzana()
otro_grupo.etiquetas.agregar('comestible')
```

## Añadiendo colisiones mediante etiquetas

Ahora que podemos añadir etiquetas a los actores, podemos describir las
colisiones de forma mas sencilla. 

Por ejemplo, si creamos un escenario con monedas y un mono que se pueda
mover con el teclado así:


```
mono = pilas.actores.Mono()
monedas = pilas.actores.Moneda() * 20

mono.aprender('arrastrable')
```

podemos definir una acción de colisión simplemente indicando la función
de respuesta y las etiquetas que intervienen:

```
def capturar(mono, cosa):
    cosa.eliminar()
    mono.sonreir()

pilas.colisiones.agregar('mono', 'moneda', capturar)
```

Ahora, incluso aunque se elimine las monedas de la pantalla, si creamos
nuevas van a seguir siendo "comestibles" por el mono:

```
mas_monedas = pilas.actores.Moneda() * 10
```

Incluso cualquier otra cosa que tenga estas etiquetas va a ser
capturado por el mono:

```
cajas = pilas.actores.Caja() * 10
cajas.etiquetas.agregar('moneda')
```

Claro, lo ideal en este caso es definir las colisiones usando etiquetas
genéricas como: 'comestible', 'enemigo', 'vida' etc...
