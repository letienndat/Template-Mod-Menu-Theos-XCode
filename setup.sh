#!/bin/bash

ZIP_NAME="Tweak Menu dylib.xctemplate.zip"
EXTRACTED_FOLDER="Tweak Menu dylib.xctemplate"
DEST_DIR="$HOME/Library/Developer/Xcode/Templates/Project Templates/iOS/GioVoTinh"

echo "🚀 Starting to package Xcode Template: $EXTRACTED_FOLDER"

if [ ! -f "$ZIP_NAME" ]; then
    echo "❌ Error: $ZIP_NAME not found!"
    exit 1
fi

echo "📦 Unzipping project..."
unzip -o "$ZIP_NAME"

if [ ! -d "$EXTRACTED_FOLDER" ]; then
    echo "❌ Error: Folder $EXTRACTED_FOLDER not found after unzipping!"
    exit 1
fi

mkdir -p "$DEST_DIR"

echo "🚚 Installing template to Xcode..."
cp -R "$EXTRACTED_FOLDER" "$DEST_DIR/"

chmod -R 755 "$DEST_DIR/$EXTRACTED_FOLDER"

rm -rf "__MACOSX"

echo "✅ Task completed successfully!"
echo "📍 Path: $DEST_DIR/$EXTRACTED_FOLDER"
echo "💡 Please restart Xcode (run 'killall Xcode') to see the changes."