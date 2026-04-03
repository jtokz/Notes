> Documento complementario al tablero Kanban. Cada sección corresponde a una tarjeta del roadmap y detalla qué conceptos trabajar, qué recursos usar y qué ejercicios hacer para saber que realmente lo que se ha asimilado.

---
## Fase 1 — Refrescar Python

### 1a · Días 1–7 Angela Yu

**Qué cubre el curso en estos días**
Variables, tipos de datos primitivos (int, float, str, bool), operaciones con strings, listas básicas, bucles `for` y `while`, condicionales `if / elif / else`, funciones simples sin parámetros complejos.

**Qué debes notar viniendo de C#**
Python no tiene declaración de tipo explícita. No existe `int x = 5`, solo `x = 5`. El tipado es dinámico, lo que significa que una variable puede cambiar de tipo en tiempo de ejecución. Esto es una diferencia fundamental respecto a C#. También desaparecen las llaves `{}` para delimitar bloques: Python usa indentación obligatoria (4 espacios por convención).

**Conceptos clave a consolidar**
- f-strings: `f"Hola, {nombre}"` — la forma moderna de formatear strings en Python (equivale al `$"Hola, {nombre}"` de C#).
- Slicing de listas y strings: `lista[1:4]`, `lista[::2]`, `lista[::-1]`. No existe en C# de forma nativa.
- Métodos de string más usados: `.strip()`, `.lower()`, `.upper()`, `.replace()`, `.split()`, `.join()`.
- `len()`, `range()`, `type()` — funciones built-in que usarás a diario.
- La diferencia entre `=` (asignación), `==` (comparación) y `is` (identidad de objeto).

**Recursos**
- El propio curso de Angela Yu, días 1–7 (velocidad x1.5 o x2 es suficiente).
- Documentación oficial de Python sobre tipos built-in: https://docs.python.org/3/library/stdtypes.html
- Python Tutor (visualizador de ejecución paso a paso, muy útil para entender qué pasa en memoria): https://pythontutor.com

**Ejercicios para validar que lo has asimilado**
1. Escribe una función que reciba un string y devuelva el mismo string con las palabras en orden inverso. (`"hola mundo"` → `"mundo hola"`).
2. Dado una lista de números, filtra solo los pares usando un bucle `for` y una lista nueva. Luego repite el ejercicio con list comprehension (aunque esto se cubre más adelante, intenta buscarlo).
3. Escribe un programa que pida al usuario su nombre y edad y responda cuántos años tendrá en el año 2050.

---
### 1b · Días 8–14 Angela Yu

**Qué cubre el curso en estos días**
Parámetros de funciones, valores de retorno, diccionarios, anidamiento de listas y dicts, scope (ámbito de variables), debugging básico, proyecto Blackjack como capstone.

**Qué debes notar viniendo de C#**
Los diccionarios de Python (`dict`) son equivalentes a `Dictionary<TKey, TValue>` en C#, pero con sintaxis mucho más ligera. El scope en Python sigue la regla LEGB (Local, Enclosing, Global, Built-in), que es más permisivo que C# pero puede causar bugs sutiles si no se entiende.

**Conceptos clave a consolidar**
- Creación y acceso a dicts: `d = {"clave": "valor"}`, `d["clave"]`, `d.get("clave", valor_por_defecto)`.
- Métodos de dict: `.keys()`, `.values()`, `.items()` — este último es el más usado en bucles.
- Diferencia entre scope local y global. Por qué usar `global` dentro de una función es mala práctica.
- Parámetros con valor por defecto: `def saludar(nombre, saludo="Hola")`.
- Cómo leer un traceback de Python: entender la pila de llamadas, identificar la línea del error, leer el tipo de excepción.
- El proyecto Blackjack integra todo lo anterior — no lo saltes, es el primer proyecto que requiere pensar en estructura.

**Recursos**
- Documentación de dict: https://docs.python.org/3/library/stdtypes.html#dict
- Artículo sobre LEGB scope (Real Python): https://realpython.com/python-scope-legb-rule/
- Para debugging: la extensión de Python en VS Code tiene un debugger visual muy bueno. Aprende a poner breakpoints.

**Ejercicios para validar que lo has asimilado**
1. Crea un dict que represente un contacto (nombre, teléfono, email). Escribe funciones para añadir, actualizar y eliminar campos.
2. Escribe una función que cuente cuántas veces aparece cada palabra en un string y devuelva un dict con los resultados.
3. Implementa una versión simplificada de Blackjack en la terminal (sin interfaz gráfica): dos jugadores, reparto de cartas, lógica de ganar/perder). Si ya lo has hecho en el curso, rehazlo sin mirar la solución.

---
### 1c · Entorno Mac

**Por qué esto importa**
Un entorno mal configurado causa horas de frustración. En Mac, Python viene preinstalado en el sistema pero es una versión antigua que no debes tocar. La forma correcta es gestionar versiones con `pyenv` e instalar dependencias en entornos virtuales aislados por proyecto.

**Conceptos clave a consolidar**

*Homebrew*
Gestor de paquetes de Mac. Si ya lo tienes instalado, bien. Úsalo para instalar `pyenv`:
```bash
brew install pyenv
```

*pyenv*
Permite tener múltiples versiones de Python instaladas y cambiar entre ellas. Comandos esenciales:
```bash
pyenv install 3.12.3        # instala una versión concreta
pyenv global 3.12.3         # la establece como versión por defecto
pyenv local 3.11.0          # versión solo para el directorio actual
pyenv versions              # lista versiones instaladas
```

*Entornos virtuales (venv)*
Cada proyecto debe tener su propio entorno para que las dependencias no se mezclen entre proyectos:
```bash
python -m venv .venv              # crea el entorno en la carpeta .venv
source .venv/bin/activate         # activa el entorno
deactivate                        # desactiva el entorno
pip install requests              # instala un paquete en el entorno activo
pip freeze > requirements.txt     # guarda las dependencias del proyecto
pip install -r requirements.txt   # instala desde el fichero de dependencias
```

*Editor: VS Code o PyCharm*
Ambos son buenas opciones. VS Code con las extensiones de Python y Pylance es más ligero. PyCharm Community es más potente para proyectos grandes. Para empezar, VS Code es más que suficiente. Extensiones recomendadas: Python (Microsoft), Pylance, Black Formatter, GitLens.

**Recursos**
- Guía de instalación de pyenv en Mac: https://github.com/pyenv/pyenv#installation
- Documentación de venv: https://docs.python.org/3/library/venv.html
- Configurar VS Code para Python: https://code.visualstudio.com/docs/python/python-tutorial

**Ejercicios para validar que lo has asimilado**
1. Instala Python 3.12 con pyenv, crea un proyecto vacío, crea un entorno virtual, instala `requests`, congela las dependencias en `requirements.txt`.
2. Abre el proyecto en VS Code y confirma que el intérprete seleccionado es el del entorno virtual (esquina inferior izquierda).
3. Borra el entorno virtual, vuelve a crearlo e instala las dependencias desde `requirements.txt`. Comprueba que funciona.

---

### 1d · Terminal básica

**Por qué esto importa**
Venir de Windows con GUI para todo es un cambio. En Mac/Linux, la terminal es la herramienta principal. Cuanto antes te sientas cómodo en ella, más fluido será todo lo demás.

**Conceptos clave a consolidar**

*Navegación y archivos*
```bash
pwd                    # muestra el directorio actual
ls -la                 # lista archivos (incluyendo ocultos)
cd nombre_carpeta      # entrar en carpeta
cd ..                  # subir un nivel
cd ~                   # ir al home
mkdir nombre           # crear carpeta
touch archivo.py       # crear archivo vacío
rm archivo.py          # borrar archivo
rm -rf carpeta         # borrar carpeta y contenido (cuidado)
mv origen destino      # mover o renombrar
cp origen destino      # copiar
```

*Lectura de archivos*
```bash
cat archivo.txt        # muestra el contenido
less archivo.txt       # muestra el contenido paginado (q para salir)
head -n 20 archivo.txt # muestra las primeras 20 líneas
grep "texto" archivo   # busca texto en un archivo
```

*Variables de entorno*
```bash
export MI_VARIABLE="valor"     # define una variable en la sesión
echo $MI_VARIABLE              # muestra su valor
```
Para que persistan entre sesiones, se añaden al fichero `~/.zshrc` (el shell por defecto en Mac es zsh).

*El fichero .zshrc*
Es el equivalente al `PATH` de Windows pero más potente. Se ejecuta cada vez que abres una terminal. Aquí se configuran aliases, variables de entorno y la configuración de pyenv.

**Recursos**
- The Missing Semester of Your CS Education (MIT, gratuito, cubre terminal, Git, Vim y más): https://missing.csail.mit.edu
- Explainshell (pega cualquier comando y te explica cada parte): https://explainshell.com

**Ejercicios para validar que lo has asimilado**
1. Desde la terminal, navega hasta tu vault de Obsidian, lista los archivos, crea una carpeta llamada `test_terminal` y un archivo `.md` dentro.
2. Crea un script Python que imprima el valor de una variable de entorno llamada `MI_NOMBRE`. Ejecútalo desde la terminal después de exportar la variable.
3. Añade un alias a tu `.zshrc` que escribiendo `proyectos` te lleve directamente a tu carpeta de proyectos.

---

## Fase 2 — Python con sustancia

### 2a · OOP en Python (días 16–17)

**Qué cubre el curso en estos días**
Clases, objetos, atributos de instancia, métodos, constructores (`__init__`), herencia, polimorfismo básico.

**Qué debes notar viniendo de C#**
Conceptualmente es lo mismo que ya sabes. Las diferencias son de sintaxis y convenciones:
- No existe `public`, `private`, `protected` como keywords. Por convención, `_atributo` indica "no toques esto desde fuera" y `__atributo` activa name mangling (raramente necesario).
- `self` es el equivalente a `this` en C#, pero se escribe explícitamente como primer parámetro de cada método.
- No hay interfaces como en C# (aunque hay `ABC` y `Protocol` para algo similar).
- Python permite herencia múltiple, C# no (salvo interfaces).
- Los métodos dunder (double underscore): `__init__`, `__str__`, `__repr__`, `__len__`, etc. Son los equivalentes a sobrecargar operadores o implementar interfaces como `IStringable` en C#.

**Conceptos clave a consolidar**
- `__init__` vs `__new__` (en la práctica casi siempre solo usarás `__init__`).
- `__str__` para representación legible (lo que ve el usuario) vs `__repr__` para representación técnica (lo que ve el desarrollador).
- `@classmethod` y `@staticmethod` — cuándo usar cada uno.
- `@property` — getters y setters a la Python, más elegante que en C#.
- Herencia: `super().__init__()` para llamar al constructor del padre.
- MRO (Method Resolution Order): cómo Python decide qué método usar en herencia múltiple. Puedes verlo con `Clase.__mro__`.

**Recursos**
- Real Python — OOP en Python: https://realpython.com/python3-object-oriented-programming/
- Documentación oficial sobre clases: https://docs.python.org/3/tutorial/classes.html

**Ejercicios para validar que lo has asimilado**
1. Crea una clase `Libro` con atributos `titulo`, `autor`, `paginas` y un método `resumen()` que devuelva un string descriptivo. Implementa `__str__` y `__repr__`.
2. Crea una clase `Biblioteca` que contenga una lista de libros. Añade métodos para agregar libros, buscar por autor y listar todos. Implementa `__len__` para que `len(biblioteca)` devuelva el número de libros.
3. Crea una jerarquía: clase base `Animal` con método `hablar()`, subclases `Perro` y `Gato` que lo sobreescriben. Practica polimorfismo iterando una lista de animales mixta y llamando a `hablar()` en cada uno.

---

### 2b · Archivos, JSON, excepciones (días 24, 30)

**Por qué esto importa**
La mayoría de programas reales leen y escriben datos. Entender cómo hacerlo bien en Python — y cómo manejar los errores que inevitablemente ocurren — es fundamental antes de hacer cualquier cosa seria.

**Conceptos clave a consolidar**

*Archivos*
```python
# Siempre usar context manager (with) — cierra el archivo automáticamente
with open("archivo.txt", "r", encoding="utf-8") as f:
    contenido = f.read()          # lee todo de golpe
    lineas = f.readlines()        # lee como lista de líneas

with open("archivo.txt", "w", encoding="utf-8") as f:
    f.write("texto")

with open("archivo.txt", "a", encoding="utf-8") as f:
    f.write("texto añadido")      # append, no sobreescribe
```
Modos: `"r"` (read), `"w"` (write, sobreescribe), `"a"` (append), `"rb"` / `"wb"` (binario).

*JSON*
```python
import json

# Leer JSON desde archivo
with open("datos.json", "r") as f:
    datos = json.load(f)          # devuelve dict o list

# Escribir JSON a archivo
with open("datos.json", "w") as f:
    json.dump(datos, f, indent=2)

# Convertir entre string y dict
texto_json = json.dumps(datos)    # dict → string
datos = json.loads(texto_json)    # string → dict
```

*Excepciones*
```python
try:
    resultado = 10 / 0
except ZeroDivisionError:
    print("No se puede dividir por cero")
except (TypeError, ValueError) as e:
    print(f"Error de tipo o valor: {e}")
except Exception as e:
    print(f"Error inesperado: {e}")
else:
    print("Se ejecuta si no hubo excepción")
finally:
    print("Se ejecuta siempre")

# Lanzar excepciones propias
raise ValueError("El valor no puede ser negativo")

# Crear excepciones personalizadas
class MiError(Exception):
    pass
```

Excepciones más comunes que te encontrarás: `FileNotFoundError`, `KeyError`, `IndexError`, `TypeError`, `ValueError`, `AttributeError`.

**Recursos**
- Real Python — Working with files: https://realpython.com/working-with-files-in-python/
- Real Python — Excepciones: https://realpython.com/python-exceptions/

**Ejercicios para validar que lo has asimilado**
1. Escribe un gestor de tareas en JSON: lee una lista de tareas de un archivo `tareas.json`, permite añadir y marcar como completadas, y guarda los cambios. Si el archivo no existe, créalo vacío.
2. Escribe una función que lea un CSV manualmente (sin Pandas), construya una lista de dicts y la guarde como JSON.
3. Crea una clase con validación: `Temperatura` que solo acepte valores entre -273.15 y 1e6. Lanza `ValueError` con mensaje descriptivo si se viola la condición.

---

### 2c · APIs y autenticación (días 33–35)

**Por qué esto importa**
Hoy en día casi toda aplicación consume APIs externas. Entender cómo funcionan HTTP, autenticación y variables de entorno es imprescindible para cualquier proyecto real.

**Conceptos clave a consolidar**

*HTTP básico*
- Métodos: GET (obtener datos), POST (enviar datos), PUT/PATCH (actualizar), DELETE (borrar).
- Status codes: 200 OK, 201 Created, 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 500 Server Error.
- Headers: metadatos de la petición. El más importante para APIs: `Content-Type: application/json`.

*La librería requests*
```python
import requests

# GET simple
response = requests.get("https://api.example.com/datos")
response.status_code          # 200, 404, etc.
response.json()               # parsea el JSON de la respuesta
response.text                 # respuesta como string

# GET con parámetros
params = {"ciudad": "Madrid", "units": "metric"}
response = requests.get(url, params=params)

# POST con JSON
payload = {"nombre": "Juan", "edad": 28}
response = requests.post(url, json=payload)

# Con headers de autenticación
headers = {"Authorization": f"Bearer {mi_api_key}"}
response = requests.get(url, headers=headers)
```

*Variables de entorno y .env*
Las API keys nunca van hardcodeadas en el código. Se guardan en un archivo `.env`:
```
OPENWEATHER_API_KEY=abc123xyz
```
Y se leen con la librería `python-dotenv`:
```python
from dotenv import load_dotenv
import os

load_dotenv()
api_key = os.getenv("OPENWEATHER_API_KEY")
```
El archivo `.env` siempre va en `.gitignore` para no subir credenciales a GitHub.

**Recursos**
- Documentación de requests: https://requests.readthedocs.io
- OpenWeatherMap API (gratuita para prácticas): https://openweathermap.org/api
- The Noun Project / REST Countries API (sin auth, buena para practicar): https://restcountries.com

**Ejercicios para validar que lo has asimilado**
1. Usando la API de OpenWeatherMap, crea un script que pida el nombre de una ciudad y muestre la temperatura actual, humedad y descripción del tiempo.
2. Crea un script que consuma la API de REST Countries y muestre los 5 países más poblados de Europa.
3. Escribe una función genérica `get_json(url, params=None, headers=None)` que haga una petición GET, gestione los errores de red y de status code, y devuelva el JSON parseado o `None` si falla.

---

### 2d · Pandas y CSV (días 25, 39–40)

**Por qué esto importa**
Pandas es la herramienta estándar para trabajar con datos tabulares en Python. Lo usarás tanto si vas hacia data science como si simplemente necesitas procesar ficheros de datos en cualquier proyecto.

**Conceptos clave a consolidar**

*Estructuras básicas*
- `Series`: una columna con índice. Similar a un array con etiquetas.
- `DataFrame`: tabla de datos con filas y columnas. Es la estructura central de Pandas.

*Operaciones esenciales*
```python
import pandas as pd

# Crear y leer
df = pd.read_csv("archivo.csv")
df = pd.read_csv("archivo.csv", index_col=0)    # primera columna como índice
df.to_csv("salida.csv", index=False)

# Inspeccionar
df.head(10)          # primeras 10 filas
df.tail(5)           # últimas 5 filas
df.shape             # (filas, columnas)
df.info()            # tipos de datos y valores nulos
df.describe()        # estadísticas básicas de columnas numéricas

# Seleccionar
df["columna"]              # una columna → Series
df[["col1", "col2"]]       # varias columnas → DataFrame
df.loc[2]                  # fila por etiqueta de índice
df.iloc[2]                 # fila por posición numérica
df[df["edad"] > 25]        # filtrar filas por condición

# Modificar
df["nueva_col"] = df["col1"] + df["col2"]
df.drop("columna", axis=1, inplace=True)
df.rename(columns={"viejo": "nuevo"}, inplace=True)
df.fillna(0)               # rellenar valores nulos

# Agrupar y agregar
df.groupby("ciudad")["ventas"].sum()
df.groupby("ciudad").agg({"ventas": "sum", "clientes": "mean"})

# Ordenar
df.sort_values("ventas", ascending=False)
```

**Recursos**
- Documentación oficial de Pandas: https://pandas.pydata.org/docs/
- Real Python — Pandas basics: https://realpython.com/pandas-dataframe/
- Datasets de práctica gratuitos: https://www.kaggle.com/datasets (busca datasets pequeños para empezar)

**Ejercicios para validar que lo has asimilado**
1. Descarga un CSV de Kaggle (por ejemplo, el Titanic dataset). Cárgalo con Pandas, muestra las primeras filas, cuenta cuántos valores nulos hay por columna y elimina las filas con nulos en columnas críticas.
2. Usando el mismo dataset, calcula la tasa de supervivencia por sexo y por clase de pasajero.
3. Crea un script que lea un CSV de ventas (puedes generarlo tú), agrupe por categoría de producto, calcule la suma y media de ventas, y guarde el resultado en un nuevo CSV.

---

### 2e · Git workflow

**Por qué esto importa**
Ya usas Git para tu vault de Obsidian, así que tienes la base. Aquí el objetivo es adoptar un workflow más profesional para proyectos de código: branches, commits descriptivos y buenas prácticas que serán normales en cualquier equipo.

**Conceptos clave a consolidar**

*Comandos esenciales (repaso)*
```bash
git init                          # inicializar repositorio
git clone url                     # clonar repositorio remoto
git status                        # ver estado del working tree
git add archivo.py                # añadir al staging area
git add .                         # añadir todos los cambios
git commit -m "mensaje"           # commit con mensaje
git push origin main              # subir al remoto
git pull origin main              # bajar cambios del remoto
git log --oneline                 # historial compacto
```

*Branches*
```bash
git branch                        # lista ramas
git branch nombre-rama            # crea una rama
git checkout nombre-rama          # cambia a esa rama
git checkout -b nombre-rama       # crea y cambia en un paso
git merge nombre-rama             # fusiona la rama en la actual
git branch -d nombre-rama         # borra la rama (local)
```

*Commits semánticos*
Un estándar muy extendido para escribir mensajes de commit que tengan significado:
```
feat: añadir función de búsqueda por autor
fix: corregir error al cargar CSV vacío
refactor: extraer lógica de validación a función separada
docs: actualizar README con instrucciones de instalación
chore: actualizar dependencias
```
Formato: `tipo: descripción corta en imperativo, presente`.

*.gitignore para proyectos Python*
```
.venv/
__pycache__/
*.pyc
.env
.DS_Store
```

**Recursos**
- Pro Git (libro gratuito, el más completo): https://git-scm.com/book/es/v2
- Conventional Commits (especificación de commits semánticos): https://www.conventionalcommits.org/es/v1.0.0/
- Oh My Zsh con plugin de Git (atajos en la terminal): https://ohmyz.sh

**Ejercicios para validar que lo has asimilado**
1. Crea un repositorio para uno de los proyectos de Python que hayas hecho. Añade un `.gitignore` correcto, haz al menos 5 commits con mensajes semánticos.
2. Crea una rama `feature/nueva-funcionalidad`, haz cambios en ella, vuelve a `main` y haz un merge. Observa el historial con `git log --oneline --graph`.
3. Simula un conflicto: modifica la misma línea en `main` y en otra rama, intenta hacer el merge y resuélvelo manualmente.

---

## Fase 3 — Transición a datos e IA

### 3a · NumPy (día 76)

**Por qué esto importa**
NumPy es la base de casi toda la computación científica en Python. Pandas internamente usa NumPy. Scikit-learn espera arrays de NumPy. TensorFlow y PyTorch también trabajan con estructuras similares. Sin entender NumPy, las capas superiores resultan opacas.

**Conceptos clave a consolidar**

*Arrays vs listas de Python*
La diferencia fundamental es que un array de NumPy es homogéneo (todos los elementos del mismo tipo) y almacena los datos en memoria contigua, lo que lo hace orders of magnitude más rápido para operaciones matemáticas.

```python
import numpy as np

# Crear arrays
a = np.array([1, 2, 3, 4, 5])
b = np.zeros((3, 4))               # matriz 3x4 de ceros
c = np.ones((2, 3))                # matriz 2x3 de unos
d = np.arange(0, 10, 2)           # [0, 2, 4, 6, 8]
e = np.linspace(0, 1, 5)          # 5 valores entre 0 y 1

# Propiedades
a.shape          # dimensiones
a.dtype          # tipo de dato
a.ndim           # número de dimensiones
a.size           # número total de elementos
```

*Operaciones vectorizadas*
```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

a + b            # [5, 7, 9] — no hace falta un bucle
a * 2            # [2, 4, 6]
a ** 2           # [1, 4, 9]
np.sqrt(a)       # raíz cuadrada de cada elemento

# Estadísticas
a.mean()
a.std()
a.min(), a.max()
np.sum(a)
```

*Indexing y slicing*
```python
m = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

m[1, 2]          # elemento fila 1, columna 2 → 6
m[0]             # primera fila → [1, 2, 3]
m[:, 1]          # segunda columna → [2, 5, 8]
m[1:, :2]        # submatriz → [[4, 5], [7, 8]]

# Boolean indexing
a = np.array([1, 5, 3, 8, 2])
a[a > 3]         # [5, 8] — filtra con condición
```

*Broadcasting*
Mecanismo que permite operar arrays de distinto tamaño siguiendo unas reglas concretas. Es una de las características más potentes y más confusas al principio.

**Recursos**
- NumPy quickstart oficial: https://numpy.org/doc/stable/user/quickstart.html
- Visual guide to NumPy (Jay Alammar): https://jalammar.github.io/visual-numpy/

**Ejercicios para validar que lo has asimilado**
1. Crea una matriz 5x5 de números aleatorios entre 0 y 100. Calcula la media de cada fila y de cada columna.
2. Implementa la normalización min-max de un array (llevar todos los valores al rango [0, 1]) usando solo operaciones vectorizadas, sin bucles.
3. Dadas dos matrices compatibles, calcula su producto matricial con `np.dot` y verifica el resultado a mano con un ejemplo pequeño.

---

### 3b · Visualización (días 72–75)

**Por qué esto importa**
En data science y machine learning, visualizar los datos antes de modelar es obligatorio. Revela distribuciones, outliers, correlaciones y patrones que ninguna tabla de números hace evidente.

**Conceptos clave a consolidar**

*Matplotlib — la base*
```python
import matplotlib.pyplot as plt

# Gráfica de línea
plt.plot(x, y, label="ventas")
plt.xlabel("Mes")
plt.ylabel("Ventas")
plt.title("Ventas mensuales")
plt.legend()
plt.show()

# Gráfica de barras
plt.bar(categorias, valores, color="steelblue")

# Histograma
plt.hist(datos, bins=20, edgecolor="black")

# Scatter plot
plt.scatter(x, y, alpha=0.5)

# Subplots
fig, axes = plt.subplots(1, 2, figsize=(12, 5))
axes[0].plot(x, y)
axes[1].bar(cat, val)
```

*Seaborn — estadística visual*
Seaborn está construido sobre Matplotlib y facilita gráficas estadísticas con mucho menos código:
```python
import seaborn as sns

sns.histplot(df["columna"], kde=True)        # histograma con curva de densidad
sns.boxplot(x="categoria", y="valor", data=df)
sns.scatterplot(x="col1", y="col2", hue="categoria", data=df)
sns.heatmap(df.corr(), annot=True, cmap="coolwarm")   # mapa de correlaciones
sns.pairplot(df)                             # scatter de todas las combinaciones
```

*Plotly — interactivo*
Para gráficas que el usuario puede explorar (zoom, hover, filtros):
```python
import plotly.express as px

fig = px.line(df, x="fecha", y="ventas", title="Ventas")
fig.show()

fig = px.scatter(df, x="col1", y="col2", color="categoria", hover_name="nombre")
fig.show()
```

**Recursos**
- Matplotlib gallery (ejemplos con código): https://matplotlib.org/stable/gallery/
- Seaborn tutorial: https://seaborn.pydata.org/tutorial.html
- Plotly Express docs: https://plotly.com/python/plotly-express/

**Ejercicios para validar que lo has asimilado**
1. Con el dataset de Titanic (o similar), crea: un histograma de edades, un boxplot de edad por clase de pasajero, y un scatter de edad vs tarifa coloreado por supervivencia.
2. Crea un mapa de correlaciones (heatmap) de un dataset con variables numéricas. Identifica cuáles están más correlacionadas.
3. Reproduce el mismo gráfico de barras en Matplotlib, Seaborn y Plotly. Observa las diferencias en código y resultado.

---

### 3c · Pandas avanzado (días 71, 73–74)

**Qué añade respecto a los básicos de la fase 2**
Aquí se trabaja con datos reales y más complejos: múltiples tablas que hay que combinar, series temporales, y análisis sobre datasets de verdad como el de LEGO o Google Trends.

**Conceptos clave a consolidar**

*Merge y join*
```python
# Equivalente a SQL JOIN
resultado = pd.merge(df1, df2, on="id_comun", how="inner")
# how: "inner", "left", "right", "outer"

# Concatenar DataFrames
df_total = pd.concat([df1, df2], ignore_index=True)
```

*Pivot tables y groupby avanzado*
```python
# Pivot table
tabla = df.pivot_table(values="ventas", index="categoria", columns="mes", aggfunc="sum")

# Groupby con múltiples columnas
df.groupby(["pais", "categoria"])["ventas"].agg(["sum", "mean", "count"])
```

*Series temporales*
```python
df["fecha"] = pd.to_datetime(df["fecha"])
df.set_index("fecha", inplace=True)

df.resample("M").sum()    # agrupar por mes
df.resample("W").mean()   # agrupar por semana
df["rolling_mean"] = df["ventas"].rolling(window=7).mean()   # media móvil
```

*Limpieza de datos (data cleaning)*
En la práctica los datos reales son sucios. Esto es lo que más tiempo toma en proyectos reales:
```python
df.isnull().sum()                          # contar nulos por columna
df.dropna(subset=["columna_critica"])      # eliminar filas con nulos en columnas clave
df["col"].fillna(df["col"].median())       # rellenar nulos con la mediana
df.drop_duplicates()                       # eliminar filas duplicadas
df["col"] = df["col"].str.strip().str.lower()   # limpiar strings
df["col"] = df["col"].astype(int)          # cambiar tipo
```

**Recursos**
- Pandas user guide (merging): https://pandas.pydata.org/docs/user_guide/merging.html
- Pandas time series guide: https://pandas.pydata.org/docs/user_guide/timeseries.html
- Dataset de práctica con series temporales: Google Trends data (descargable desde trends.google.com)

**Ejercicios para validar que lo has asimilado**
1. Descarga dos CSVs relacionados (por ejemplo, uno con ventas y otro con información de productos). Haz un merge, agrupa por categoría de producto y visualiza los resultados.
2. Con un dataset de series temporales (Google Trends, precios de bolsa en Kaggle), calcula la media móvil de 30 días y represéntala junto con la serie original.
3. Toma un dataset con datos sucios (nulos, duplicados, tipos incorrectos). Haz un pipeline de limpieza completo y documenta cada paso.

---

### 3d · Regresión lineal (días 77, 80)

**Por qué esto importa**
La regresión lineal es el modelo más simple de machine learning y el mejor punto de entrada para entender cómo funciona el aprendizaje supervisado: tienes datos etiquetados, entrenas un modelo, y lo usas para predecir. Todo lo que venga después (regresión logística, redes neuronales) sigue la misma lógica.

**Conceptos clave a consolidar**

*La idea matemática*
Una recta `y = mx + b` que minimiza la distancia entre las predicciones y los valores reales. En múltiples variables: `y = m1*x1 + m2*x2 + ... + b`. El algoritmo que encuentra los coeficientes óptimos se llama mínimos cuadrados ordinarios (OLS).

*Métricas de evaluación*
- MAE (Mean Absolute Error): error medio absoluto. Fácil de interpretar.
- MSE (Mean Squared Error): error cuadrático medio. Penaliza más los errores grandes.
- RMSE: raíz del MSE. En las mismas unidades que y.
- R² (coeficiente de determinación): qué porcentaje de la varianza explica el modelo. 1.0 = perfecto, 0 = no explica nada.

*Flujo estándar con scikit-learn*
```python
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, r2_score
import numpy as np

# 1. Separar features y target
X = df[["col1", "col2", "col3"]]   # features (variables independientes)
y = df["precio"]                    # target (variable a predecir)

# 2. Dividir en train/test
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# 3. Entrenar el modelo
model = LinearRegression()
model.fit(X_train, y_train)

# 4. Predecir
y_pred = model.predict(X_test)

# 5. Evaluar
print(f"RMSE: {np.sqrt(mean_squared_error(y_test, y_pred)):.2f}")
print(f"R²: {r2_score(y_test, y_pred):.4f}")

# Ver coeficientes
print(model.coef_)
print(model.intercept_)
```

**Recursos**
- Curso de Angela Yu, días 77 y 80.
- StatQuest — Linear Regression (YouTube, la mejor explicación visual que existe): buscar "StatQuest linear regression".
- Documentación de scikit-learn LinearRegression: https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LinearRegression.html

**Ejercicios para validar que lo has asimilado**
1. Con el dataset Boston Housing (o California Housing, disponible en scikit-learn), entrena una regresión lineal simple, evalúala con RMSE y R², y visualiza las predicciones vs los valores reales con un scatter plot.
2. Añade más features al modelo anterior. ¿Mejora o empeora? ¿Por qué?
3. Implementa regresión lineal desde cero (sin scikit-learn) usando solo NumPy y la fórmula de mínimos cuadrados. Verifica que obtienes los mismos coeficientes que scikit-learn.

---

### 3e · Scikit-learn básico

**Por qué esto importa**
Scikit-learn es el ecosistema estándar de machine learning en Python. Todos los modelos clásicos (regresión, clasificación, clustering) siguen la misma API: `fit`, `predict`, `score`. Entender esta API es la clave para poder explorar el resto de modelos sin confusión.

**Conceptos clave a consolidar**

*La API de scikit-learn*
Todo estimador en scikit-learn sigue el mismo patrón:
```python
from sklearn.algo_familia import NombreModelo

modelo = NombreModelo(hiperparametro=valor)  # instanciar
modelo.fit(X_train, y_train)                 # entrenar
predicciones = modelo.predict(X_test)         # predecir
score = modelo.score(X_test, y_test)          # evaluar (R² para regresión, accuracy para clasificación)
```

*Train/test split y por qué importa*
No se evalúa un modelo con los mismos datos con los que se entrenó. Eso es hacer trampa. Se separa un porcentaje (típicamente 20%) para test, se entrena solo con train, y se evalúa con test. La métrica en test es la que cuenta.

*Preprocesamiento*
Los datos crudos rara vez están listos para un modelo. Los pasos más comunes:
```python
from sklearn.preprocessing import StandardScaler, MinMaxScaler, LabelEncoder, OneHotEncoder

# Escalar features numéricas (muy importante para muchos modelos)
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)   # fit + transform en train
X_test_scaled = scaler.transform(X_test)          # solo transform en test (¡nunca fit_transform en test!)

# Codificar variables categóricas
from sklearn.preprocessing import OneHotEncoder
enc = OneHotEncoder(sparse=False)
X_encoded = enc.fit_transform(X[["categoria"]])
```

*Pipeline*
Encadena pasos de preprocesamiento y modelo para evitar data leakage:
```python
from sklearn.pipeline import Pipeline

pipe = Pipeline([
    ("scaler", StandardScaler()),
    ("model", LinearRegression())
])
pipe.fit(X_train, y_train)
pipe.predict(X_test)
```

*Modelos básicos que vale la pena conocer en este punto*
- `LinearRegression` — regresión continua.
- `LogisticRegression` — clasificación binaria o multiclase (a pesar del nombre, es un clasificador).
- `KNeighborsClassifier` — clasificación por vecinos cercanos, intuitivo para empezar.
- `DecisionTreeClassifier` / `DecisionTreeRegressor` — árbol de decisión, muy interpretable.

**Recursos**
- Documentación de scikit-learn (excelente, con ejemplos en cada página): https://scikit-learn.org/stable/user_guide.html
- Scikit-learn tutorials oficiales: https://scikit-learn.org/stable/tutorial/index.html

**Ejercicios para validar que lo has asimilado**
1. Con el dataset Iris (incluido en scikit-learn), entrena tres clasificadores distintos (KNN, Decision Tree, Logistic Regression), compara su accuracy en test y visualiza las matrices de confusión.
2. Repite el ejercicio anterior pero usando un Pipeline que incluya StandardScaler antes de cada modelo.
3. Explora cómo cambia el accuracy de KNN al variar el parámetro `n_neighbors` de 1 a 20. Representa el resultado en una gráfica.

---

## Fase 4 — CS50 AI

### 4a · Semana 0: Search

**Contexto**
Ya has visto esto. La semana 0 cubre algoritmos de búsqueda: DFS, BFS, búsqueda de costo uniforme, búsqueda en escalada (hill climbing) y A*. El objetivo aquí es consolidar lo que viste con más contexto y hacer los proyectos, no solo ver las clases.

**Conceptos clave a consolidar**
- Grafo de estados: nodo = estado del problema, arista = acción que lo transforma.
- Frontera (frontier): la estructura de datos que determina qué nodo explorar a continuación.
  - Pila (stack) → DFS.
  - Cola (queue) → BFS.
  - Cola de prioridad (priority queue) → búsqueda de costo uniforme y A*.
- Heurística en A*: función `h(n)` que estima el costo desde `n` hasta el objetivo. Debe ser admisible (nunca sobreestimar) para garantizar la solución óptima.
- Diferencia entre búsqueda no informada (BFS, DFS) e informada (A*).
- Minimax para juegos: árbol de decisiones donde un jugador maximiza y el otro minimiza. Alpha-beta pruning para hacerlo eficiente.

**Proyectos del curso en esta semana**
- Degrees (encontrar la distancia entre actores de Hollywood usando BFS).
- Tic-Tac-Toe con Minimax.

**Recursos**
- Material del curso: https://cs50.harvard.edu/ai/2020/weeks/0/
- Visualizador de algoritmos de búsqueda (PathFinding.js): https://qiao.github.io/PathFinding.js/visual/

**Ejercicios para validar que lo has asimilado**
1. Implementa BFS y DFS desde cero en Python (sin librerías externas) para resolver un laberinto representado como matriz 2D.
2. Implementa A* para el mismo laberinto usando distancia Manhattan como heurística.
3. Haz el proyecto Degrees del curso. Si ya lo hiciste, rehazlo sin mirar el código anterior.

---

### 4b · Semanas 1–2: Knowledge & Uncertainty

**Conceptos clave a consolidar**

*Knowledge (semana 1)*
- Lógica proposicional: proposiciones, conectivos (AND, OR, NOT, implicación, bicondicional), tablas de verdad.
- Inferencia: dado un conjunto de hechos y reglas, ¿qué podemos deducir?
- Algoritmo de resolución y model checking.
- Lógica de primer orden (primer contacto): cuantificadores universales y existenciales.

*Uncertainty (semana 2)*
- Probabilidad condicional: `P(A|B) = P(A ∩ B) / P(B)`.
- Regla de Bayes: `P(A|B) = P(B|A) * P(A) / P(B)`. Fundamental para razonamiento bajo incertidumbre.
- Redes bayesianas: grafos dirigidos donde los nodos son variables aleatorias y las aristas representan dependencias condicionales.
- Inferencia por enumeración y por muestreo (sampling).
- Modelos ocultos de Markov (HMM): secuencias donde el estado actual depende solo del anterior.

**Proyectos del curso en estas semanas**
- Knights (puzzle de lógica proposicional).
- Pagerank (implementar el algoritmo de Google con cadenas de Markov).
- Heredity (inferencia bayesiana sobre genes).

**Recursos**
- Material semana 1: https://cs50.harvard.edu/ai/2020/weeks/1/
- Material semana 2: https://cs50.harvard.edu/ai/2020/weeks/2/
- 3Blue1Brown — Bayes theorem (YouTube): la visualización más clara de la regla de Bayes que existe.

**Ejercicios para validar que lo has asimilado**
1. Implementa una tabla de verdad generadora para cualquier expresión proposicional dada como string.
2. Implementa la regla de Bayes para un problema clásico (diagnóstico médico: probabilidad de enfermedad dado un test positivo) y varía los parámetros para ver cómo cambia el resultado.
3. Haz los proyectos Knights y Heredity del curso.

---

### 4c · Semana 3: Optimization

**Conceptos clave a consolidar**
- Problemas de satisfacción de restricciones (CSP): variables, dominios, restricciones. Ejemplos: sudoku, coloración de mapas, horarios.
- Backtracking search para CSP.
- Heurísticas para CSP: MRV (Minimum Remaining Values), degree heuristic, least constraining value.
- Propagación de restricciones: arc consistency (AC-3).
- Búsqueda local: hill climbing, algoritmo de temple simulado (simulated annealing).
- Algoritmos genéticos: idea general, no implementación profunda.
- Programación lineal: formulación de problemas de optimización como sistemas de inecuaciones.

**Proyectos del curso en esta semana**
- Crossword (generar crucigramas usando CSP y backtracking).

**Recursos**
- Material semana 3: https://cs50.harvard.edu/ai/2020/weeks/3/
- Visualizador de hill climbing y simulated annealing: buscar "simulated annealing visualization" en YouTube.

**Ejercicios para validar que lo has asimilado**
1. Implementa un solucionador de sudoku usando backtracking con la heurística MRV.
2. Implementa hill climbing para encontrar el máximo de una función con múltiples máximos locales. Observa cómo queda atascado y cómo simulated annealing lo supera.
3. Haz el proyecto Crossword del curso.

---

### 4d · Semanas 4–5: Learning & Neural Networks

**Por qué esto importa**
Estas dos semanas son el corazón del curso y donde conecta todo lo que has construido en las fases anteriores. Aquí se introduce machine learning formal y las redes neuronales.

**Conceptos clave a consolidar**

*Learning (semana 4)*
- Aprendizaje supervisado vs no supervisado vs por refuerzo.
- Nearest neighbor classification.
- Regresión lineal y logística (desde la perspectiva de función de costo y gradiente descendente).
- Regularización: overfitting, underfitting, L1 y L2.
- Validación cruzada (k-fold cross-validation).
- Árboles de decisión e información ganada (information gain).
- Random Forest como ensemble de árboles.

*Neural Networks (semana 5)*
- Neurona artificial: suma ponderada + función de activación.
- Funciones de activación: sigmoid, ReLU, softmax.
- Forward propagation: cómo fluye la información hacia adelante.
- Backpropagation: cómo se actualizan los pesos usando la regla de la cadena y gradiente descendente.
- Arquitecturas: fully connected (dense), convolucional (CNN), recurrente (RNN) — introducción conceptual.
- TensorFlow/Keras: API de alto nivel para construir y entrenar redes.

```python
import tensorflow as tf
from tensorflow import keras

model = keras.Sequential([
    keras.layers.Dense(128, activation="relu", input_shape=(X_train.shape[1],)),
    keras.layers.Dropout(0.2),
    keras.layers.Dense(64, activation="relu"),
    keras.layers.Dense(10, activation="softmax")   # 10 clases
])

model.compile(optimizer="adam", loss="sparse_categorical_crossentropy", metrics=["accuracy"])
model.fit(X_train, y_train, epochs=20, validation_split=0.1)
model.evaluate(X_test, y_test)
```

**Proyectos del curso en estas semanas**
- Shopping (clasificar intención de compra con scikit-learn).
- Nim (aprendizaje por refuerzo en un juego).
- Traffic (reconocimiento de señales de tráfico con CNN y Keras).

**Recursos**
- Material semana 4: https://cs50.harvard.edu/ai/2020/weeks/4/
- Material semana 5: https://cs50.harvard.edu/ai/2020/weeks/5/
- 3Blue1Brown — Neural Networks series (YouTube): la introducción visual más clara a backpropagation.
- TensorFlow tutorials: https://www.tensorflow.org/tutorials

**Ejercicios para validar que lo has asimilado**
1. Implementa gradient descent desde cero en NumPy para ajustar una regresión lineal. Visualiza cómo el error decrece con las iteraciones.
2. Con Keras, construye una red neuronal para clasificar el dataset MNIST (dígitos escritos a mano). Consigue al menos 97% de accuracy en test.
3. Haz el proyecto Traffic del curso (CNN para clasificar señales de tráfico con el dataset GTSRB).

---

### 4e · Semana 6: Language

**Conceptos clave a consolidar**
- Procesamiento del lenguaje natural (NLP): el campo de la IA que trabaja con texto.
- Tokenización: dividir texto en unidades (palabras, subpalabras).
- N-gramas: secuencias de N palabras consecutivas. Usados en modelos de lenguaje estadísticos.
- Bag of Words (BoW): representación de texto como vector de frecuencias. Ignora el orden.
- TF-IDF: peso que pondera la frecuencia de una palabra en un documento relativa a su frecuencia en el corpus.
- Word embeddings: representación densa de palabras como vectores en un espacio de alta dimensión donde palabras similares están cerca. Word2Vec, GloVe.
- Transformers: arquitectura que domina el estado del arte en NLP desde 2017. Mecanismo de atención (attention), BERT, GPT.
- Librería NLTK para NLP clásico.
- Librería spaCy para NLP moderno.

```python
import nltk
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords

nltk.download("punkt")
nltk.download("stopwords")

texto = "El aprendizaje automático es fascinante y muy útil."
tokens = word_tokenize(texto.lower())
stop_words = set(stopwords.words("spanish"))
tokens_filtrados = [t for t in tokens if t not in stop_words and t.isalpha()]
```

**Proyectos del curso en esta semana**
- Parser (análisis sintáctico de oraciones con gramáticas formales).
- Questions (sistema de respuesta a preguntas usando TF-IDF).

**Recursos**
- Material semana 6: https://cs50.harvard.edu/ai/2020/weeks/6/
- The Illustrated Transformer (Jay Alammar): https://jalammar.github.io/illustrated-transformer/
- Hugging Face — la plataforma central del ecosistema NLP moderno: https://huggingface.co

**Ejercicios para validar que lo has asimilado**
1. Con NLTK, escribe un script que analice un texto (puedes usar un artículo de Wikipedia) y muestre las 20 palabras más frecuentes (excluyendo stopwords) junto con su frecuencia.
2. Implementa TF-IDF desde cero para un corpus pequeño (5-10 documentos) y encuentra qué palabras son más representativas de cada documento.
3. Haz los proyectos Parser y Questions del curso.

---

### 4f · Proyectos CS50 AI

**Por qué esto importa**
Los proyectos son lo que convierte el conocimiento pasivo en habilidad real. El CS50 AI tiene proyectos por cada semana, y aunque entregar todos sería lo ideal, el mínimo recomendado para poder decir que has hecho el curso de verdad es completar al menos uno por semana y entregar tres formalmente.

**Lista completa de proyectos**
- Semana 0: Degrees, Tic-Tac-Toe.
- Semana 1: Knights, Minesweeper.
- Semana 2: Pagerank, Heredity.
- Semana 3: Crossword.
- Semana 4: Shopping, Nim.
- Semana 5: Traffic.
- Semana 6: Parser, Questions.

**Cómo abordar cada proyecto**
1. Lee el enunciado completo antes de escribir una sola línea.
2. Identifica qué función o funciones tienes que implementar (el curso ya te da la estructura).
3. Escribe el algoritmo en pseudocódigo o en papel primero.
4. Implementa en Python.
5. Prueba con los casos de prueba del curso.
6. Si algo falla, usa el debugger, no prints aleatorios.

**Proyectos prioritarios si tienes que elegir tres**
Traffic (CNN, el más completo técnicamente), Nim (aprendizaje por refuerzo, el más interesante conceptualmente) y Degrees (BFS, el más claro para consolidar búsqueda).

---

## Notas generales

### Cómo saber que realmente has asimilado algo
La prueba definitiva no es entender la explicación del vídeo — es poder implementarlo desde cero sin mirar la solución. Si puedes hacer los ejercicios propuestos en cada sección sin necesidad de copiar código, has asimilado el concepto.

### Sobre los bloqueos
Son normales. La estrategia más efectiva ante un bloqueo: primero 20 minutos intentándolo solo, luego busca la documentación oficial (no Stack Overflow directo), luego busca el concepto en términos generales. Solo si después de todo eso sigues bloqueado, busca soluciones de otros. Y cuando las encuentres, ciérralas y escribe la tuya sin mirarlas.

### Sobre el ritmo
Las duraciones indicadas en cada fase son orientativas para alguien dedicando entre 1 y 2 horas diarias. Si un día no puedes, no pasa nada. Lo que sí importa es la consistencia semanal, no la diaria.

### Cómo integrar esto con Obsidian
Para cada tarjeta del Kanban que completes, considera crear una nota en Obsidian con: qué aprendiste, qué te costó más, el código de algún ejercicio que te resultó revelador, y enlaces a los recursos que más te ayudaron. Con el tiempo tendrás una base de conocimiento personal que vale más que cualquier curso.
