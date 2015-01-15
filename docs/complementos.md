# Complementos (Plugins)

Pilas incorpora un sistema de complementos para que se pueda
personalizar el entorno completo usando código auto-incluido.

Esta es una funcionalidad avanzada, que se suele utilizar en
talleres o cursos especializados. La idea general es que pilas
se puede modificar añadiendo código en un directorio especial y
sin necesidad de tocar le código fuente de pilas en sí.



## ¿Que son los complementos?

Los complementos, o plugins, son simplemente archivos de código
python que pilas leerá al momento de iniciar.

Cada código python podrá definir clases que luego se podrán utilizar
directamente desde el motor.

Todos los complementos tienen que existir en un directorio
especial del sistema. Estos son los lugares en donde se buscarán los
complementos:

 - En linux: $USERDIR/.pilas-engine/complementos/
 - En OSX: $USERDIR/.pilas-engine/complementos/


## Inicializando los complementos

Los complementos no se buscarán a menos que se iniciale pilas-engine
especificando que queremos complementos.

Para inicializar pilas-engine con soporte para completos tenemos
que usar el parámetro "cargar_plugins" así:

```python
import pilasengine

pilas = pilasengine.iniciar(cargar_plugins=True)
```

Y en la consola tendrá que aparecer un texto indicando la cantidad de
complementos encontrada.

## Creando un plugin de ejemplo

Para probar esta funcionalidad, vamos a hacer un complemento muy
simple que solamente muestre un mensaje cuando pilas se inicializa.

Primero tenemos que crear el archivo para el complemento, en este
caso ``$HOMEDIR/.pilas-engine/plugins/saludar.py``

```python
class Saludar(object):

    def __init__(self, pilas):
      pilas.avisar("Bienvenido, pilas se inicio correctamente.")
```

Luego, para iniciarle a pilas que queremos cargar los complementos
tenemos que iniciar pilas así:


```python
import pilasengine

pilas = pilasengine.iniciar(cargar_plugins=True)
```

tendríamos que ver en consola el mensaje ``Se encontro un plugin``. Luego,
para inicializar el complemento:

```python
pilas.complementos.Saludar(pilas)
```

Es decir, en el nombre de cualquier clase definida en nuestros complementos
estará accesible a través del acceso ``pilas.complementos...``

## No olvides pasar el objeto "pilas"...

Ten en cuenta que a partir de la versión 0.90 de pilas-engine, para
acceder a la funcionalidad de pilas tenemos que usar la variable "pilas", y
que esta no el global. Así que te recomendamos hacer complementos
tal y como lo sugeremos aquí en el ejemplo, declarando "pilas" como un arguemento
en el inicializador:

```python
def NombreComplemento(object):

    def __init__(self, pilas):
      # [etc...]
```

e inicializándolo especificando el objeto pilas:


```python
pilas.complementos.NombreComplemento(pilas)
```
