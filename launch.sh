#!/usr/bin/env bash

set -euo pipefail

GAME_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

CACHE_DIR="$GAME_DIR/cache"
SAVE_DIR="$GAME_DIR/save"
CONFIG="$GAME_DIR/ruffle.conf"

GRAPHICS_BACKEND="auto"

if [[ -f "$CONFIG" ]]; then
    # shellcheck disable=SC1090
    source "$CONFIG"
fi

ARGS=(
    --power high
    --no-gui
    --filesystem-access-mode allow
    --frame-rate 30
    --cache-directory "$CACHE_DIR"
    --save-directory "$SAVE_DIR"
    --quality low
    --gamemode on
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

cd "$GAME_DIR"

exec "$GAME_DIR/ruffle" "${ARGS[@]}" "$GAME_DIR/data/run"