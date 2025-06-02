#!/usr/bin/env bash
set -euo pipefail

ROOT="$(pwd)/scFates"
REF_DIR="$ROOT/data/reference/GRCh38"
mkdir -p "$REF_DIR"

echo "Downloading genome FASTA..."
wget -c https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_42/GRCh38.primary_assembly.genome.fa.gz -O "$REF_DIR/genome.fa.gz"
echo "Decompressing FASTA..."
gunzip -c "$REF_DIR/genome.fa.gz" > "$REF_DIR/GRCh38.primary_assembly.genome.fa"

echo "Downloading GTF..."
wget -c https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_42/gencode.v42.annotation.gtf.gz -O "$REF_DIR/annotations.gtf.gz"
echo "Decompressing GTF..."
gunzip -c "$REF_DIR/annotations.gtf.gz" > "$REF_DIR/gencode.v42.annotation.gtf"

echo "Reference download complete."
