#!/bin/bash

echo "============================"
echo "      SSH Key Installer"
echo "        Debian/Ubuntu"
echo "============================"

if [ -z "$1" ]; then
    echo "❌ 用法: bash key.sh <GitHub 用户名>"
    exit 1
fi

USERNAME="$1"
SSH_DIR="$HOME/.ssh"
AUTHORIZED_KEYS="$SSH_DIR/authorized_keys"
KEY_URL="https://github.com/${USERNAME}.keys"

# 创建 .ssh 目录
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# 下载公钥
echo "📥 正在从 GitHub 下载 $USERNAME 的 SSH 公钥..."
if ! curl -fsSL "$KEY_URL" -o "$AUTHORIZED_KEYS"; then
    echo "❌ 下载失败！请检查 GitHub 用户名是否存在。"
    exit 1
fi

chmod 600 "$AUTHORIZED_KEYS"

echo "✅ SSH 公钥已安装到：$AUTHORIZED_KEYS"
echo "🎉 完成！"
