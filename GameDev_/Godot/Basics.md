
# Nodos:
Godot funciona por nodos, cada nodo es como un bloque que viene con ciertas funcionalidades como:
	enseñar una imagen
	reproducir sonidos

A base de unir nodos podemos montar el juego.
![[Pasted image 20251224170428.png]]
Si creamos solo un nodo, como es el nodo base será como tener una caja vacía, sin funcionalidad, no tiene siquiera una posición en la escena.
Al seleccionar un nodo nos saldrán sus propiedades a la derecha donde podremos cambiar características

![[Pasted image 20251224170925.png]]
Si creamos un nodo tipo Node2D, veremos que en la sección del inspector tendremos sus propiedades como Node2D y adicional tendremos de los nodos anteriores de la rama a la que pertenece, en este caso un Node2D pertenece a la clase de nodos CanvasItem y este a su vez al nodo base Node (Como todos)


Algunos nodos
Node2D: Nodo base para un objeto 2d
Sprite2D: Nodo en el que se almacena el sprite de este objeto, o sea, la forma en como se ve, con esto ya se manifiesta visualmente en nuestro juego
RigidBody2D:  Este nodo nos dice que el objeto interactua con físicas

Una vez tengamos un objeto al que le afectan las físicas y este tiene un sprite para ser mostrado en pantalla podemos ejecutarlo, pero para esto debemos guardar la escena, más adelante explicaré qué es una escena
![[Pasted image 20251224173538.png]]
La escena toma el nombre del nodo raíz, así que cambiando este la escena tomará este mismo nombre, pudiéndose cambiar pero que por convención se deja así, con este nombre

![[Pasted image 20251224175602.png]]
Si tenemos nuestro RigidBody2D en la posición 0,0 al ejecutar el juego se verá únicamente la mitad derecha del objeto cayendo (Por efecto de la gravedad) esto porque Godot toma la posición 0,0 como arriba a la izquierda, para ajustar esto y que nuestro objeto esté, por ejemplo, en la mitad de la pantalla debemos agregar un nuevo nodo de tipo Camera2D, estando este objeto en escena será la que se encargue de decir qué se muestra en pantalla, delimitado por su rectángulo, si solo movieramos el objeto dentro del recuadro azul que es el tamaño de la ventana, al variar esta haría que ya no estuviera en el centro de la escena.


![[Pasted image 20251224181143.png]]
Es importante por ejemplo, a la hora de mover un nodo que tengamos seleccionado su nodo padre, ya que si movemos por ejemplo, solo el sprite, el nodo del StaticBody2D quedaría en su misma posición, haciendo que estén descuadrados y puede que cueste un poco darse cuenta de esto

![[Pasted image 20251224181341.png]]
Ahora, el StaticBody en teoría debería detener al RigidBody, por qué no lo está haciendo y lo está atravesando? esto es porque el Nodo no tiene una forma, por lo tanto no hay nada con lo que chocar, porque una cosa es el sprite y otra la forma del objeto, algo así como la Hitbox
Esto se soluciona añadiendo un CollisionShape
![[Pasted image 20251224182257.png]]
Una vez los objetos tengan CollisionShape, la cual debe tener una forma, en este caso rectángulos, los objetos ya van a chocar


## Tile Set
Un tile set es un conjunto de piezas graficas "tiles" que se usan para construir mapas 2D de forma rápida y ordenada, en otras palabras es una imagen (spritesheet) con muchos bloques pequeños, configurada dentro de Godot para que el motor sepa:
- Qué parte de la imagen es cada tile
- Qué colisiones tiene
- Si es suelo, pared, decorativo, dañino, etc.

Y luego se usa con un TileMap para "pintar" el nivel

![[Pasted image 20251224184809.png]]
Lo primero que tendríamos que hacer es crear un nodo tipo TileMapLayer, en este setearíamos en sus propiedades un Tile Set, el cuál daremos nombre y guardaremos, todo nuevamente muy bien organizado en carpetas
![[Pasted image 20251224184953.png]]

Seguido necesitaremos un Tile Source que vendría siendo la ruta de la imagen que usaremos, o sea un Atlas, un atlas es una imagen que contiene varios sprites
![[Pasted image 20251224185103.png]]

Una vez seleccionada la imagen el propio motor nos ayudará generando un grid el cual podremos cambiar ya sea 16x16, 32x32 etc

![[Pasted image 20251225204058.png]]

Luego ya podremos utilizar los elementos de nuestro tile set, pero antes deberíamos definir el tamaño de nuestro juego, por ejemplo de, 16 casillas de alto por 28 de ancho

![[Pasted image 20251225211758.png]]
Para no estar repitiendo este primer escenario vamos a guardar la escena para su reutilización, no confundirse con el nombre escena, 
##### escena es solo el nombre de un conjunto de nodos que guardamos en el proyecto, no tiene por qué ser un escenario

![[Pasted image 20251225212646.png]]
Ahora, si quisieramos por ejemplo ampliar los bordes, al modificar la escena bordes y OJO, la escena bordes como tal, no la copia almacenada en otra escena como Nivel1 por ejemplo, se cambiará en todos, esto es útil pero solo funciona de esta manera, no al revés, si solo hacemos cambios en la copia bordes que está dentro de Nivel1, únicamente haremos cambios en esta y no en la escena como tal, para esto se abre con el ícono a la derecha y allí sabremos que estamos sobre la escena bordes base


### Collision Layer & Collision Mask

![[Pasted image 20251225222030.png]]
Se llama así a las capas de colisiones, donde se agrupan distintos tipos de materiales que interactuarán entre sí, una vez hayamos nombrado los distintos grupos de materiales como lo serían objetos sólidos, objetos que dañan, una capa única para el jugador y otra para los recolectables, procedemos a, en los distintos nodos en este caso Nivel, crear los que vayamos a necesitar, como este nivel solo tendrá objetos sólidos y pinchos solo será necesario crear dos layers, en donde se dibujará el area del collider dependiendo de, si es por ejemplo sólido en una layer y daño en otra
![[Pasted image 20251225222616.png]]

##### Creación de personaje
![[Pasted image 20251225223046.png]]

Le añadimos un CollisionShape2D para que interactue con su entorno
![[Pasted image 20251228173650.png]]

## Syntaxis Godot
![[Pasted image 20251227095434.png]]

#### Funciones básicas

Estas funciones son overrides de otras, en donde se implementa lógica, godot las llama automáticamente dependiendo de qué función sea y aquí lo comentaré

###### func /n_ready():
Esta funcion es llamada solo una vez cuando se ejecuta el juego
Ej. probar cosas en el debugger (print("print something"))
###### func /n_process():
Esta función se ejecuta en cada frame, entonces está siendo llamada constantemente
###### func /n_physics_process():
Esta función se llama cada vez que se resuelven las físicas, que por default es 60 veces por segundo, pero se puede cambiar, en teoría aquí no se debería llamar a delta pero si el ordenador tiene que resolver muchas físicas al tiempo es posible que no se alcance a llamar las 60 veces

el motivo de usar physics_process en vez de solo process para el movimiento es que si hacemos algo que interactue con las físicas es mejor que esté sincronizado con los frames en los que se resuelven las físicas, para evitar errores

Aunque al personaje lo vamos a mover por código y no por físicas el nodo Character2D puede interactuar con otros ej. empujando una caja y aquí sí que nos interesa que el movimiento del personaje esté sincronizado con las físicas


Tenemos el siguiente script de personaje:
![[Pasted image 20251228230114.png]]

En el apartado de las colisiones, Layer quiere decir "Trata a este nodo como:" mientras que Mask quiere decir "Quiero que interactues con:"
![[Pasted image 20251228231307.png]]


Area2D
Un area2d es como un collider pero que no colisiona, solo detecta cuando otros elementos entran o salen de su area, en otras palabras un trigger

![[Pasted image 20251228232012.png]]
Como no me interesa que esta area sea nada más allá de un trigger no marco ninguna casilla en layer, solo me interesa que detecte cuando lo atraviesen los pinchos, con lo cual en Collision Mask se marcará la casilla del daño

Teniendo esto así lo que Area2D hará es activar una señal cuando detecte que otro elemento ha entrado o ha salido del area, una señal, o evento es algo parecido a una función

Linkear variables
![[Pasted image 20251228235430.png]]
Creamos una variable global en la cuál especificaremos qué tipo de Nodo queremos que reciba, se podría hacer de tipo Node para que reciba cualquiera, pero es más preciso asignarle exáctamente el tipo de Nodo que queremos que almacene
![[Pasted image 20251228235605.png]]
Una vez creada iremos al inspector, donde le asignaremos el Nodo que queremos llamar, de esta manera nos aseguramos que quede linkeado ese nodo y no cualquier otro nodo de tipo Area2d, queremos la ruta a exactamente el nodo que pondremos aquí


Conectar señales
Es lo que sería en otros lenguajes un event, trigger, y lo que haga este
Aquí podemos conectar una señal, lo que vendría siendo un evento, ejemplo: que el personaje entre en contacto con pinchos, en palabras más técnicas

Un elemento ha entrado al Area2D de mi CharacterBody2D, esta Area tiene un evento body_entered el cual ha triggereado cuando la Collision layer de estos ha entrado en contacto con el collisionshape2d del area2d del personaje

![[Pasted image 20251229030335.png]]

Haremos algo similar cuando el personaje muera, este emitirá una señal una vez toque los pinchos con lo cuál mandará una señal para que se llame a la función de reiniciar el nivel

una manera de hacer esto es creando una signal y haciendo el llamado una vez el personaje muera, se añade el personaje a un grupo y luego desde el script de la escena principal se busca entre los hijos del nivel instaniciado con este grupo, así se encuentra y se linkea la función a llamar una vez muera el personaje

OJO ES MUY IMPORTANTE SOLO REFERENCIAR A LA FUNCIÓN, NO HACER UN LLAMADO CON PARÉNTESIS PORQUE ESTO PUEDE GENERAR UN PROBLEMA, COMO UN LOOP INFINITO

MAL
![[Pasted image 20251229031313.png]]
BIEN
![[Pasted image 20251229032156.png]]

![[Pasted image 20251229033658.png]]
Aquí estamos teniendo un error ya que el nivel a ser instanciado se está llamando desde un evento y no desde el flujo normal, es un problema porque se está añadiendo o quitando un nodo mientras se están calculando las fisicas y godot no lo está permitiendo, para esto se usa una función que lo que hace es almacenar esa llamada para que se ejecute al final del frame y así no liarla