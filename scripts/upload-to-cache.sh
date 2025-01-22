#!/usr/bin/env bash

set -eu
set -f # disable globbing
export IFS=' '

echo "Uploading paths" $OUT_PATHS

exec nix copy --to "https://ivvil.cachix.org" $OUT_PATHS

