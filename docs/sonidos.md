# Cargar sonidos y música

Si bien a continuación ejemplificamos todo con el modulo ``pilas.sonidos``
todos los ejemplos funcionan para el modulo ``pilas.musica`` también.

Los sonidos se pueden cargar usando el módulo
``sonidos`` de la siguiente manera:


    sonido_de_explosion = pilas.sonidos.cargar('explosion.wav')

donde ``explosion.wav`` es el nombre del archivo de audio.

Ten en cuenta que esta función para cargar sonidos
se comporta muy parecido a la función que nos permite
cargar imágenes o grillas. El archivo se buscará en
el directorio principal de nuestro juego, luego en el
directorio ``data`` y por último en la biblioteca de
sonidos que trae pilas.


## Reproducir sonidos

La función ``sonidos.cargar`` nos retorna un objeto de tipo
``Sonido`` que tiene un método para reproducirse llamado
``reproducir()``.

Entonces, para reproducir un sonido solamente tienes
que llamar al método ``reproducir``:


    sonido_de_explosion.reproducir()


Si deseas que un sonido se repita indefinidamente debes utilizar el parámetro
*repetir=True*. Por ejemplo:


    sonido_de_explosion.reproducir(repetir=True)

Para detener el efecto de sonido, existe
el método *detener*. Por ejemplo:

    sonido_de_explosion.detener()

Y a partir de la versión 1.4.2 de pilas-engine también se puede detener
el audio reduciendo el volúmen gradualmente (también conocido como fadeout):

    sonido_de_explosion.detener_gradualmente(segundos=4)


## Reproducir canciones largas y música de fondo

Como indicamos al principio de esta página, utilizar músicas o sonidos
en pilas es muy similar, solamente tenemos que utilizar ``pilas.musica``
en lugar de ``pilas.sonidos``.

Lo interesante de distinguir entre músicas y sonidos es que los sonidos
se cargan en memoria inmediatamente, porque queremos que suenen rápido, mientras
que la música se va cargando en memoria a medida que se va reproduciendo
(también conocido como streaming) porque generalmente son archivos grandes y de
larga duración.

Entonces, para cargar y poner a sonar una canción podríamos usar algo así:

    cancion_de_fondo = pilas.musica.cargar('musica_de_presentacion.mp3')
    cancion_de_fondo.reproducir()


Luego, para detenerla, podemos llamar directamente a ``cancion.detener()``,
o usar un efecto de volúmen gradual para detenerla así:

    cancion_de_fondo.detener_gradualmente(3)

Donde el argumento ``3`` es la cantidad de segundos que utilizará pilas para
bajar el volúmen gradualmente.
