#!/usr/bin/env bash
# Copyright The Phorepoc Authors
# SPDX-License-Identifier: Apache-2.0
#
# sis.sh -- the pdk's package.yml runs it after prebuild: ov5640_af.bin as $PHOREPOC_BUILD/sis/ov5640-firmware-arm.sis,
# installed to \resource\firmware\ov5640_af.bin (where the camera driver's firmware request looks), with NOTICE.
set -eu
REPO=$(cd "$(dirname "$0")/.." && pwd)
B=${PHOREPOC_BUILD:-$REPO/build}
FW=$B/ov5640-firmware/ov5640_af.bin
[ -f "$FW" ] || { echo "sis.sh: no $FW (run recipes/fetch.sh)"; exit 1; }
mkdir -p "$B/sis"
python3 "$PHOREPOC_PDK/tools/make_sis.py" --unsigned --version "${PHOREPOC_PACKAGE_VERSION:-1.0.0}" \
  --name "OV5640 autofocus firmware" --vendor Phorepoc \
  --file "$FW=!:/resource/firmware/ov5640_af.bin" \
  --file "$REPO/NOTICE=!:/resource/firmware/ov5640_af.NOTICE.txt" \
  --out "$B/sis/ov5640-firmware-arm.sis"
