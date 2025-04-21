#!/bin/bash
ZIP_NAME="install.zip"

declare -a files_to_zip=(
    common
    customize.sh
    LICENSE
    META-INF
    module.prop
    service.sh
    system
    uninstall.sh
)

if [ -f "$ZIP_NAME" ]; then
    rm "$ZIP_NAME"
fi

zip -r -q "$ZIP_NAME" "${files_to_zip[@]}"

if [ $? -eq 0 ]; then
    echo "Successfully created $ZIP_NAME"
else
    echo "Error creating $ZIP_NAME" >&2
fi

exit 0
