#!/usr/bin/env bash
set -euo pipefail

ROOT="$(pwd)/scFates"
STAR_INDEX="$ROOT/data/reference/GRCh38/STAR_index"
mkdir -p "$STAR_INDEX"

echo "Building STAR index..."
STAR --runMode genomeGenerate \
     --runThreadN 8 \
     --genomeDir "$STAR_INDEX" \
     --genomeFastaFiles "$ROOT/data/reference/GRCh38/GRCh38.primary_assembly.genome.fa" \
     --sjdbGTFfile "$ROOT/data/reference/GRCh38/gencode.v42.annotation.gtf" \
     --sjdbOverhang 100

echo "STAR index built at $STAR_INDEX"
