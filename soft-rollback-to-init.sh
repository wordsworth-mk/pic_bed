#!/bin/bash
set -e

echo "即将软回退到 'init' 提交，更改将保留在工作区"
git log --oneline -1

read -p "确定要继续吗？ (y/N): " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    git reset --soft 1309221
    echo "✅ 已软回退到 init 提交，后续更改已移至暂存区"
    git status
else
    echo "操作已取消"
fi
