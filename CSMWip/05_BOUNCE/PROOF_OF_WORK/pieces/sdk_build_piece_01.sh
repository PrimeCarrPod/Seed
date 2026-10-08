#!/bin/bash
# ============================================================
# build.sh — No-Gradle APK Build for Bounce v1.0.92
# Bluetooth 3D Spatial RSSI Tracking — EKF Bug Fix (vy init)
# Pipeline: aapt2 compile → aapt2 link → javac → d8 → zipalign → apksigner
# ============================================================
set -e

PACKAGE="com.carrpod.bounce"
APP_NAME="Bounce"
VERSION_CODE=192
VERSION_NAME="1.0.92"
COMPILE_SDK=33
TARGET_SDK=33
MIN_SDK=24
BUILD_TOOLS_VERSION="33.0.1"

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$PROJECT_DIR/src/main"
GEN_DIR="$PROJECT_DIR/gen"
OBJ_DIR="$PROJECT_DIR/obj"
OUT_DIR="$PROJECT_DIR/out"
