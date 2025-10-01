#!/bin/bash

# --- Flutter Screen Generator ---
# This script scaffolds a standard directory structure for a new screen.
# Usage: ./create_screen.sh <ScreenName>
# Example: ./create_screen.sh home

# Exit immediately if a command exits with a non-zero status.
set -e

# 1. Validate Input
# Check if a screen name was provided as an argument.
if [ -z "$1" ]; then
  echo "❌ Error: No screen name supplied."
  echo "   Usage: ./create_screen.sh <ScreenName>"
  exit 1
fi

# 2. Set Up Variables
# Convert the screen name to lowercase to follow Dart conventions (e.g., Home -> home).
SCREEN_NAME=$(echo "$1" | tr '[:upper:]' '[:lower:]')

# Define the directory and file paths.
BASE_DIR="lib/screens/$SCREEN_NAME"
CONTROLLERS_DIR="$BASE_DIR/controllers"
WIDGETS_DIR="$BASE_DIR/widgets"
DART_FILE="$BASE_DIR/${SCREEN_NAME}_screen.dart"

# 3. Create Directory and File Structure
echo "🚀 Creating structure for '$SCREEN_NAME' screen..."

# Create the primary screen directory and its subdirectories.
# The `-p` flag ensures that parent directories are created if they don't exist.
mkdir -p "$CONTROLLERS_DIR"
mkdir -p "$WIDGETS_DIR"

# Create the main screen Dart file.
touch "$DART_FILE"

# Create placeholder files in the new directories for Git tracking.
touch "$CONTROLLERS_DIR/init.dart"
touch "$WIDGETS_DIR/init.dart"

# 4. Final Confirmation
echo "✅ Done! Screen structure created at '$BASE_DIR'"
echo "   - lib/screens/$SCREEN_NAME/"
echo "     - controllers/init.dart"
echo "     - widgets/init.dart"
echo "     - ${SCREEN_NAME}_screen.dart"
