#!/usr/bin/env bash

# ==============================================================================
# dev-toolkit Bootstrap Script
# Requires: chmod +x scripts/bootstrap.sh
# Usage: ./scripts/bootstrap.sh /path/to/target-project
# Description: Copies workflow templates and configs into a target repository.
# ==============================================================================

set -e

# Resolve directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLKIT_ROOT="$(dirname "$SCRIPT_DIR")"

TARGET_DIR="$1"

if [ -z "$TARGET_DIR" ]; then
  echo "Error: Target directory is required."
  echo "Usage: $0 <path-to-target-repo>"
  exit 1
fi

# Expand path and ensure target exists
TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd || echo "$TARGET_DIR")"

if [ ! -d "$TARGET_DIR" ]; then
  echo "[+] Creating target directory: $TARGET_DIR"
  mkdir -p "$TARGET_DIR"
fi

echo "=================================================="
echo " Bootstrapping dev-toolkit into: $TARGET_DIR"
echo "=================================================="

# 1. Create directory structure in target
mkdir -p "$TARGET_DIR/.github/workflows"

# 2. Copy GitHub Action Workflows
echo "[+] Copying GitHub Action workflows..."
if [ -f "$TOOLKIT_ROOT/.github/workflows/capture-preview.yml" ]; then
  cp "$TOOLKIT_ROOT/.github/workflows/capture-preview.yml" "$TARGET_DIR/.github/workflows/"
  echo "    - capture-preview.yml copied."
fi

if [ -f "$TOOLKIT_ROOT/.github/workflows/deploy.yml" ]; then
  cp "$TOOLKIT_ROOT/.github/workflows/deploy.yml" "$TARGET_DIR/.github/workflows/"
  echo "    - deploy.yml copied."
fi

# 3. Copy Standard Configs
echo "[+] Copying default configurations..."
if [ -f "$TOOLKIT_ROOT/configs/.editorconfig" ]; then
  cp "$TOOLKIT_ROOT/configs/.editorconfig" "$TARGET_DIR/.editorconfig"
  echo "    - .editorconfig copied."
fi

# 4. Initialize Git if not already a repository
if [ ! -d "$TARGET_DIR/.git" ]; then
  echo "[+] Target is not a git repo. Initializing git..."
  git -C "$TARGET_DIR" init
fi

echo "=================================================="
echo " Bootstrap Complete! Next steps:"
echo " 1. cd $TARGET_DIR"
echo " 2. Verify settings in .github/workflows/"
echo " 3. Commit initial bootstrap files"
echo "=================================================="