###### Python primitive types
 ![[Pasted image 20250318222419.png]]
##### List
numbers = [1,2,3,4,5]
##### loops

- For:
	for number in numbers:
		do something to each item
	for i in range(a,b):
		do this thing

- While:
	while something_is_true:
		do something repeatedly

#### List comprehension
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
|            |          |             |               |                     |                                           |                                 |                                              |
## 📊 Complejidades de Búsqueda (lookup) en Estructuras de Datos en Python

| Estructura      | Búsqueda (`in` o acceso directo)                              | Notas clave                                                                                 |
| --------------- | ------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| **list**        | 🔴 `O(n)`                                                     | Búsqueda secuencial. Tarda más mientras más larga es la lista.                              |
| **tuple**       | 🔴 `O(n)`                                                     | Igual que las listas, pero **inmutable**.                                                   |
| **set**         | 🟢 `O(1)` promedio🔴 `O(n)` peor caso                         | Basado en **hashes**, acceso rapidísimo. El peor caso es raro, pero posible con colisiones. |
| **dict**        | 🟢 `O(1)` promedio🔴 `O(n)` peor caso                         | También basado en **hashes**. Ideal para buscar por clave.                                  |
| **array.array** | 🔴 `O(n)`                                                     | Igual que listas, pero solo para tipos homogéneos.                                          |
| **deque**       | 🔴 `O(n)` búsqueda🟢 `O(1)` inserción/eliminación en extremos | Ideal como cola o pila, no para búsquedas.                                                  |
| **str**         | 🔴 `O(n)`                                                     | Las cadenas se recorren carácter por carácter.                                              |

| Estructura | Ordenada | Mutabilidad | Permite duplicados | Acceso por índice | Lookup rápido |
| ---------- | -------- | ----------- | ------------------ | ----------------- | ------------- |
| `list`     | ✅ Sí     | ✅ Sí        | ✅ Sí               | ✅ Sí              | ❌ No (`O(n)`) |
| `tuple`    | ✅ Sí     | ❌ No        | ✅ Sí               | ✅ Sí              | ❌ No (`O(n)`) |
| `set`      | ❌ No     | ✅ Sí        | ❌ No               | ❌ No              | ✅ Sí (`O(1)`) |
| `dict`     | ✅* Sí    | ✅ Sí        | ❌ (claves únicas)  | ✅ Por clave       | ✅ Sí (`O(1)`) |
| `array`    | ✅ Sí     | ✅ Sí        | ✅ Sí               | ✅ Sí              | ❌ No (`O(n)`) |
| `deque`    | ✅ Sí     | ✅ Sí        | ✅ Sí               | ❌ No              | ❌ No (`O(n)`) |
| `str`      | ✅ Sí     | ❌ No        | ✅ Sí               | ✅ Sí              | ❌ No (`O(n)`) |

##### Dictionaries

![[Pasted image 20250624132219.png]]

- Dictionary lookup
![[Pasted image 20250621131423.png]]
![[Pasted image 20250621132641.png]]

### if conditional
![[Pasted image 20250628184131.png]]