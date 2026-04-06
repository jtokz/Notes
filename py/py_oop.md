---
tags: [lang/python, area/oop, type/concept]
---

syntax:

def name_function(parameters):
	logic
	logic
	logic
free new lines of code

![[Pasted image 20250531132726.png]]![[Pasted image 20250531132733.png]]
![[Pasted image 20250531132743.png]]
##### 🔷 ¿Qué es `@property` en Python?

El decorador `@property` se usa cuando quieres **encapsular el acceso a un atributo**, es decir, controlar lo que ocurre cuando se lee o se escribe, pero **sin cambiar la forma en la que se accede a la propiedad**.
```python
class Node:
    def __init__(self, state):
        self._state = state  # atributo "privado" por convención

    @property
    def state(self):
        print("Obteniendo el estado")
        return self._state

    @state.setter
    def state(self, value):
        print("Asignando un nuevo estado")
        if value is None:
            raise ValueError("El estado no puede ser None")
        self._state = value
```

![[Pasted image 20250531132858.png]]

```python
# Ejemplo completo
class Persona:
    def __init__(self, nombre):
        self._nombre = nombre

    @property
    def nombre(self):
        return self._nombre

    @nombre.setter
    def nombre(self, nuevo_nombre):
        if len(nuevo_nombre) < 2:
            raise ValueError("Nombre muy corto")
        self._nombre = nuevo_nombre

# Uso:
p = Persona("Juan")
print(p.nombre)   # Juan
p.nombre = "Ana"  # válido
p.nombre = "A"    # lanza ValueError
```

```python
# Lo que ve Python internamente cuando haces: n = Node("inicio")
n = Node.__new__(Node)      # crea el objeto vacío
Node.__init__(n, "inicio")  # lo inicializa
```

![[Pasted image 20250531133221.png]]![[Pasted image 20250531133316.png]]
