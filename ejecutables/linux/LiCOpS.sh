#!/bin/sh
echo -ne '\033c\033]0;ProjectBAMP\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/LiCOpS.x86_64" "$@"
