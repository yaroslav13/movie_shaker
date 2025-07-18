set -e

fvm dart format --set-exit-if-changed .
fvm flutter analyze .
fvm flutter pub run dart_code_metrics:metrics analyze .

fvm flutter pub run dart_code_metrics:metrics check-unused-files .
