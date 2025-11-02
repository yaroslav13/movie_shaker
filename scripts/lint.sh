#!/bin/bash

set -e

echo "--- Running Formatter ---"
fvm dart format --set-exit-if-changed .

echo "--- Running Analyzer ---"

if [ -n "$DCM_CI_KEY" ] && [ -n "$DCM_EMAIL" ]; then
  echo "CI variables found. Running with CI credentials."
  dcm analyze --ci-key="$DCM_CI_KEY" --email="$DCM_EMAIL" .
else
  echo "No CI variables found. Running locally."
  dcm analyze .
fi

echo "--- Script finished successfully ---"