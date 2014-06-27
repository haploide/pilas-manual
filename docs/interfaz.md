# Interfaz de usuario

Los componentes del módulo ``pilas.interfaz`` permiten crear botones, listas,
deslizadores y otros tipos de componentes visuales, todos orientados
a construir interfaces de usuario traducionales.




## Clase: Boton

Para crear un botón podemos instalar la clase `Boton` especificando
un texto.

```
boton = pilas.interface.Botón("Saludar")
```

y casi siempre vas a querer asignarle alguna acción cuando se hace
click sobre él, para eso necesitás una función y conectarla:

```
def saludar():
  boton.decir("Hola !!!")

boton.conectar(saludar)
```

![](../imagenes/interfaz/boton_saludando.png)

Ten en cuenta que todos los objetos creados siguen siendo actores, así
que se pueden manipular como vimos antes: escalar, rotar, moverse etc...

#### Propiedades

* `texto`
* `icono`

#### Métodos

* `conectar(funcion)` - Conecta una función para responder al click de mouse.
* `ocultar()`
* `mostrar()`
* `deshabilitar()`
* `habilitar()`

#### Ejemplo de integración

Y para añadir una acción o respuesta al componente, podemos crear una
función y luego vincularla con el evento ``click``. Este ejemplo construye
un botón y realiza un movimiento cada vez que se hace click sobre él:

```
b = pilas.interfaz.Boton(u"Realizar animación")

def moverse():
    b.escala_x = [  2, 0.8, 1], 0.15
    b.escala_y = [0.8, 2,   1], 0.1
    d = pilas.azar(-50, 50)
    b.rotacion = [d, 1], 0.1

b.conectar(moverse)
```

El resultado en pantalla será así:


![](../imagenes/interfaz/boton.gif)
