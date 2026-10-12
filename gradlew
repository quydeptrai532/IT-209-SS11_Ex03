#!/bin/sh
set -eu
BASE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
VERSION=8.14.3
INSTALL_DIR="${GRADLE_USER_HOME:-$HOME/.gradle}/bootstrap/gradle-$VERSION"
if [ ! -x "$INSTALL_DIR/bin/gradle" ]; then
  mkdir -p "$(dirname "$INSTALL_DIR")"
  ARCHIVE="$(dirname "$INSTALL_DIR")/gradle-$VERSION-bin.zip"
  if command -v curl >/dev/null 2>&1; then
    curl -fL --retry 3 "https://services.gradle.org/distributions/gradle-$VERSION-bin.zip" -o "$ARCHIVE"
  else
    wget -O "$ARCHIVE" "https://services.gradle.org/distributions/gradle-$VERSION-bin.zip"
  fi
  unzip -qo "$ARCHIVE" -d "$(dirname "$INSTALL_DIR")"
  rm -f "$ARCHIVE"
fi
exec "$INSTALL_DIR/bin/gradle" -p "$BASE_DIR" "$@"
