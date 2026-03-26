#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="test"

shopt -s nullglob

for dir in "$BASE_DIR"/*/; do
    dirname=$(basename "$dir")
    fecha="$dirname"
    echo "Procesando carpeta $dir con fecha $fecha"

        # Recorre ficheros dentro de la carpeta
        for f in "$dir"*.*; do
            [[ -e "$f" ]] || continue
            touch -d "$fecha 12:00:00" "$f"
        done
done
