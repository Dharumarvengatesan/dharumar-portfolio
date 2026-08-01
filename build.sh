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

# Build with CanvasKit (default, most compatible renderer).
# --wasm (Skwasm) was removed because it requires COOP/COEP headers
# and was causing flutter-first-frame to never fire on Vercel.
flutter build web --release
