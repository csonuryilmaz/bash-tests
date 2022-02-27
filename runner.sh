#!/usr/bin/env bash

set -euo pipefail

for f in test_*.sh; do
  echo "Testing $f"
  echo ""
  bash "$f" || break
  echo ""
done
