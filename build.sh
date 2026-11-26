#!/usr/bin/env bash
# Builds the installable mod zip from the mod folder.
# Usage: ./build.sh [MOD_FOLDER]
# With no argument it uses the first folder next to this script that contains a modDesc.xml,
# so the same script works unchanged in any FS25 mod repo.
set -euo pipefail

cd "$(dirname "$0")"

if [[ $# -ge 1 ]]; then
    MOD_DIR="${1%/}"
else
    MOD_DIR="$(dirname "$(ls -d */modDesc.xml 2>/dev/null | head -n 1)")"
fi

if [[ -z "$MOD_DIR" || "$MOD_DIR" == "." || ! -f "$MOD_DIR/modDesc.xml" ]]; then
    echo "error: no mod folder with a modDesc.xml found" >&2
    exit 1
fi

ZIP="$MOD_DIR.zip"
VERSION="$(sed -n 's:.*<version>\(.*\)</version>.*:\1:p' "$MOD_DIR/modDesc.xml" | head -n 1)"

rm -f "$ZIP"
(cd "$MOD_DIR" && zip -r -q -X "../$ZIP" . -x '*.DS_Store' '*Thumbs.db' '*.git*' '*~')

echo "Built $ZIP (version ${VERSION:-unknown})"
unzip -l "$ZIP" | tail -n +4 | head -n -2 | awk '{print "  " $4}'
