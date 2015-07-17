## Comportamientos

En el desarrollo de videojuegos es conveniente
tener una forma de indicarle a los actores
una rutina o tarea para que la realicen.

En pilas usamos el concepto de comportamiento. Un
comportamiento es un objeto que simboliza una
acción a realizar por un actor.

La utilidad de usar componentes es que puedes
asociarlos y intercambiarlos libremente para
lograr efectos útiles.

Por ejemplo: un guardia de un juego de acción puede ir de
un lado a otro en un pasillo:

- caminar hacia la izquierda hasta el fin del pasillo.
- dar una vuelta completa.
- caminar hacia la derecha hasta el fin del pasillo.
- dar una vuelta completa.
- y repetir ...

En este caso hay 4 comportamientos, y queda en nuestro
control si queremos que luego de los 4 comportamientos
comience nuevamente.


## Un ejemplo, ir de un lado a otro

Veamos un ejemplo sencillo, vamos a crear un actor Mono
y decirle que se mueva de izquierda a derecha una
sola vez:

    import pilasengine

    pilas = pilasengine.iniciar()
    mono = pilas.actores.Mono()

    pasos = 200

    mono.hacer("Avanzar", pasos)

    # Dar la vuelta.
    mono.rotacion = [180]

    mono.hacer("Avanzar", pasos)

    # Solo necesario al ejecutar en scripts.
    pilas.ejecutar()


## Listado de todos los Comportamientos existentes

| **Evento**          | **Parametros**                                                |
|---------------------|---------------------------------------------------------------|
| Proyectil           | velocidad_maxima, aceleracion, angulo_de_movimiento, gravedad |
| Saltar              | velocidad_inicial, cuando_termina                             |
| Avanzar             | pasos, velocidad                                              |
| Girar               | delta, velocidad                                              |
| Orbitar             | x, y, radio, velocidad, direccion                             |
| OrbitarSobreActor   | actor, radio, velocidad, direccion                            |


## Comportamientos personalizados


Para crear un comportamiento personalizado necesitamos crear una
clase que herede de ``pilasengine.comportamientos.Comportamiento``, 
luego implementar los métodos ``iniciar``/``ejecutar`` y por último
vincular el comportamiento.


    class Desaparecer(pilasengine.comportamientos.Comportamiento):

        def iniciar(self, receptor):
            self.receptor = receptor

        def actualizar(self):
            if self.receptor.transparencia < 100:
                self.receptor.transparencia += 1
            else:
                # Con retornar True le indicamos a pilas que este
                # comportamiento terminó y tiene que pasar al siguiente.
                return True

    mono = pilas.actores.Mono()
    pilas.comportamientos.vincular(Desaparecer)
    mono.hacer("Desaparecer")


## Encadenando comportamientos


Los comportamientos de los actores están diseñados para encadenarse, y que
se puedan reproducir uno detrás de otro. Por ejemplo:

    mono = pilas.actores.Mono()
    mono.hacer("Saltar")
    mono.hacer("Avanzar", 200)
    mono.hacer("Saltar")
