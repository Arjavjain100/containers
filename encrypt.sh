#!/bin/bash

# Ensure sops is installed
if ! command -v sops &> /dev/null; then
    echo "Error: sops is not installed or not in PATH."
    exit 1
fi

echo "Starting encryption of .env files..."

# Find all .env files, excluding the .git directory
find . -path './.git' -prune -o -name ".env" -type f -print | while read -r env_file; do
    # Determine the output path (same directory, new extension)
    output_file="${env_file%.env}.enc.env"
    
    echo "Processing: $env_file"
    
    # Execute the encryption command
    if sops -e "$env_file" > "$output_file"; then
        echo "  [OK] Encrypted to $output_file"
    else
        echo "  [ERROR] Failed to encrypt $env_file"
    fi
done

echo "Encryption process complete."