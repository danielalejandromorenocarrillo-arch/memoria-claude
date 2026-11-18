#!/usr/bin/env bash
# Instala y verifica la memoria de proyectos en tu PC (macOS, Linux o Git Bash en Windows).
# Uso (desde la carpeta del repo clonado):  bash scripts/instalar-pc.sh
# No modifica claude-mem: solo comprueba su estado.
set -uo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="$HOME/.local/bin:$PATH"
OK=0; FALLOS=0
ok()   { echo "  [OK]    $1"; OK=$((OK+1)); }
mal()  { echo "  [FALLO] $1"; FALLOS=$((FALLOS+1)); }

echo "== 1. graphify =="
if ! command -v graphify >/dev/null 2>&1; then
  if command -v uv >/dev/null 2>&1; then uv tool install graphifyy
  elif command -v pipx >/dev/null 2>&1; then pipx install graphifyy
  else mal "Falta uv o pipx. Instala uv: https://docs.astral.sh/uv/ y repite."; fi
else
  (uv tool upgrade graphifyy >/dev/null 2>&1 || pipx upgrade graphifyy >/dev/null 2>&1) || true
fi
if command -v graphify >/dev/null 2>&1; then
  ok "graphify $(graphify --version 2>&1 | awk '{print $2}') instalado"
  graphify install >/dev/null 2>&1 && ok "skill /graphify registrada en Claude Code" || mal "graphify install falló"
fi

echo "== 2. Regla global en ~/.claude/CLAUDE.md =="
mkdir -p "$HOME/.claude"
if grep -q "Memoria de proyectos" "$HOME/.claude/CLAUDE.md" 2>/dev/null; then
  ok "la regla ya estaba"
else
  cat >> "$HOME/.claude/CLAUDE.md" <<EOF

# Memoria de proyectos (graphify + claude-mem)
La memoria de todos los proyectos del usuario está en $REPO
(repositorio privado danielalejandromorenocarrillo-arch/memoria-claude).
Siempre que el usuario se refiera a algo que ya hizo antes (en esta u otra sesión,
en este u otro proyecto), y antes de dar por terminado un trabajo de código:
lee y sigue $REPO/CLAUDE.md (antes ejecuta: git -C "$REPO" pull -q).
Busca con graphify (scripts/buscar.sh), consulta también claude-mem y guarda
los proyectos trabajados con scripts/guardar-proyecto.sh.
EOF
  ok "regla añadida"
fi

echo "== 3. Memoria (repositorio) =="
git -C "$REPO" pull -q 2>/dev/null && ok "repositorio actualizado desde GitHub" || mal "no se pudo hacer git pull"
"$REPO/scripts/activar.sh" >/dev/null 2>&1 && ok "grafo global enlazado (~/.graphify -> $REPO/graphify)" || mal "activar.sh falló"
git -C "$REPO" push --dry-run -q 2>/dev/null && ok "permiso de subida a GitHub" || mal "sin permiso para subir a GitHub (revisa tu login de git)"

echo "== 4. Prueba de graphify (proyecto temporal, no se guarda) =="
T="$(mktemp -d)"
printf 'def pagar(x):\n    return validar(x)\ndef validar(x):\n    return x > 0\n' > "$T/demo.py"
if graphify update "$T" >/dev/null 2>&1 && graphify query "pagar" --graph "$T/graphify-out/graph.json" 2>/dev/null | grep -q "validar"; then
  ok "graphify construye y consulta grafos"
else
  mal "graphify no pudo construir/consultar un grafo de prueba"
fi
rm -rf "$T"

echo "== 5. claude-mem (solo comprobación) =="
if command -v claude-mem >/dev/null 2>&1 || [ -d "$HOME/.claude-mem" ]; then
  if npx -y claude-mem status 2>/dev/null | grep -qi "pid\|running\|port"; then
    ok "claude-mem instalado y su servicio responde"
  else
    mal "claude-mem instalado pero el servicio no responde (prueba: npx claude-mem doctor)"
  fi
else
  mal "claude-mem no está instalado en esta PC"
fi

echo
echo "Resultado: $OK correctos, $FALLOS con fallo."
