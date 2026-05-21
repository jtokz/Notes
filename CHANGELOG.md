---
tags: [type/reference]
---

# CHANGELOG — Refactorización del vault

**Fecha:** 2026-04-06
**Motivo:** Reorganización para mejorar el Graph view de Obsidian, añadir búsqueda por tags y crear estructura navegable con MOCs.

---

## Resumen de cambios

### 1. Nueva taxonomía de tags (frontmatter YAML)

Se abandonaron los tags inline (`#tag` en el cuerpo del texto) y se adoptó frontmatter YAML en todos los archivos. La taxonomía es:

```
lang/     → lenguaje: python, csharp, sql, javascript, gdscript
area/     → área temática: basics, oop, algorithms, ai, data, ui, tools, devops, game-dev
type/     → tipo de nota: concept, reference, project, course, config, moc
course/   → curso específico: 100days, cs50ai
```

---

### 2. Archivos creados

| Archivo | Descripción |
|---|---|
| `Home.md` | Nodo central del vault — mapa de todo el contenido, tabla de lenguajes, índice de tags |
| `py/index.md` | MOC de Python — links a todas las notas, organizadas por tema |
| `DOT_NET/index.md` | MOC de C#/.NET — links a todas las notas, organizadas por tema |

---

### 3. Archivos modificados — `py/`

| Archivo | Cambio |
|---|---|
| `Python basics.md` | Añadido frontmatter `[lang/python, area/basics, type/concept]` |
| `py_oop.md` | Añadido frontmatter `[lang/python, area/oop, type/concept]` |
| `py_tips.md` | Añadido frontmatter `[lang/python, area/basics, type/reference]` |
| `Modules.md` | Añadido frontmatter `[lang/python, area/basics, type/reference]` |
| `Random module.md` | Estaba vacío — añadido frontmatter y redirect a [[Modules]] |
| `Search Algorithms.md` | Añadido frontmatter `[lang/python, area/algorithms, area/ai, type/concept, course/cs50ai]` |
| `AI.md` | Añadido frontmatter `[lang/python, area/ai, type/concept, course/cs50ai]` |
| `100 Days of Code/Day 1.md` | Estaba vacío — añadido frontmatter y texto original recuperado |
| `Roadmap python/Roadmap Python IA.md` | Añadido tags dentro del frontmatter existente del Kanban |

---

### 4. Archivos modificados — `DOT_NET/`

Todos los archivos de esta carpeta tenían tags inline en la primera línea. Se eliminaron los inline tags y se añadió frontmatter YAML equivalente (con la nueva taxonomía). Además, los wikilinks de navegación que estaban en la primera línea se reformatearon como línea "**Ver también:**" más legible.

| Archivo | Tags anteriores → nuevos |
|---|---|
| `csharp basics.md` | `#csharp #oop #basics #dev` → `[lang/csharp, area/oop, area/basics, type/concept]` |
| `OOP Core.md` | `#oop #csharp` → `[lang/csharp, area/oop, type/concept]` |
| `Collections.md` | `#oop #object #csharp #collections` → `[lang/csharp, area/oop, type/concept]` |
| `Arrays.md` | `#basics #csharp #oop` → `[lang/csharp, area/basics, area/oop, type/concept]` |
| `Variables.md` | `#basics #datatypes` → `[lang/csharp, area/basics, type/concept]` |
| `String Manipulation.md` | `#basics #stringmethods` → `[lang/csharp, area/basics, type/reference]` |
| `Loops.md` | `#basics #loops` → `[lang/csharp, area/basics, type/concept]` |
| `Methods and control structures.md` | `#basics #csharp #methods` → `[lang/csharp, area/basics, type/concept]` |
| `Lambda Expressions.md` | `#Lambda` → `[lang/csharp, area/basics, type/concept]` |
| `WPF.md` | `#csharp` inline → `[lang/csharp, area/ui, type/concept]` |
| `Debugging.md` | `#csharp #basics #ide` → `[lang/csharp, area/basics, area/tools, type/reference]` |
| `Events & Delegates.md` | Sin tags → `[lang/csharp, area/basics, type/concept]` |
| `Linq.md` | Sin tags → `[lang/csharp, area/data, type/concept]` |
| `Csharp Generics.md` | Sin tags → `[lang/csharp, area/basics, type/concept]` |
| `SQL Server and Data Bases.md` | Sin tags → `[lang/sql, area/data, type/concept]` |
| `ChatGPT Enquiries.md` | Sin tags → `[lang/csharp, area/oop, type/reference]` |
| `Api & JSON.md` | Sin tags → `[lang/csharp, area/basics, type/concept]` |
| `Projects and Exercises/Currency Converter using an API.md` | Sin tags → `[lang/csharp, area/ui, type/project]` |

---

### 5. Archivos modificados — `General Development/`

| Archivo | Tags anteriores → nuevos |
|---|---|
| `General Concepts.md` | `#basics #dev` inline → `[area/basics, type/concept]` |
| `Clean Code.md` | Sin tags → `[area/basics, type/concept]` |
| `Standards.md` | Sin tags → `[area/basics, type/reference]` |
| `Tools.md` | Sin tags → `[area/tools, type/reference]` |
| `Syntax.md` | Sin tags → `[area/basics, type/reference]` |
| `Regular Expression Language.md` | `#dev #basics #csharp` inline → `[lang/csharp, area/basics, type/reference]` |
| `Personal wiki.md` | Tags inline en medio del texto → `[area/basics, type/moc]` frontmatter |
| `Claude Code CLI.md` | Sin tags → `[area/tools, type/reference]` |

---

### 6. Archivos modificados — carpetas menores

| Archivo | Tags anteriores → nuevos |
|---|---|
| `git/git.md` | `#basics #dev` inline → `[area/devops, type/reference]` |
| `Unix-Mac/Configurations.md` | Sin tags → `[area/tools, area/devops, type/config]` |
| `Web/Js.md` | Sin tags → `[lang/javascript, area/basics, type/concept]` |
| `GameDev_/Godot/Basics.md` | Sin tags → `[lang/gdscript, area/game-dev, type/concept]` |

---

## Qué mejorar a futuro

- [ ] Añadir wikilinks entre notas de Python (actualmente están aisladas entre sí)
- [ ] Desarrollar `General Development/Personal wiki.md` como verdadero índice de conceptos generales
- [ ] Reemplazar screenshots con bloques de código donde sea posible (pendiente del TODO.md original)
- [ ] Añadir notas de días individuales en `100 Days of Code/` a medida que avanza el curso
- [ ] Crear `GameDev_/index.md` si la sección de Godot vuelve a estar activa
