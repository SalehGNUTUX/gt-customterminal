#!/bin/bash

# ============================================
# GT-customterminal Installer
# Developer: SalehGNUTUX
# Version: 1.0.5
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
print_color "$CYAN" "           🛠️  GT-customterminal Installer v1.0.5"
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
        MSG_ASK_SYSTEM_INSTALL="🔧 هل تريد تثبيت الأداة نظامياً (لتصبح الأوامر gt-terminal/gt-term متاحة في كل مكان)؟"
        MSG_INSTALLING_SYSTEM="📦 جاري التثبيت النظامي..."
        MSG_INSTALL_SUCCESS="✅ تم تثبيت الأداة نظامياً بنجاح!"
        MSG_RUN_COMMANDS="يمكنك الآن تشغيل الأداة باستخدام: gt-terminal  أو  gt-term"
        MSG_STARTING="🚀 جاري تشغيل الأداة..."
        MSG_FILES_LIST="الملفات التي تم تنزيلها:"
        MSG_RUNNING_LOCAL="🚀 جاري تشغيل الأداة محلياً..."
        MSG_FINAL_NOTE="شكراً لاستخدامك GT-customterminal!"
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
        MSG_ASK_SYSTEM_INSTALL="🔧 Do you want to install the tool system-wide (so you can run 'gt-terminal' or 'gt-term' from anywhere)?"
        MSG_INSTALLING_SYSTEM="📦 Installing system-wide..."
        MSG_INSTALL_SUCCESS="✅ Tool installed system-wide successfully!"
        MSG_RUN_COMMANDS="You can now run the tool using: gt-terminal  or  gt-term"
        MSG_STARTING="🚀 Starting the tool..."
        MSG_FILES_LIST="Downloaded files:"
        MSG_RUNNING_LOCAL="🚀 Running the tool locally..."
        MSG_FINAL_NOTE="Thank you for using GT-customterminal!"
        ;;
    *)
        LANG_MODE="EN"
        AR_MODE=false
        echo -e "${YELLOW}⚠${NC} Using default language (English)"
        MSG_CHECK="🔍 Checking internet connection..."
        MSG_CONNECTION_OK="✅ Internet connection OK"
        MSG_NO_INTERNET="❌ No internet connection"
        MSG_CREATE_DIR="📁 Creating installation directory..."
        MSG_DOWNLOADING="📥 Downloading tool files..."
        MSG_DOWNLOAD_SUCCESS="✅ All files downloaded successfully"
        MSG_DOWNLOAD_FAILED="❌ Failed to download file:"
        MSG_ASK_SYSTEM_INSTALL="🔧 Do you want to install the tool system-wide (so you can run 'gt-terminal' or 'gt-term' from anywhere)?"
        MSG_INSTALLING_SYSTEM="📦 Installing system-wide..."
        MSG_INSTALL_SUCCESS="✅ Tool installed system-wide successfully!"
        MSG_RUN_COMMANDS="You can now run the tool using: gt-terminal  or  gt-term"
        MSG_STARTING="🚀 Starting the tool..."
        MSG_FILES_LIST="Downloaded files:"
        MSG_RUNNING_LOCAL="🚀 Running the tool locally..."
        MSG_FINAL_NOTE="Thank you for using GT-customterminal!"
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
DOWNLOADER_NAME=""
if command -v curl &> /dev/null; then
    DOWNLOAD_CMD="curl -s -f -L -o"
    DOWNLOADER_NAME="curl"
elif command -v wget &> /dev/null; then
    DOWNLOAD_CMD="wget -q -O"
    DOWNLOADER_NAME="wget"
else
    print_error "❌ Need curl or wget for download"
    exit 1
fi

# إنشاء مجلد التثبيت المحلي
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
FAILED=0
for file_entry in "${FILES[@]}"; do
    IFS=':' read -r filename filetype <<< "$file_entry"
    
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
echo "1.0.5" > version.txt
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
echo ""

# سؤال المستخدم عن التثبيت النظامي
echo "────────────────────────────────────────────────────────────"
print_info "$MSG_ASK_SYSTEM_INSTALL"
read -p "[y/N]: " system_install

if [[ "$system_install" =~ ^[Yy]$ ]]; then
    print_info "$MSG_INSTALLING_SYSTEM"
    
    # طلب صلاحيات sudo
    sudo -v
    if [ $? -ne 0 ]; then
        print_error "❌ Failed to get sudo permissions. Cannot install system-wide."
        print_warning "⚠ Continuing with local installation only."
    else
        # نسخ الملف الرئيسي إلى /usr/local/bin
        sudo cp "$INSTALL_DIR/gt-customterminal.sh" "/usr/local/bin/gt-terminal"
        sudo chmod +x "/usr/local/bin/gt-terminal"
        
        # إنشاء رابط رمزي قصير
        sudo ln -sf "/usr/local/bin/gt-terminal" "/usr/local/bin/gt-term" 2>/dev/null
        
        print_success "$MSG_INSTALL_SUCCESS"
        echo ""
        echo "$MSG_RUN_COMMANDS"
        echo ""
        
        # نسخ uninstall.sh إلى مكان مناسب (اختياري)
        sudo cp "$INSTALL_DIR/uninstall.sh" "/usr/local/bin/gt-uninstall" 2>/dev/null
        sudo chmod +x "/usr/local/bin/gt-uninstall" 2>/dev/null
        
        # حفظ إعداد اللغة في ملف الكونفيغ (للاستخدام المستقبلي)
        mkdir -p "$HOME/.config/gt-customterminal"
        echo "$LANG_MODE" > "$HOME/.config/gt-customterminal/language"
        
        # تشغيل الأداة
        echo ""
        print_info "$MSG_STARTING"
        sleep 2
        gt-terminal
        
        # بعد الخروج من الأداة، نعرض رسالة نهائية
        echo ""
        print_success "$MSG_FINAL_NOTE"
        exit 0
    fi
fi

# إذا لم يختر التثبيت النظامي أو فشل، نقوم بتشغيل الأداة محلياً
echo ""
print_info "$MSG_RUNNING_LOCAL"
sleep 2

# حفظ إعداد اللغة (للاستخدام المحلي)
echo "$LANG_MODE" > "$INSTALL_DIR/.language"

# تشغيل الأداة
cd "$INSTALL_DIR"
./gt-customterminal.sh

# بعد الخروج من الأداة
echo ""
echo "════════════════════════════════════════════════════════════"
if [ "$AR_MODE" = true ]; then
    echo "📌 الأداة ما زالت مثبتة محلياً في:"
    echo "   $INSTALL_DIR"
    echo ""
    echo "لتشغيلها مرة أخرى:"
    echo "   $INSTALL_DIR/gt-customterminal.sh"
    echo ""
    echo "أو يمكنك تثبيتها نظامياً بتشغيل هذا المثبت مرة أخرى واختيار 'y'"
else
    echo "📌 Tool is still installed locally in:"
    echo "   $INSTALL_DIR"
    echo ""
    echo "To run it again:"
    echo "   $INSTALL_DIR/gt-customterminal.sh"
    echo ""
    echo "Or install system-wide by running this installer again and choosing 'y'"
fi
echo "════════════════════════════════════════════════════════════"
print_success "$MSG_FINAL_NOTE"
