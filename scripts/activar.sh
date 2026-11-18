#!/usr/bin/env bash
# Prepara esta sesión para usar la memoria de proyectos:
# - instala graphify si falta
# - hace que el grafo global de graphify (~/.graphify) viva dentro de este repo
set -euo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="$HOME/.local/bin:$PATH"

if ! command -v graphify >/dev/null 2>&1; then
  uv tool install graphifyy >/dev/null
  graphify install >/dev/null
fi

mkdir -p "$REPO/graphify"
if [ -e "$HOME/.graphify" ] && [ ! -L "$HOME/.graphify" ]; then
  # Conserva lo que hubiera en ~/.graphify antes de enlazarlo
  cp -rn "$HOME/.graphify/." "$REPO/graphify/" 2>/dev/null || true
  rm -rf "$HOME/.graphify"
fi
ln -sfn "$REPO/graphify" "$HOME/.graphify"

echo "Memoria activada: $REPO"
echo "Proyectos guardados:"
ls -1 "$REPO/proyectos" 2>/dev/null | sed 's/^/  - /' || true
