
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