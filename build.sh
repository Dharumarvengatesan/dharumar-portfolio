#!/bin/bash
set -e

# Install Flutter
export FLUTTER_ROOT="/opt/flutter"
if [ ! -d "$FLUTTER_ROOT" ]; then
  git clone https://github.com/flutter/flutter.git --branch stable --depth 1 "$FLUTTER_ROOT"
fi

export PATH="$FLUTTER_ROOT/bin:$PATH"

flutter config --enable-web
flutter pub get
flutter build web --release --web-renderer canvaskit
