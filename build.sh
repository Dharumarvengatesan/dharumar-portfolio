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

# Note: --web-renderer was removed in Flutter 3.22+. CanvasKit is the default renderer.
flutter build web --release
