#!/usr/bin/env bash
# Sube la memoria a GitHub, integrando antes lo que hayan subido otras sesiones.
set -uo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"
RAMA="$(git branch --show-current)"
for intento in 1 2 3 4; do
  git pull -q --rebase -X theirs origin "$RAMA" 2>/dev/null || true
  if git push -q -u origin "$RAMA"; then
    exit 0
  fi
  sleep $((2 ** intento))
done
echo "ERROR: no se pudo subir la memoria a GitHub." >&2
exit 1
