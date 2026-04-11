#!/bin/bash

# Ensure sops is installed
if ! command -v sops &> /dev/null; then
    echo "Error: sops is not installed or not in PATH."
    exit 1
fi

echo "Starting decryption of .enc.env files..."

# Find all .enc.env files, excluding the .git directory
find . -path './.git' -prune -o -name "*.enc.env" -type f -print | while read -r enc_file; do
    # Determine the output path by removing '.enc' from the extension
    # Example: folder/.enc.env -> folder/.env
    output_file="${enc_file%.enc.env}.env"
    
    echo "Processing: $enc_file"
    
    # Execute the decryption command
    if sops -d "$enc_file" > "$output_file"; then
        echo "  [OK] Decrypted to $output_file"
    else
        echo "  [ERROR] Failed to decrypt $enc_file"
    fi
done

echo "Decryption process complete."