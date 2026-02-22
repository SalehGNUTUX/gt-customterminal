#!/bin/bash

# إنشاء مجلد مؤقت فريد لتجنب تداخل الملفات
TEMP_DIR=$(mktemp -d /tmp/gt-terminal-XXXXXX)
cd "$TEMP_DIR" || { echo "Failed to create temp directory"; exit 1; }

echo "------------------------------------------------------------"
echo "📥 Downloading GT-customterminal components..."
echo "------------------------------------------------------------"

# رابط المستودع الخام
REPO_URL="https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main"

# جلب الملفات الأساسية
curl -sSL -O "$REPO_URL/install.sh"
curl -sSL -O "$REPO_URL/gt-customterminal.sh"
curl -sSL -O "$REPO_URL/uninstall.sh"

# التحقق من نجاح التحميل
if [ ! -f "install.sh" ]; then
    echo "❌ Error: Could not download installation files."
    exit 1
fi

# إعطاء صلاحيات التنفيذ
chmod +x install.sh gt-customterminal.sh

# تشغيل المثبت الفعلي (هذا سيفتح واجهة اختيار اللغة والتثبيت)
./install.sh
