#!/bin/bash
set -e

# Repo root (scripts/ -> ..)
cd "$(dirname "$0")/.."

OUTPUT="./bin/droneview-simulator"
SOURCES="Sources/main.swift"

mkdir -p bin

FRAMEWORKS=(
    -framework Metal
    -framework MetalKit
    -framework AppKit
    -framework QuartzCore
    -framework Foundation
    -framework AVFoundation
)

echo "🔨 Building droneview-simulator..."
echo "   Source: $SOURCES"
echo "   Output: $OUTPUT"

swiftc \
    -o "$OUTPUT" \
    "$SOURCES" \
    "${FRAMEWORKS[@]}" \
    -O \
    -swift-version 5

echo "✅ Build complete: $OUTPUT"
echo ""
echo "Run with: ./bin/droneview-simulator"
