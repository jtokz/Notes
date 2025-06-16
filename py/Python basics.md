- Use # to comment
- in py you can just set a name for a variable without specify why kind of object it is
- CTRL + / --> Conver a line of code in comment
- To set a name in python with more of one word, you must use underscore like_this
- print(2** 3) = 2^3
- print(f"") in python is like cw($"") in c#
- 
###### Python primitive types
 ![[Pasted image 20250318222419.png]]
###### list syntax
numbers = [1,2,3,4,5]
##### loops

For:
for number in numbers:
	# do something to each item
for i in range(a,b):
	# do this thing

While:
while something_is_true:
	# do something repeatedly

List comprehension
![[Pasted image 20250616203911.png]]
![[Pasted image 20250616204139.png]]
![[Pasted image 20250616205312.png]]
![[Pasted image 20250616210233.png]]
![[Pasted image 20250616210250.png]]
![[Pasted image 20250616210455.png]]


### Estructuras de control en python
| Estructura | Ordenada | Mutabilidad | Duplicados    | Acceso rápido       | Uso principal                             | Ventajas                        | Desventajas                                  |
| ---------- | -------- | ----------- | ------------- | ------------------- | ----------------------------------------- | ------------------------------- | -------------------------------------------- |
| **Lista**  | ✅ Sí     | ✅ Sí        | ✅ Sí          | ✅ Por índice        | Colecciones generales                     | Versátil, fácil de usar         | Menos eficiente para búsquedas grandes       |
| **Tupla**  | ✅ Sí     | ❌ No        | ✅ Sí          | ✅ Por índice        | Datos constantes o claves en diccionarios | Segura e inmutable              | No puedes cambiarla                          |
| **Set**    | ❌ No     | ✅ Sí        | ❌ No          | ❌ No índice         | Uniones, intersecciones, únicos           | Rápido para eliminar duplicados | No tiene orden ni índice                     |
| **Dict**   | ✅ Sí*    | ✅ Sí        | Claves únicas | ✅ Por clave         | Asociar claves con valores                | Acceso rápido por clave         | Claves deben ser únicas e inmutables         |
| **Array**  | ✅ Sí     | ✅ Sí        | ✅ Sí          | ✅ Por índice        | Datos numéricos grandes                   | Eficiente en memoria            | Requiere importar módulo y tipo de dato fijo |
| **Stack**  | ✅ Sí     | ✅ Sí        | ✅ Sí          | ✅ Último en entrar  | Control de flujo, deshacer acciones       | Muy fácil de implementar        | Acceso limitado solo al tope                 |
| **Queue**  | ✅ Sí     | ✅ Sí        | ✅ Sí          | ✅ Primero en entrar | Procesamiento por turnos                  | Útil para tareas en orden       | Acceso limitado al frente y al final         |
