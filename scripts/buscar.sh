#!/usr/bin/env bash
# Busca algo en la memoria de proyectos anteriores.
# Uso: buscar.sh "qué buscar" [proyecto]
#   Sin proyecto: busca en el grafo global (todos los proyectos).
#   Con proyecto: busca solo en ese proyecto.
set -uo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="$HOME/.local/bin:$PATH"
Q="${1:?Uso: buscar.sh \"qué buscar\" [proyecto]}"
P="${2:-}"

"$REPO/scripts/activar.sh" >/dev/null

echo "=== Proyectos que mencionan \"$Q\" (índice e informes) ==="
grep -ril -- "$Q" "$REPO"/INDICE.md "$REPO"/proyectos/*/info.md "$REPO"/proyectos/*/GRAPH_REPORT.md 2>/dev/null \
  | sed -E "s#$REPO/proyectos/([^/]+)/.*#\1#; s#$REPO/INDICE.md#(índice)#" | sort -u | sed 's/^/  - /'

if [ -n "$P" ]; then
  G="$REPO/proyectos/$P/graph.json"
else
  G="$REPO/graphify/global-graph.json"
fi
echo
echo "=== graphify query ($( [ -n "$P" ] && echo "proyecto $P" || echo "todos los proyectos")) ==="
if [ -f "$G" ]; then
  graphify query "$Q" --graph "$G" || true
else
  echo "  (todavía no hay grafos guardados)"
fi
