# memoria-claude

Memoria compartida de Claude Code entre sesiones y entornos.

- Cada proyecto en el que trabaja Claude se guarda como grafo de
  [graphify](https://github.com/Graphify-Labs/graphify) en `proyectos/<nombre>/`.
- `graphify/` contiene el grafo global que une todos los proyectos.
- `INDICE.md` lista los proyectos guardados.
- Cuando mencionas algo que ya hiciste, Claude busca aquí y en claude-mem.

Las reglas que sigue Claude están en `CLAUDE.md`.

Uso manual:

```bash
scripts/buscar.sh "autenticación"
scripts/guardar-proyecto.sh ~/mi-proyecto mi-proyecto "API de pedidos"
```

## Instalar en tu PC

```bash
git clone https://github.com/danielalejandromorenocarrillo-arch/memoria-claude ~/memoria-claude
bash ~/memoria-claude/scripts/instalar-pc.sh
```

El instalador pone graphify, añade la regla a `~/.claude/CLAUDE.md` y lo comprueba
todo, incluido claude-mem (solo lo revisa, no lo cambia).
