#!/bin/bash

# Cài đặt nhanh Antigravity Harness cho macOS / Linux
echo "🚀 Bắt đầu cài đặt Antigravity Harness..."

# Xác định thư mục skills toàn cục của Antigravity
SKILL_DIR="$HOME/.agent/skills/harness"

echo "📂 Đang tạo thư mục đích tại $SKILL_DIR..."
mkdir -p "$SKILL_DIR"

echo "📦 Đang sao chép mã nguồn kỹ năng (skills)..."
cp -r skills/harness/* "$SKILL_DIR/"

echo "✅ Cài đặt hoàn tất! Antigravity Harness đã sẵn sàng."
echo "💡 Bạn có thể bắt đầu bằng lệnh: /harness build a harness for..."
