#!/bin/bash

# ============================================
# GT-customterminal Uninstaller
# Developer: SalehGNUTUX
# Version: 1.0.0
# ============================================

echo ""
echo "🗑️  ==========================================="
echo "🗑️    GT-customterminal Uninstaller"
echo "👨‍💻    Developer: SalehGNUTUX"
echo "🌐    https://github.com/SalehGNUTUX"
echo "🗑️  ==========================================="
echo ""

# الألوان
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_color() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

print_success() {
    print_color "$GREEN" "✓ $1"
}

print_error() {
    print_color "$RED" "✗ $1"
}

print_warning() {
    print_color "$YELLOW" "⚠ $1"
}

print_info() {
    print_color "$BLUE" "🔍 $1"
}

# اختيار اللغة
echo "🌐 Please select language / الرجاء اختيار اللغة:"
echo "1) 🇸🇦 العربية (AR)"
echo "2) 🇺🇸 English (EN)"
echo "3) ❌ Exit / خروج"
read -p "Choice [1-3]: " lang_choice

case $lang_choice in
    2)
        LANG_MODE="EN"
        echo "✓ English language selected"
        ;;
    1)
        LANG_MODE="AR"
        echo "✓ تم اختيار اللغة العربية"
        ;;
    3)
        if [ "$LANG_MODE" = "EN" ]; then
            echo "Exit"
        else
            echo "خروج"
        fi
        exit 0
        ;;
    *)
        LANG_MODE="EN"
        echo "⚠ Using default language (English)"
        ;;
esac

# المسارات
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="$HOME/.config/gt-customterminal"

# ============================================
# رسائل اللغة
# ============================================

if [ "$LANG_MODE" = "EN" ]; then
    WELCOME_TITLE="🗑️  GT-customterminal Uninstaller"
    WELCOME_MSG="This will uninstall GT-customterminal from your system."
    CONFIRM_UNINSTALL="Do you want to continue with uninstallation? (y/n): "
    OPERATION_CANCELLED="Uninstallation cancelled."
    NEED_SUDO="Need sudo permissions to remove system files..."
    CHECKING_FILES="Checking for installed files..."
    REMOVING_SYSTEM="Removing system files..."
    REMOVED_FILE="Removed:"
    NO_SYSTEM_FILES="No system files found."
    KEEP_CONFIG="Do you want to keep configuration files? (y/n): "
    REMOVING_CONFIG="Removing configuration files..."
    CONFIG_KEPT="Configuration files kept in:"
    CONFIG_REMOVED="Configuration files removed."
    NO_CONFIG_FOUND="No configuration files found."
    UNINSTALL_COMPLETE="Uninstallation completed successfully!"
    RESTART_TERMINAL="Please restart your terminal to complete the process."
    THANK_YOU="Thank you for using GT-customterminal!"
    MANUAL_REMOVAL="Manual removal commands:"
    REMOVE_SYSTEM_CMD="sudo rm -f /usr/local/bin/gt-terminal /usr/local/bin/gt-term"
    REMOVE_CONFIG_CMD="rm -rf ~/.config/gt-customterminal"
else
    WELCOME_TITLE="🗑️  إلغاء تثبيت GT-customterminal"
    WELCOME_MSG="هذا سيقوم بإلغاء تثبيت GT-customterminal من نظامك."
    CONFIRM_UNINSTALL="هل تريد متابعة عملية إلغاء التثبيت؟ (y/n): "
    OPERATION_CANCELLED="تم إلغاء عملية الإزالة."
    NEED_SUDO="تحتاج صلاحيات sudo لإزالة الملفات النظامية..."
    CHECKING_FILES="جاري التحقق من الملفات المثبتة..."
    REMOVING_SYSTEM="جاري إزالة الملفات النظامية..."
    REMOVED_FILE="تم إزالة:"
    NO_SYSTEM_FILES="لم يتم العثور على ملفات نظامية."
    KEEP_CONFIG="هل تريد الاحتفاظ بملفات الإعدادات؟ (y/n): "
    REMOVING_CONFIG="جاري إزالة ملفات الإعدادات..."
    CONFIG_KEPT="تم الاحتفاظ بملفات الإعدادات في:"
    CONFIG_REMOVED="تم إزالة ملفات الإعدادات."
    NO_CONFIG_FOUND="لم يتم العثور على ملفات إعدادات."
    UNINSTALL_COMPLETE="تم إلغاء التثبيت بنجاح!"
    RESTART_TERMINAL="يرجى إعادة فتح الطرفية لإكمال العملية."
    THANK_YOU="شكراً لاستخدامك GT-customterminal!"
    MANUAL_REMOVAL="أوامر الإزالة اليدوية:"
    REMOVE_SYSTEM_CMD="sudo rm -f /usr/local/bin/gt-terminal /usr/local/bin/gt-term"
    REMOVE_CONFIG_CMD="rm -rf ~/.config/gt-customterminal"
fi

# ============================================
# عملية الإلغاء
# ============================================

clear
echo ""
echo "$WELCOME_TITLE"
echo "═════════════════════════════════════════"
echo "$WELCOME_MSG"
echo "═════════════════════════════════════════"
echo ""

read -p "$CONFIRM_UNINSTALL" confirm_uninstall

if [ "$confirm_uninstall" != "y" ] && [ "$confirm_uninstall" != "Y" ]; then
    print_warning "$OPERATION_CANCELLED"
    exit 0
fi

echo ""
print_info "$NEED_SUDO"

# التحقق من صلاحيات sudo
if ! sudo -n true 2>/dev/null; then
    sudo -v
    if [ $? -ne 0 ]; then
        if [ "$LANG_MODE" = "EN" ]; then
            print_error "Failed to get sudo permissions. Cannot remove system files."
        else
            print_error "فشل في الحصول على صلاحيات sudo. لا يمكن إزالة الملفات النظامية."
        fi
    fi
fi

echo ""
print_info "$CHECKING_FILES"

# إزالة الملفات النظامية
SYSTEM_FILES_FOUND=0

if [ -f "$INSTALL_DIR/gt-terminal" ]; then
    sudo rm -f "$INSTALL_DIR/gt-terminal"
    print_success "$REMOVED_FILE $INSTALL_DIR/gt-terminal"
    SYSTEM_FILES_FOUND=1
fi

if [ -f "/usr/local/bin/gt-term" ]; then
    sudo rm -f "/usr/local/bin/gt-term"
    print_success "$REMOVED_FILE /usr/local/bin/gt-term"
    SYSTEM_FILES_FOUND=1
fi

if [ $SYSTEM_FILES_FOUND -eq 0 ]; then
    print_warning "$NO_SYSTEM_FILES"
fi

# التحقق من ملفات الإعدادات
echo ""
if [ -d "$CONFIG_DIR" ]; then
    read -p "$KEEP_CONFIG" keep_config
    
    if [ "$keep_config" = "y" ] || [ "$keep_config" = "Y" ]; then
        print_success "$CONFIG_KEPT $CONFIG_DIR"
        
        if [ "$LANG_MODE" = "EN" ]; then
            echo ""
            echo "Your configuration files are saved in:"
            echo "  $CONFIG_DIR"
            echo ""
            echo "Contents:"
            ls -la "$CONFIG_DIR/"
        else
            echo ""
            echo "ملفات الإعدادات محفوظة في:"
            echo "  $CONFIG_DIR"
            echo ""
            echo "المحتويات:"
            ls -la "$CONFIG_DIR/"
        fi
    else
        print_info "$REMOVING_CONFIG"
        rm -rf "$CONFIG_DIR"
        print_success "$CONFIG_REMOVED"
    fi
else
    print_warning "$NO_CONFIG_FOUND"
fi

echo ""
echo "═════════════════════════════════════════"
print_success "$UNINSTALL_COMPLETE"
print_info "$RESTART_TERMINAL"
echo "═════════════════════════════════════════"

# عرض أوامر الإزالة اليدوية للإشارة
echo ""
if [ "$LANG_MODE" = "EN" ]; then
    echo "📝 $MANUAL_REMOVAL"
    echo "   If any issues remain, you can manually run:"
    echo "   $REMOVE_SYSTEM_CMD"
    echo "   $REMOVE_CONFIG_CMD"
else
    echo "📝 $MANUAL_REMOVAL"
    echo "   إذا بقت أي مشاكل، يمكنك تشغيل هذه الأوامر يدوياً:"
    echo "   $REMOVE_SYSTEM_CMD"
    echo "   $REMOVE_CONFIG_CMD"
fi

echo ""
echo "═════════════════════════════════════════"
print_color "$GREEN" "$THANK_YOU"
echo "═════════════════════════════════════════"
echo ""
