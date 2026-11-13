#!/usr/bin/env bash
# Copyright The Phorepoc Authors
# SPDX-License-Identifier: Apache-2.0
#
# fetch.sh -- downloads the files in sources.lock to $PHOREPOC_BUILD/ov5640-firmware/ and checks each SHA-512.
set -eu
REPO=$(cd "$(dirname "$0")/.." && pwd)
OUT=${PHOREPOC_BUILD:-$REPO/build}/ov5640-firmware
mkdir -p "$OUT"
grep -v '^#' "$REPO/sources.lock" | while IFS=$'\t' read -r name file sum url; do
  [ -n "$name" ] || continue
  curl -fsSL -o "$OUT/$file.part" "$url"
  got=$(sha512sum "$OUT/$file.part" | cut -d' ' -f1)
  [ "$got" = "$sum" ] || { echo "fetch.sh: $file: SHA-512 mismatch ($got)"; exit 1; }
  mv "$OUT/$file.part" "$OUT/$file"
  echo "fetched $file"
done
