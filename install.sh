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
        AR_MODE=true
        echo -e "${GREEN}✓${NC} تم اختيار اللغة العربية"
        MSG_CHECK="🔍 جاري التحقق من الاتصال بالإنترنت..."
        MSG_CONNECTION_OK="✅ الاتصال بالإنترنت جيد"
        MSG_NO_INTERNET="❌ لا يوجد اتصال بالإنترنت"
        MSG_CREATE_DIR="📁 جاري إنشاء مجلد التثبيت..."
        MSG_DOWNLOADING="📥 جاري تنزيل ملفات الأداة..."
        MSG_DOWNLOAD_SUCCESS="✅ تم تنزيل جميع الملفات بنجاح"
        MSG_DOWNLOAD_FAILED="❌ فشل في تنزيل الملف:"
        MSG_STARTING="🚀 جاري تشغيل الأداة محلياً..."
        MSG_FILES_LIST="الملفات التي تم تنزيلها:"
        MSG_README="📖 تم تنزيل ملف README.md"
        MSG_MAIN_SCRIPT="📜 تم تنزيل السكربت الرئيسي"
        MSG_UNINSTALL="🗑️  تم تنزيل سكربت الإزالة"
        MSG_VERSION="🔢 تم إنشاء ملف الإصدار"
        MSG_RUNNING="الآن سيتم تشغيل الأداة من مجلد التثبيت المحلي"
        MSG_INSTALL_NOTE="بعد التشغيل، يمكنك تثبيتها نظامياً باختيار 'y' عند السؤال"
        ;;
    2)
        LANG_MODE="EN"
        AR_MODE=false
        echo -e "${GREEN}✓${NC} English language selected"
        MSG_CHECK="🔍 Checking internet connection..."
        MSG_CONNECTION_OK="✅ Internet connection OK"
        MSG_NO_INTERNET="❌ No internet connection"
        MSG_CREATE_DIR="📁 Creating installation directory..."
        MSG_DOWNLOADING="📥 Downloading tool files..."
        MSG_DOWNLOAD_SUCCESS="✅ All files downloaded successfully"
        MSG_DOWNLOAD_FAILED="❌ Failed to download file:"
        MSG_STARTING="🚀 Starting tool locally..."
        MSG_FILES_LIST="Downloaded files:"
        MSG_README="📖 Downloaded README.md"
        MSG_MAIN_SCRIPT="📜 Downloaded main script"
        MSG_UNINSTALL="🗑️  Downloaded uninstall script"
        MSG_VERSION="🔢 Created version file"
        MSG_RUNNING="Now running the tool from local installation directory"
        MSG_INSTALL_NOTE="After running, you can install system-wide by pressing 'y' when prompted"
        ;;
    *)
        LANG_MODE="EN"
        AR_MODE=false
        echo -e "${YELLOW}⚠${NC} Using default language (English)"
        # تعيين الرسائل الافتراضية للإنجليزية
        MSG_CHECK="🔍 Checking internet connection..."
        MSG_CONNECTION_OK="✅ Internet connection OK"
        MSG_NO_INTERNET="❌ No internet connection"
        MSG_CREATE_DIR="📁 Creating installation directory..."
        MSG_DOWNLOADING="📥 Downloading tool files..."
        MSG_DOWNLOAD_SUCCESS="✅ All files downloaded successfully"
        MSG_DOWNLOAD_FAILED="❌ Failed to download file:"
        MSG_STARTING="🚀 Starting tool locally..."
        MSG_FILES_LIST="Downloaded files:"
        MSG_README="📖 Downloaded README.md"
        MSG_MAIN_SCRIPT="📜 Downloaded main script"
        MSG_UNINSTALL="🗑️  Downloaded uninstall script"
        MSG_VERSION="🔢 Created version file"
        MSG_RUNNING="Now running the tool from local installation directory"
        MSG_INSTALL_NOTE="After running, you can install system-wide by pressing 'y' when prompted"
        ;;
esac

# التحقق من الاتصال
echo ""
print_info "$MSG_CHECK"

if ! ping -c 1 github.com &> /dev/null && ! ping -c 1 raw.githubusercontent.com &> /dev/null; then
    print_error "$MSG_NO_INTERNET"
    exit 1
fi

print_success "$MSG_CONNECTION_OK"

# التحقق من وجود curl أو wget
DOWNLOAD_CMD=""
if command -v curl &> /dev/null; then
    DOWNLOAD_CMD="curl -s -f -L -o"
elif command -v wget &> /dev/null; then
    DOWNLOAD_CMD="wget -q -O"
else
    print_error "❌ Need curl or wget for download"
    exit 1
fi

# إنشاء مجلد التثبيت في المنزل (وليس /tmp)
INSTALL_DIR="$HOME/.local/share/gt-customterminal"
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR" || exit 1

print_success "$MSG_CREATE_DIR"
echo "   📂 $INSTALL_DIR"

# قائمة الملفات المطلوبة
BASE_URL="https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main"
FILES=(
    "gt-customterminal.sh:main"
    "uninstall.sh:uninstall"
    "README.md:readme"
)

echo ""
print_info "$MSG_DOWNLOADING"
echo "════════════════════════════════════════════════════════════"

# تنزيل الملفات
for file_entry in "${FILES[@]}"; do
    IFS=':' read -r filename filetype <<< "$file_entry"
    
    printf "📄 %-20s ... " "$filename"
    
    if [ "$DOWNLOAD_CMD" = "curl -s -f -L -o" ]; then
        if curl -s -f -L -o "$filename" "$BASE_URL/$filename" 2>/dev/null; then
            echo -e "${GREEN}✓${NC}"
            chmod +x "$filename" 2>/dev/null
        else
            echo -e "${RED}✗${NC}"
            FAILED=1
        fi
    else
        if wget -q -O "$filename" "$BASE_URL/$filename" 2>/dev/null; then
            echo -e "${GREEN}✓${NC}"
            chmod +x "$filename" 2>/dev/null
        else
            echo -e "${RED}✗${NC}"
            FAILED=1
        fi
    fi
done

# إنشاء ملف الإصدار
echo "1.0.4" > version.txt
echo -e "🔢 version.txt           ... ${GREEN}✓${NC} (created locally)"

echo "════════════════════════════════════════════════════════════"

# التحقق من وجود الملفات الأساسية
if [ ! -f "gt-customterminal.sh" ]; then
    print_error "$MSG_DOWNLOAD_FAILED gt-customterminal.sh"
    exit 1
fi

print_success "$MSG_DOWNLOAD_SUCCESS"
echo ""

# عرض الملفات المنزلة
echo "$MSG_FILES_LIST"
ls -la --color=always | head -10

# حفظ إعداد اللغة
echo "$LANG_MODE" > "$INSTALL_DIR/.language"

echo ""
echo "════════════════════════════════════════════════════════════"
print_info "$MSG_RUNNING"
echo "$MSG_INSTALL_NOTE"
echo "════════════════════════════════════════════════════════════"
echo ""
sleep 3

# تشغيل الأداة من الملف المحلي
cd "$INSTALL_DIR"
./gt-customterminal.sh

# إذا خرج المستخدم من الأداة، نعرض رسالة
echo ""
echo "════════════════════════════════════════════════════════════"
if [ "$AR_MODE" = true ]; then
    echo "📌 الأداة ما زالت مثبتة محلياً في:"
    echo "   $INSTALL_DIR"
    echo ""
    echo "لتشغيلها مرة أخرى:"
    echo "   $INSTALL_DIR/gt-customterminal.sh"
    echo ""
    echo "أو يمكنك تثبيتها نظامياً بتشغيلها واختيار 'y' عند السؤال"
else
    echo "📌 Tool is still installed locally in:"
    echo "   $INSTALL_DIR"
    echo ""
    echo "To run it again:"
    echo "   $INSTALL_DIR/gt-customterminal.sh"
    echo ""
    echo "Or install system-wide by running it and pressing 'y' when prompted"
fi
echo "════════════════════════════════════════════════════════════"
