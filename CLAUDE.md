# Memoria de proyectos (graphify + claude-mem)

Este repositorio es la memoria compartida entre todas las sesiones y entornos de
Claude Code del usuario. Guarda el grafo de graphify de cada proyecto trabajado.
Responde al usuario en español.

## Estructura
- `INDICE.md`: lista de proyectos guardados, con descripción y repositorio.
- `proyectos/<nombre>/`: `graph.json`, `GRAPH_REPORT.md` e `info.md` de cada proyecto.
- `graphify/`: grafo global de graphify con todos los proyectos unidos
  (`~/.graphify` se enlaza aquí con `scripts/activar.sh`).
- `scripts/`: `activar.sh`, `buscar.sh`, `guardar-proyecto.sh`, `subir.sh`.

## Regla 1: cuando el usuario se refiera a algo que ya hizo
Siempre que mencione trabajo anterior ("lo que hice en...", "como en el proyecto de...",
"la función que hicimos...", "¿te acuerdas de...?"), aunque sea de otro entorno:
1. Actualiza la memoria (`git pull -q` en este repositorio), ejecuta
   `scripts/activar.sh` y lee `INDICE.md`.
2. Ejecuta `scripts/buscar.sh "<términos clave>"` (añade el nombre del proyecto
   como segundo argumento si lo sabes). Para más detalle usa `graphify explain`,
   `graphify path` o `graphify query` con `--graph proyectos/<nombre>/graph.json`,
   y lee `proyectos/<nombre>/GRAPH_REPORT.md`.
3. Si claude-mem está disponible, consúltalo también (sus herramientas MCP de
   búsqueda o `claude-mem search "<términos>"`) para saber qué se hizo, cuándo y
   por qué. graphify dice cómo está hecho el código; claude-mem, la historia.
   Solo lectura: no cambies la instalación ni la configuración de claude-mem.
4. Si necesitas el código real, mira `info.md`: la ruta local del proyecto o su
   repositorio (clónalo si no está en esta máquina).
5. Responde combinando lo encontrado y di de qué proyecto sale cada cosa.
   Si no hay nada guardado, dilo; no inventes.

## Regla 2: guardar cada proyecto en el que trabajes
Después de crear o cambiar código de forma relevante en un proyecto (y antes de
dar el trabajo por terminado):
1. Si el proyecto no tiene `graphify-out/` o tiene docs/PDFs importantes, genera
   el grafo completo con `/graphify <ruta>`.
2. Ejecuta `scripts/guardar-proyecto.sh <ruta> [nombre] "descripción de una línea"`.
   Hace commit y push a este repositorio.
3. Si el push falla, díselo al usuario: la memoria de esa sesión se perderá.

No guardes secretos (claves, tokens, .env) en este repositorio.
