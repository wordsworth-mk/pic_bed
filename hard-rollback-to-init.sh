#!/bin/bash
set -e

echo "即将硬回退到初始提交，所有后续更改将被永久删除！"
git log --oneline -1

read -p "确定要继续吗？ (y/N): " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    git reset --hard $(git rev-list --max-parents=0 HEAD)
    echo "✅ 已硬回退到初始提交，工作区已清理"
    git status
else
    echo "操作已取消"
fi