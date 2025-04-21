#!/bin/bash

# 遍历所有符合条件的文件，提取数字并按逆序处理
for file in img*.png; do
    if [[ $file =~ ^img(_([0-9]+))?\.png$ ]]; then
        num="${BASH_REMATCH[2]:-0}"
        printf "%d %s\n" "$num" "$file"
    fi
done | sort -rn | while read -r num original; do
    new_num=$((num + 1))
    new_name="img_${new_num}.png"
    mv -v "$original" "$new_name"
done