#!/usr/bin/env bash

# ====================================================
#    Filename:      backup_and_restore_vscode_extensions.sh
#    Date:          2024-01-12 00:35
#    Author:        siuyutpang
#    Email:         siuyutpang@gmail.com
#    Description:   备份与恢复vscode插件
# ====================================================

function backup_extensions() {
    code --list-extensions > extensions.txt
}

function restore_extensions() {
    cat extensions.txt | xargs -L 1 code --install-extension
}

if command -v code >/dev/null 2>&1; then
    case "$1" in
        backup)
            echo 'Saving vscode extensions ...'
            backup_extensions
            ;;
        restore)
            echo "Installing vscode extensions ..."
            restore_extensions
            ;;
        *)
            echo "invalid option."
            return 1
            ;;
    esac
else
    echo "You don't even have vscode installed!"
fi
