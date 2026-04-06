---
tags: [area/tools, type/reference]
---

# Claude Code CLI

> Claude directamente en la terminal, con acceso real al filesystem, shell y git.

## ¿Qué puede hacer que la web no puede?

| Capacidad | CLI | Web |
|---|---|---|
| Leer/escribir archivos | ✅ | ❌ |
| Ejecutar comandos shell | ✅ | ❌ |
| Commits y operaciones git | ✅ | ❌ |
| Trabajar sobre un repo completo | ✅ | ❌ |
| Memoria persistente entre sesiones | ✅ | ❌ |
| Subagentes especializados | ✅ | ❌ |

## Comandos útiles dentro de la sesión

```
/clear        — limpia el historial de conversación (no borra la memoria en disco)
/help         — lista todos los comandos disponibles
/fast         — activa modo rápido (mismo modelo, output más veloz)
! <comando>   — ejecuta el comando tú directamente en el shell
```

## Sistema de memoria

Claude Code guarda contexto persistente en:
```
~/.claude/projects/<ruta-del-proyecto>/memory/
```

- `MEMORY.md` — índice, siempre cargado en cada sesión
- Archivos `.md` individuales — detalles cargados cuando son relevantes

Para guardar algo entre sesiones: pedirle explícitamente "guarda esto".

## CLAUDE.md

Si creas un archivo `CLAUDE.md` en cualquier directorio, Claude lo lee automáticamente al trabajar en ese directorio. Útil para instrucciones específicas de proyecto:

```markdown
# CLAUDE.md
- Siempre usar type hints en Python
- No crear archivos de prueba fuera de /tests
- El entorno virtual está en .venv/
```

## Tips de uso

- Ser específico en los pedidos reduce tokens y mejora resultados
- Para tareas largas, describe el objetivo final, no solo el paso inmediato
- Puedes aprobar o denegar cada acción antes de que se ejecute
- Los subagentes que Claude lanza también consumen tokens — tenerlo en cuenta

## Modelos disponibles (2026)

| Modelo | ID |
|---|---|
| Claude Opus 4.6 | `claude-opus-4-6` |
| Claude Sonnet 4.6 | `claude-sonnet-4-6` |
| Claude Haiku 4.5 | `claude-haiku-4-5-20251001` |

---
*Creado el 2026-04-06 — primera sesión con Claude Code CLI*
