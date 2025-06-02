#!/usr/bin/env bash
set -euo pipefail

ROOT="$(pwd)/scFates"
FASTQ_DIR="$ROOT/data/E-MTAB-6149/fastq"
STAR_INDEX="$ROOT/data/reference/GRCh38/STAR_index"
OUT_DIR="$ROOT/results/STARsolo/BT1A"
mkdir -p "$OUT_DIR"

echo "Running STARsolo..."
STAR --runThreadN 8 \
     --genomeDir "$STAR_INDEX" \
     --readFilesIn "$FASTQ_DIR/BT1A.R2.fastq.gz" "$FASTQ_DIR/BT1A.R1.fastq.gz" \
     --readFilesCommand zcat \
     --outFileNamePrefix "$OUT_DIR/" \
     --soloType CB_UMI_Simple \
     --soloCBlen 16,0 \
     --soloUMIlen 12,0 \
     --soloCBstart 1,0 \
     --soloUMIstart 17,0 \
     --soloFeatures Gene

echo "STARsolo results available at $OUT_DIR/Solo.out/Gene"
