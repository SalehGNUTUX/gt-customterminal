#!/bin/bash

# ============================================
# GT-customterminal Installer
# Developer: SalehGNUTUX
# Version: 1.0.1
# ============================================

echo ""
echo "🛠️  ==========================================="
echo "🔧   GT-customterminal Installer"
echo "👨‍💻   Developer: SalehGNUTUX"
echo "🌐   https://github.com/SalehGNUTUX"
echo "🛠️  ==========================================="
echo ""

# اختيار اللغة / Language Selection
echo "🌐 Select language / اختر اللغة:"
echo "1) 🇸🇦 العربية (Arabic)"
echo "2) 🇺🇸 English"
echo "3) 🤔 Skip for now / تخطي الآن"
read -p "Choice [1-3]: " lang_choice

case $lang_choice in
    2)
        LANG_MODE="en"
        echo "✓ English language selected"
        ;;
    1)
        LANG_MODE="ar"
        echo "✓ تم اختيار اللغة العربية"
        ;;
    *)
        LANG_MODE="en"
        echo "⚠ Using default language (English)"
        ;;
esac

# التحقق من الاتصال بالإنترنت / Check internet connection
if [ "$LANG_MODE" = "en" ]; then
    echo "🔍 Checking internet connection..."
else
    echo "🔍 جاري التحقق من الاتصال بالإنترنت..."
fi

if ! ping -c 1 github.com &> /dev/null; then
    if [ "$LANG_MODE" = "en" ]; then
        echo "❌ No internet connection"
        echo "Please check your connection and try again"
    else
        echo "❌ لا يوجد اتصال بالإنترنت"
        echo "يرجى التحقق من الاتصال والمحاولة مرة أخرى"
    fi
    exit 1
fi

if [ "$LANG_MODE" = "en" ]; then
    echo "✅ Internet connection OK"
    echo "📥 Downloading files..."
else
    echo "✅ الاتصال بالإنترنت جيد"
    echo "📥 جاري تنزيل الملفات..."
fi

# تنزيل الملف الرئيسي
if command -v curl &> /dev/null; then
    if curl -L -o gt-customterminal.sh "https://raw.githubusercontent.com/SalehGNUTUX/GT-customterminal/main/gt-customterminal.sh"; then
        if [ "$LANG_MODE" = "en" ]; then
            echo "✓ Downloaded using curl"
        else
            echo "✓ تم التنزيل باستخدام curl"
        fi
    else
        if [ "$LANG_MODE" = "en" ]; then
            echo "❌ Download failed"
        else
            echo "❌ فشل في التنزيل"
        fi
        exit 1
    fi
elif command -v wget &> /dev/null; then
    if wget -O gt-customterminal.sh "https://raw.githubusercontent.com/SalehGNUTUX/GT-customterminal/main/gt-customterminal.sh"; then
        if [ "$LANG_MODE" = "en" ]; then
            echo "✓ Downloaded using wget"
        else
            echo "✓ تم التنزيل باستخدام wget"
        fi
    else
        if [ "$LANG_MODE" = "en" ]; then
            echo "❌ Download failed"
        else
            echo "❌ فشل في التنزيل"
        fi
        exit 1
    fi
else
    if [ "$LANG_MODE" = "en" ]; then
        echo "❌ Need curl or wget for download"
        echo "Please install curl or wget first"
    else
        echo "❌ يحتاج curl أو wget للتنزيل"
        echo "يرجى تثبيت curl أو wget أولاً"
    fi
    exit 1
fi

# جعل الملف قابلاً للتنفيذ
chmod +x gt-customterminal.sh

# حفظ إعداد اللغة في ملف مؤقت
echo "$LANG_MODE" > /tmp/gt-lang-temp

if [ "$LANG_MODE" = "en" ]; then
    echo ""
    echo "✅ Download completed successfully!"
    echo ""
    echo "🎯 To use the tool:"
    echo "   ./gt-customterminal.sh"
    echo ""
    echo "🔧 For system-wide installation, choose 'Install' when prompted"
    echo ""
    read -p "Press Enter to start the tool... " dummy
else
    echo ""
    echo "✅ تم التنزيل بنجاح!"
    echo ""
    echo "🎯 لاستخدام الأداة:"
    echo "   ./gt-customterminal.sh"
    echo ""
    echo "🔧 للتثبيت نظامياً، اختر 'تثبيت' عند الطلب"
    echo ""
    read -p "اضغط Enter لبدء الأداة... " dummy
fi

# تشغيل الأداة
./gt-customterminal.sh
