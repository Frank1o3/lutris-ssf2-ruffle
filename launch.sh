#!/usr/bin/env bash
set -euo pipefail

GAME_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$GAME_DIR/ruffle.conf"

GRAPHICS_BACKEND="auto"

if [[ -f "$CONFIG" ]]; then
    # shellcheck disable=SC1090
    source "$CONFIG"
fi

ARGS=(
    --power high
    --gamemode on
    --base "$GAME_DIR"
    --filesystem-access-mode allow
)

case "${GRAPHICS_BACKEND:-auto}" in
    vulkan)
        ARGS+=(--graphics vulkan)
        ;;
    gl)
        ARGS+=(--graphics gl)
        ;;
    auto)
        ;;
    *)
        echo "Invalid Ruffle graphics backend: ${GRAPHICS_BACKEND}" >&2
        exit 1
        ;;
esac

exec "$GAME_DIR/ruffle" "${ARGS[@]}" "$GAME_DIR/data/run"