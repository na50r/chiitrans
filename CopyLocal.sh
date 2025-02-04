#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set the source directory (ChiitransLite folder relative to script location)
SOURCE_DIR="$SCRIPT_DIR/ChiitransLite"

# Set the destination directory
# If no argument is provided, use current working directory
if [ $# -eq 0 ]; then
    DEST_DIR="$(pwd)/ChiitransMine"
else
    DEST_DIR="$1/ChiitransMine"
fi

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# List of files and directories to copy
FILES_TO_COPY=(
    "ChiitransLite.exe"
    "ITH_Engine.dll"
    "log.txt"
    "vnrengxp.dll"
    "data"
    "ITH_TLS.dll"
    "tools"
    "www"
    "IHF.dll"
    "ithwrapper.dll"
    "vnrcli.dll"
    "IHF_compat.dll"
    "ithwrapper_compat.dll"
    "vnrclixp.dll"
    "IHF_DLL.dll"
    "LICENSE"
    "vnreng.dll"
)

# Function to check if source directory exists
check_source_dir() {
    if [ ! -d "$SOURCE_DIR" ]; then
        echo "Error: Source directory '$SOURCE_DIR' not found!"
        exit 1
    fi
}

# Function to copy files and directories
copy_files() {
    local status=0
    
    for item in "${FILES_TO_COPY[@]}"; do
        if [ -e "$SOURCE_DIR/$item" ]; then
            if [ -d "$SOURCE_DIR/$item" ]; then
                # If it's a directory, use cp -r
                cp -r "$SOURCE_DIR/$item" "$DEST_DIR/"
            else
                # If it's a file, use cp
                cp "$SOURCE_DIR/$item" "$DEST_DIR/"
            fi
            
            if [ $? -eq 0 ]; then
                echo "Copied: $item"
            else
                echo "Failed to copy: $item"
                status=1
            fi
        else
            echo "Warning: '$item' not found in source directory"
            status=1
        fi
    done
    
    return $status
}

# Main execution
echo "Source directory: $SOURCE_DIR"
echo "Destination directory: $DEST_DIR"

# Check if source directory exists
check_source_dir

# Copy files
if copy_files; then
    echo "Copy operation completed successfully!"
else
    echo "Copy operation completed with some warnings or errors"
fi
