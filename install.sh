#!/bin/bash

# ============================================
# GT-customterminal Local Installer
# Developer: SalehGNUTUX
# Version: 1.1.0 (Fixed Path Mode)
# ============================================

# تحديد مسار المجلد الحالي لضمان الوصول للملفات المرافقة
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

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
print_color "$CYAN" "           🛠️  GT-customterminal Local Installer v1.1.0"
print_color "$CYAN" "           👨‍💻  Developer: SalehGNUTUX"
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
        MSG_CHECK_INSTALL="🔍 جاري التحقق من وجود تثبيت سابق..."
        MSG_SYSTEM_INSTALL_FOUND="تم العثور على تثبيت نظامي للإصدار"
        MSG_LOCAL_INSTALL_FOUND="تم العثور على تثبيت محلي في:"
        MSG_NO_PREV_INSTALL="لم يتم العثور على تثبيت سابق."
        MSG_WHAT_DO="ماذا تريد أن تفعل؟"
        MSG_OPTION_REINSTALL="1) إعادة التثبيت (تحديث)"
        MSG_OPTION_UNINSTALL="2) إلغاء التثبيت"
        MSG_OPTION_KEEP="3) الخروج"
        MSG_OPTION_CONTINUE="4) متابعة التثبيت العادي"
        MSG_CHOOSE="اختر [1-4]: "
        MSG_ASK_SYSTEM_INSTALL="🔧 هل تريد تثبيت الأداة نظامياً (gt-terminal)؟"
        MSG_INSTALLING_SYSTEM="📦 جاري التثبيت النظامي..."
        MSG_INSTALL_SUCCESS="✅ تم التثبيت بنجاح!"
        MSG_RUN_COMMANDS="الأمر: gt-terminal"
        MSG_STARTING="🚀 جاري التشغيل..."
        MSG_RUNNING_LOCAL="🚀 جاري التشغيل محلياً..."
        MSG_FINAL_NOTE="شكراً لاستخدامك GT-customterminal!"
        ;;
    *)
        LANG_MODE="EN"
        AR_MODE=false
        MSG_CHECK_INSTALL="🔍 Checking for previous installation..."
        MSG_SYSTEM_INSTALL_FOUND="Found system-wide installation version"
        MSG_LOCAL_INSTALL_FOUND="Found local installation in:"
        MSG_NO_PREV_INSTALL="No previous installation found."
        MSG_WHAT_DO="What would you like to do?"
        MSG_OPTION_REINSTALL="1) Reinstall (update)"
        MSG_OPTION_UNINSTALL="2) Uninstall"
        MSG_OPTION_KEEP="3) Exit"
        MSG_OPTION_CONTINUE="4) Fresh install"
        MSG_CHOOSE="Choose [1-4]: "
        MSG_ASK_SYSTEM_INSTALL="🔧 Install system-wide (command 'gt-terminal')?"
        MSG_INSTALLING_SYSTEM="📦 Installing system-wide..."
        MSG_INSTALL_SUCCESS="✅ Installed successfully!"
        MSG_RUN_COMMANDS="Command: gt-terminal"
        MSG_STARTING="🚀 Starting..."
        MSG_RUNNING_LOCAL="🚀 Running locally..."
        MSG_FINAL_NOTE="Thank you for using GT-customterminal!"
        ;;
esac

# التحقق من التثبيت السابق
check_previous_installation() {
    print_info "$MSG_CHECK_INSTALL"
    LOCAL_DIR_PERM="$HOME/.local/share/gt-customterminal"
    if [ -f "/usr/local/bin/gt-terminal" ] || [ -d "$LOCAL_DIR_PERM" ]; then
        print_warning "$MSG_WHAT_DO"
        echo "$MSG_OPTION_REINSTALL"
        echo "$MSG_OPTION_UNINSTALL"
        echo "$MSG_OPTION_KEEP"
        read -p "$MSG_CHOOSE" prev_choice
        case $prev_choice in
            2) [ -f "/usr/local/bin/gt-uninstall" ] && /usr/local/bin/gt-uninstall || bash "$LOCAL_DIR_PERM/uninstall.sh"; exit 0 ;;
            3) exit 0 ;;
        esac
    fi
}

install_system_wide() {
    print_info "$MSG_INSTALLING_SYSTEM"
    sudo -v || return 1
    local perm_dir="$HOME/.local/share/gt-customterminal"
    mkdir -p "$perm_dir"
    
    # نسخ الملفات من المجلد الحالي (المؤقت) إلى المجلد الدائم
    cp -f "$SCRIPT_DIR"/* "$perm_dir/" 2>/dev/null

    sudo cp "$perm_dir/gt-customterminal.sh" "/usr/local/bin/gt-terminal"
    sudo chmod +x "/usr/local/bin/gt-terminal"
    sudo ln -sf "/usr/local/bin/gt-terminal" "/usr/local/bin/gt-term"
    sudo cp "$perm_dir/uninstall.sh" "/usr/local/bin/gt-uninstall" 2>/dev/null
    sudo chmod +x "/usr/local/bin/gt-uninstall" 2>/dev/null

    mkdir -p "$HOME/.config/gt-customterminal"
    echo "$LANG_MODE" > "$HOME/.config/gt-customterminal/language"

    print_success "$MSG_INSTALL_SUCCESS"
    print_info "$MSG_STARTING"
    sleep 2
    gt-terminal
    exit 0
}

# التنفيذ الرئيسي
check_previous_installation
print_info "$MSG_ASK_SYSTEM_INSTALL"
read -p "[y/N]: " system_install

if [[ "$system_install" =~ ^[Yy]$ ]]; then
    install_system_wide
fi

# تشغيل محلي إذا رفض التثبيت النظامي
echo "$LANG_MODE" > .language
chmod +x ./gt-customterminal.sh
./gt-customterminal.sh
print_success "$MSG_FINAL_NOTE"
