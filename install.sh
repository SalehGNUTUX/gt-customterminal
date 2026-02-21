#!/bin/bash

# ============================================
# GT-customterminal Installer
# Developer: SalehGNUTUX
# Version: 1.0.4
# ============================================

# الألوان
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

print_color() { echo -e "${1}${2}${NC}"; }
print_success() { print_color "$GREEN" "✓ $1"; }
print_error() { print_color "$RED" "✗ $1"; }
print_warning() { print_color "$YELLOW" "⚠ $1"; }
print_info() { print_color "$BLUE" "🔍 $1"; }

clear
echo ""
print_color "$CYAN" "════════════════════════════════════════════════════════════"
print_color "$CYAN" "           🛠️  GT-customterminal Installer v1.0.4"
print_color "$CYAN" "           👨‍💻  Developer: SalehGNUTUX"
print_color "$CYAN" "           🌐  https://github.com/SalehGNUTUX/gt-customterminal"
print_color "$CYAN" "════════════════════════════════════════════════════════════"
echo ""

# اختيار اللغة
echo "🌐 Please select language / الرجاء اختيار اللغة:"
echo "1) 🇸🇦 العربية (AR)"
echo "2) 🇺🇸 English (EN)"
read -p "Choice [1-2]: " lang_choice

case $lang_choice in
    1)
        LANG_MODE="AR"
        echo -e "${GREEN}✓${NC} تم اختيار اللغة العربية"
        AR_MODE=true
        ;;
    2)
        LANG_MODE="EN"
        echo -e "${GREEN}✓${NC} English language selected"
        AR_MODE=false
        ;;
    *)
        LANG_MODE="EN"
        AR_MODE=false
        echo -e "${YELLOW}⚠${NC} Using default language (English)"
        ;;
esac

# رسائل التثبيت
if [ "$AR_MODE" = true ]; then
    MSG_CHECK="🔍 جاري التحقق من الاتصال بالإنترنت..."
    MSG_CONNECTION_OK="✅ الاتصال بالإنترنت جيد"
    MSG_NO_INTERNET="❌ لا يوجد اتصال بالإنترنت"
    MSG_CHECK_AGAIN="يرجى التحقق من الاتصال والمحاولة مرة أخرى"
    MSG_DOWNLOADING="📥 جاري تنزيل ملفات التثبيت..."
    MSG_DOWNLOAD_SUCCESS="✅ تم تنزيل جميع الملفات بنجاح"
    MSG_DOWNLOAD_FAILED="❌ فشل في تنزيل الملف:"
    MSG_NEED_CURL_WGET="❌ يحتاج curl أو wget للتنزيل"
    MSG_INSTALL_CURL_WGET="يرجى تثبيت curl أو wget أولاً"
    MSG_STARTING="🚀 جاري تشغيل الأداة..."
    MSG_FILES_DOWNLOADED="الملفات التي تم تنزيلها:"
else
    MSG_CHECK="🔍 Checking internet connection..."
    MSG_CONNECTION_OK="✅ Internet connection OK"
    MSG_NO_INTERNET="❌ No internet connection"
    MSG_CHECK_AGAIN="Please check your connection and try again"
    MSG_DOWNLOADING="📥 Downloading installation files..."
    MSG_DOWNLOAD_SUCCESS="✅ All files downloaded successfully"
    MSG_DOWNLOAD_FAILED="❌ Failed to download file:"
    MSG_NEED_CURL_WGET="❌ Need curl or wget for download"
    MSG_INSTALL_CURL_WGET="Please install curl or wget first"
    MSG_STARTING="🚀 Starting the tool..."
    MSG_FILES_DOWNLOADED="Downloaded files:"
fi

# التحقق من الاتصال
echo ""
print_info "$MSG_CHECK"

if ! ping -c 1 github.com &> /dev/null && ! ping -c 1 raw.githubusercontent.com &> /dev/null; then
    print_error "$MSG_NO_INTERNET"
    echo "$MSG_CHECK_AGAIN"
    exit 1
fi

print_success "$MSG_CONNECTION_OK"

# التحقق من وجود curl أو wget
HAS_CURL=false
HAS_WGET=false

if command -v curl &> /dev/null; then
    HAS_CURL=true
elif command -v wget &> /dev/null; then
    HAS_WGET=true
else
    print_error "$MSG_NEED_CURL_WGET"
    echo "$MSG_INSTALL_CURL_WGET"
    exit 1
fi

# إنشاء مجلد مؤقت
TEMP_DIR="/tmp/gt-customterminal-install"
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR" || exit 1

# قائمة الملفات المطلوبة
FILES=(
    "gt-customterminal.sh"
    "install.sh"
    "uninstall.sh"
    "README.md"
    "version.txt"
)

# روابط التحميل الصحيحة
BASE_URL="https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main"

echo ""
print_info "$MSG_DOWNLOADING"
echo "════════════════════════════════════════════════════════════"

# تنزيل الملفات
SUCCESS_COUNT=0
FAILED_FILES=""

for file in "${FILES[@]}"; do
    printf "📄 %-20s ... " "$file"
    
    if [ "$HAS_CURL" = true ]; then
        if curl -s -f -o "$file" "$BASE_URL/$file" 2>/dev/null; then
            echo -e "${GREEN}✓${NC}"
            SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        else
            echo -e "${RED}✗${NC}"
            FAILED_FILES="$FAILED_FILES $file"
        fi
    elif [ "$HAS_WGET" = true ]; then
        if wget -q -O "$file" "$BASE_URL/$file" 2>/dev/null; then
            echo -e "${GREEN}✓${NC}"
            SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        else
            echo -e "${RED}✗${NC}"
            FAILED_FILES="$FAILED_FILES $file"
        fi
    fi
done

echo "════════════════════════════════════════════════════════════"

# إنشاء ملف version.txt إذا لم يتم تنزيله
if [ ! -f "version.txt" ]; then
    echo "1.0.4" > version.txt
    SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
fi

# التحقق من نجاح التحميل
if [ $SUCCESS_COUNT -lt 4 ]; then
    print_error "$MSG_DOWNLOAD_FAILED"
    if [ "$AR_MODE" = true ]; then
        echo "الملفات الفاشلة:$FAILED_FILES"
        echo "يمكنك تنزيل الملفات يدوياً من:"
        echo "  https://github.com/SalehGNUTUX/gt-customterminal"
    else
        echo "Failed files:$FAILED_FILES"
        echo "You can download the files manually from:"
        echo "  https://github.com/SalehGNUTUX/gt-customterminal"
    fi
    exit 1
fi

print_success "$MSG_DOWNLOAD_SUCCESS"

# عرض الملفات المنزلة
echo ""
echo "$MSG_FILES_DOWNLOADED"
ls -la --color=auto

# حفظ إعداد اللغة
echo "$LANG_MODE" > /tmp/gt-lang-temp

# جعل الملفات قابلة للتنفيذ
chmod +x gt-customterminal.sh install.sh uninstall.sh 2>/dev/null

echo ""
print_info "$MSG_STARTING"
sleep 2

# تشغيل الأداة
./gt-customterminal.sh
