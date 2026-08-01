#!/bin/bash
set -e

# Install Flutter (stable)
export FLUTTER_ROOT="/opt/flutter"
if [ ! -d "$FLUTTER_ROOT" ]; then
  git clone https://github.com/flutter/flutter.git --branch stable --depth 1 "$FLUTTER_ROOT"
fi

export PATH="$FLUTTER_ROOT/bin:$PATH"

# Suppress analytics and accept licenses non-interactively
flutter config --no-analytics --enable-web

flutter pub get

# Use --wasm (Skwasm renderer) for faster multi-threaded rendering.
# Requires COOP + COEP headers (set in vercel.json) to enable SharedArrayBuffer.
# Falls back to CanvasKit automatically if headers are missing.
flutter build web --release --wasm
