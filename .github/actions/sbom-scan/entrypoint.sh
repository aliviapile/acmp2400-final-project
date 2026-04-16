#!/bin/sh
set -e

echo "Generating SBOM..."
syft dir:. -o json > sbom.json

echo "Scanning SBOM..."
grype sbom:sbom.json --fail-on critical

echo "SBOM scan passed."
