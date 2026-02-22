#!/bin/bash

# إنشاء مجلد مؤقت
TEMP_DIR=$(mktemp -d /tmp/gt-terminal-XXXXXX)
cd "$TEMP_DIR" || exit

echo "------------------------------------------------------------"
echo "📥 Downloading GT-customterminal..."
echo "------------------------------------------------------------"

REPO_URL="https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main"

# تحميل الملفات
curl -sSL -O "$REPO_URL/install.sh"
curl -sSL -O "$REPO_URL/gt-customterminal.sh"
curl -sSL -O "$REPO_URL/uninstall.sh"

chmod +x install.sh gt-customterminal.sh

# الحل الجذري: تشغيل السكربت مع توجيه الإدخال من لوحة التحكم (tty)
# هذا يمنع السكربت من "تخطي" الأسئلة
./install.sh </dev/tty
