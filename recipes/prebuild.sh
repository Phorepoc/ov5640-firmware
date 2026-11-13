#!/usr/bin/env bash
# Copyright The Phorepoc Authors
# SPDX-License-Identifier: Apache-2.0
# prebuild.sh -- the pdk's package.yml runs it first: fetch the firmware file (nothing is compiled here).
exec "$(dirname "$0")/fetch.sh"
