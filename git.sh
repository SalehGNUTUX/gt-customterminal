#!/bin/bash

# ============================================
# GT-customterminal Git Puller
# Developer: SalehGNUTUX
# Version: 1.0.1
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
print_color "$CYAN" "           📥 GT-customterminal Git Puller v1.0.1"
print_color "$CYAN" "           👨‍💻  Developer: SalehGNUTUX"
print_color "$CYAN" "           🌐  https://github.com/SalehGNUTUX/gt-customterminal"
print_color "$CYAN" "════════════════════════════════════════════════════════════"
echo ""

# التحقق من وجود curl أو wget
if command -v curl &> /dev/null; then
    DOWNLOAD_CMD="curl -s -f -L -o"
    DOWNLOADER_NAME="curl"
    print_success "Using curl for download"
elif command -v wget &> /dev/null; then
    DOWNLOAD_CMD="wget -q -O"
    DOWNLOADER_NAME="wget"
    print_success "Using wget for download"
else
    print_error "❌ Need curl or wget for download"
    exit 1
fi

# التحقق من الاتصال بالإنترنت
echo ""
print_info "Checking internet connection..."
if ! ping -c 1 github.com &> /dev/null && ! ping -c 1 raw.githubusercontent.com &> /dev/null; then
    print_error "❌ No internet connection"
    exit 1
fi
print_success "Internet connection OK"

# إنشاء مجلد مؤقت
TEMP_DIR=$(mktemp -d -t gt-customterminal-XXXXXX)
cd "$TEMP_DIR" || exit 1
print_success "Created temporary directory: $TEMP_DIR"

# قائمة الملفات المطلوبة
BASE_URL="https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main"
FILES=(
    "gt-customterminal.sh"
    "install.sh"
    "uninstall.sh"
    "README.md"
)

echo ""
print_info "Downloading files from repository..."
echo "════════════════════════════════════════════════════════════"

# تنزيل الملفات
FAILED=0
for filename in "${FILES[@]}"; do
    printf "📄 %-20s ... " "$filename"
    
    if [ "$DOWNLOADER_NAME" = "curl" ]; then
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
echo "1.1.0" > version.txt
echo -e "🔢 version.txt           ... ${GREEN}✓${NC} (created locally)"

echo "════════════════════════════════════════════════════════════"

if [ $FAILED -ne 0 ]; then
    print_error "Failed to download some files"
    exit 1
fi

print_success "All files downloaded successfully!"
echo ""
echo "Downloaded files:"
ls -la --color=always
echo ""

# تأكيد قبل المتابعة
echo "────────────────────────────────────────────────────────────"
print_info "Ready to start the installation process."
read -p "Press Enter to continue or Ctrl+C to cancel... " dummy

# تشغيل المثبت المحلي من نفس المجلد
echo ""
print_info "Starting local installer..."
sleep 1

# تشغيل install.sh مباشرة (بدون exec) ولكن في نفس المجلد
./install.sh

# بعد انتهاء install.sh، نعود هنا
echo ""
print_info "Installation process completed."
echo "You can find the downloaded files in: $TEMP_DIR"
echo "These files will be deleted when you reboot."
echo ""
