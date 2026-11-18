#!/usr/bin/env bash
# Guarda el grafo de graphify de un proyecto en la memoria y lo sube a GitHub.
# Uso: guardar-proyecto.sh <ruta-del-proyecto> [nombre] ["descripción corta"]
set -euo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="$HOME/.local/bin:$PATH"

RUTA="$(cd "${1:?Uso: guardar-proyecto.sh <ruta> [nombre] [descripción]}" && pwd)"
NOMBRE="${2:-$(basename "$(git -C "$RUTA" rev-parse --show-toplevel 2>/dev/null || echo "$RUTA")")}"
DESC="${3:-}"
DEST="$REPO/proyectos/$NOMBRE"

# Si no hay grafo (o el código cambió), actualiza la parte de código: local, sin LLM.
# El grafo completo con docs/PDFs se genera con /graphify desde Claude.
if [ ! -f "$RUTA/graphify-out/graph.json" ]; then
  graphify update "$RUTA"
else
  graphify update "$RUTA" || true
fi

mkdir -p "$DEST"
cp "$RUTA/graphify-out/graph.json" "$DEST/graph.json"
[ -f "$RUTA/graphify-out/GRAPH_REPORT.md" ] && cp "$RUTA/graphify-out/GRAPH_REPORT.md" "$DEST/GRAPH_REPORT.md"

ORIGEN="$(git -C "$RUTA" remote get-url origin 2>/dev/null | sed -E 's#https://[^@/]*@#https://#' || true)"
PREV_DESC=""
[ -f "$DEST/info.md" ] && PREV_DESC="$(sed -n 's/^- Descripción: //p' "$DEST/info.md")"
cat > "$DEST/info.md" <<EOF
# $NOMBRE
- Descripción: ${DESC:-${PREV_DESC:-(sin descripción)}}
- Repositorio: ${ORIGEN:-(sin remoto)}
- Ruta en la sesión: $RUTA
- Última actualización: $(date -u +%Y-%m-%dT%H:%MZ)
EOF

# Añadir/actualizar en el grafo global (~/.graphify -> este repo)
"$REPO/scripts/activar.sh" >/dev/null
graphify global add "$DEST/graph.json" --as "$NOMBRE"

# Índice legible
{
  echo "# Índice de proyectos"
  echo
  echo "| Proyecto | Descripción | Repositorio | Actualizado |"
  echo "|---|---|---|---|"
  for d in "$REPO"/proyectos/*/; do
    [ -f "$d/info.md" ] || continue
    n="$(basename "$d")"
    desc="$(sed -n 's/^- Descripción: //p' "$d/info.md")"
    rem="$(sed -n 's/^- Repositorio: //p' "$d/info.md")"
    upd="$(sed -n 's/^- Última actualización: //p' "$d/info.md")"
    echo "| [$n](proyectos/$n/GRAPH_REPORT.md) | $desc | $rem | $upd |"
  done
} > "$REPO/INDICE.md"

cd "$REPO"
git add -A
if git diff --cached --quiet; then
  echo "Sin cambios que guardar."
  exit 0
fi
git commit -qm "Memoria: actualizar $NOMBRE"
"$REPO/scripts/subir.sh"
echo "Guardado: $NOMBRE"
