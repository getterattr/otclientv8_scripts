#!/bin/bash

OUTPUT_FILE="compiled.lua"
BOT_DIR="bot"

cat > "$OUTPUT_FILE" << 'EOF'
---------------------
-- [[ Custom tab ]] --
----------------------
local customTab = addTab("Custom")

EOF

# Find all Lua files in the bot directory and subdirectories
find "$BOT_DIR" -name "*.lua" | sort | while read -r file; do
    echo "Adding $file to compilation..."
    
    # Add file name as a comment
    echo -e "\n-- [[ From: $file ]] --" >> "$OUTPUT_FILE"
    
    # Append file content
    cat "$file" >> "$OUTPUT_FILE"
    
    # Add a separator
    echo -e "\n-- -------------------------------- --\n" >> "$OUTPUT_FILE"
done
