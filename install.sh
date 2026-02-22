#!/bin/bash

# ============================================
# GT-customterminal Local Installer
# Developer: SalehGNUTUX
# Version: 1.1.0
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
        echo -e "${GREEN}✓${NC} تم اختيار اللغة العربية"
        MSG_CHECK_INSTALL="🔍 جاري التحقق من وجود تثبيت سابق..."
        MSG_SYSTEM_INSTALL_FOUND="تم العثور على تثبيت نظامي للإصدار"
        MSG_LOCAL_INSTALL_FOUND="تم العثور على تثبيت محلي في:"
        MSG_NO_PREV_INSTALL="لم يتم العثور على تثبيت سابق."
        MSG_WHAT_DO="ماذا تريد أن تفعل؟"
        MSG_OPTION_REINSTALL="1) إعادة التثبيت (تحديث) - تنزيل الملفات من جديد وتثبيتها"
        MSG_OPTION_UNINSTALL="2) إلغاء التثبيت - تشغيل أداة الإزالة"
        MSG_OPTION_KEEP="3) الإبقاء على التثبيت الحالي والخروج"
        MSG_OPTION_CONTINUE="4) متابعة التثبيت العادي (تثبيت جديد)"
        MSG_CHOOSE="اختر [1-4]: "
        MSG_REINSTALLING="🔄 جاري إعادة التثبيت..."
        MSG_UNINSTALLING="🗑️  جاري تشغيل أداة الإزالة..."
        MSG_KEEP_EXIT="👋 الإبقاء على التثبيت الحالي. الخروج."
        MSG_ASK_SYSTEM_INSTALL="🔧 هل تريد تثبيت الأداة نظامياً (لتصبح الأوامر gt-terminal/gt-term متاحة في كل مكان)؟"
        MSG_INSTALLING_SYSTEM="📦 جاري التثبيت النظامي..."
        MSG_INSTALL_SUCCESS="✅ تم تثبيت الأداة نظامياً بنجاح!"
        MSG_RUN_COMMANDS="يمكنك الآن تشغيل الأداة باستخدام: gt-terminal  أو  gt-term"
        MSG_STARTING="🚀 جاري تشغيل الأداة..."
        MSG_RUNNING_LOCAL="🚀 جاري تشغيل الأداة محلياً..."
        MSG_FINAL_NOTE="شكراً لاستخدامك GT-customterminal!"
        ;;
    2|*)
        LANG_MODE="EN"
        AR_MODE=false
        echo -e "${GREEN}✓${NC} English language selected"
        MSG_CHECK_INSTALL="🔍 Checking for previous installation..."
        MSG_SYSTEM_INSTALL_FOUND="Found system-wide installation version"
        MSG_LOCAL_INSTALL_FOUND="Found local installation in:"
        MSG_NO_PREV_INSTALL="No previous installation found."
        MSG_WHAT_DO="What would you like to do?"
        MSG_OPTION_REINSTALL="1) Reinstall (update) - download fresh files and install"
        MSG_OPTION_UNINSTALL="2) Uninstall - run the uninstaller"
        MSG_OPTION_KEEP="3) Keep current installation and exit"
        MSG_OPTION_CONTINUE="4) Continue with normal installation (fresh install)"
        MSG_CHOOSE="Choose [1-4]: "
        MSG_REINSTALLING="🔄 Reinstalling..."
        MSG_UNINSTALLING="🗑️  Running uninstaller..."
        MSG_KEEP_EXIT="👋 Keeping current installation. Exiting."
        MSG_ASK_SYSTEM_INSTALL="🔧 Do you want to install the tool system-wide (so you can run 'gt-terminal' or 'gt-term' from anywhere)?"
        MSG_INSTALLING_SYSTEM="📦 Installing system-wide..."
        MSG_INSTALL_SUCCESS="✅ Tool installed system-wide successfully!"
        MSG_RUN_COMMANDS="You can now run the tool using: gt-terminal  or  gt-term"
        MSG_STARTING="🚀 Starting the tool..."
        MSG_RUNNING_LOCAL="🚀 Running the tool locally..."
        MSG_FINAL_NOTE="Thank you for using GT-customterminal!"
        ;;
esac

# ============================================
# التحقق من وجود تثبيت سابق
# ============================================
check_previous_installation() {
    echo ""
    print_info "$MSG_CHECK_INSTALL"

    SYSTEM_INSTALLED=false
    LOCAL_INSTALLED=false
    SYSTEM_VERSION=""
    LOCAL_VERSION=""

    # التحقق من التثبيت النظامي
    if [ -f "/usr/local/bin/gt-terminal" ]; then
        SYSTEM_INSTALLED=true
        SYSTEM_VERSION=$(grep -m1 "VERSION=" /usr/local/bin/gt-terminal | cut -d'"' -f2 2>/dev/null || echo "unknown")
    fi

    # التحقق من التثبيت المحلي الدائم
    LOCAL_DIR_PERM="$HOME/.local/share/gt-customterminal"
    if [ -d "$LOCAL_DIR_PERM" ] && [ -f "$LOCAL_DIR_PERM/gt-customterminal.sh" ]; then
        LOCAL_INSTALLED=true
        LOCAL_VERSION=$(grep -m1 "VERSION=" "$LOCAL_DIR_PERM/gt-customterminal.sh" | cut -d'"' -f2 2>/dev/null || echo "unknown")
    fi

    # عرض النتائج واتخاذ القرار
    if [ "$SYSTEM_INSTALLED" = true ] || [ "$LOCAL_INSTALLED" = true ]; then
        echo ""
        if [ "$SYSTEM_INSTALLED" = true ]; then
            print_warning "$MSG_SYSTEM_INSTALL_FOUND: $SYSTEM_VERSION"
        fi
        if [ "$LOCAL_INSTALLED" = true ]; then
            print_warning "$MSG_LOCAL_INSTALL_FOUND $LOCAL_DIR_PERM (version: $LOCAL_VERSION)"
        fi
        echo ""
        echo "$MSG_WHAT_DO"
        echo "$MSG_OPTION_REINSTALL"
        echo "$MSG_OPTION_UNINSTALL"
        echo "$MSG_OPTION_KEEP"
        echo "$MSG_OPTION_CONTINUE"
        read -p "$MSG_CHOOSE" prev_choice

        case $prev_choice in
            1)
                print_info "$MSG_REINSTALLING"
                return 0
                ;;
            2)
                print_info "$MSG_UNINSTALLING"
                if [ -f "/usr/local/bin/gt-uninstall" ]; then
                    /usr/local/bin/gt-uninstall
                elif [ -f "$LOCAL_DIR_PERM/uninstall.sh" ]; then
                    bash "$LOCAL_DIR_PERM/uninstall.sh"
                else
                    print_error "Uninstaller not found. Please remove manually."
                fi
                exit 0
                ;;
            3)
                print_success "$MSG_KEEP_EXIT"
                exit 0
                ;;
            4)
                print_info "Continuing with fresh installation..."
                return 0
                ;;
            *)
                print_warning "Invalid choice. Continuing with fresh installation..."
                return 0
                ;;
        esac
    else
        print_success "$MSG_NO_PREV_INSTALL"
    fi
}

# ============================================
# تثبيت النظامي
# ============================================
install_system_wide() {
    print_info "$MSG_INSTALLING_SYSTEM"
    
    # طلب صلاحيات sudo
    sudo -v
    if [ $? -ne 0 ]; then
        print_error "❌ Failed to get sudo permissions. Cannot install system-wide."
        return 1
    fi

    # إنشاء المجلد الدائم
    local perm_dir="$HOME/.local/share/gt-customterminal"
    mkdir -p "$perm_dir"
    
    # نسخ الملفات من الدليل المؤقت إلى المجلد الدائم
    echo "Copying files to $perm_dir ..."
    cp -f ./* "$perm_dir/" 2>/dev/null

    # تثبيت الأوامر النظامية
    sudo cp "$perm_dir/gt-customterminal.sh" "/usr/local/bin/gt-terminal"
    sudo chmod +x "/usr/local/bin/gt-terminal"
    
    sudo ln -sf "/usr/local/bin/gt-terminal" "/usr/local/bin/gt-term"
    
    # نسخ أداة الإزالة
    sudo cp "$perm_dir/uninstall.sh" "/usr/local/bin/gt-uninstall" 2>/dev/null
    sudo chmod +x "/usr/local/bin/gt-uninstall" 2>/dev/null

    # حفظ اللغة
    mkdir -p "$HOME/.config/gt-customterminal"
    echo "$LANG_MODE" > "$HOME/.config/gt-customterminal/language"

    print_success "$MSG_INSTALL_SUCCESS"
    echo ""
    echo "$MSG_RUN_COMMANDS"
    echo ""

    # تشغيل الأداة
    print_info "$MSG_STARTING"
    sleep 2
    gt-terminal
    
    # بعد الخروج من الأداة
    echo ""
    print_success "$MSG_FINAL_NOTE"
    exit 0
}

# ============================================
# التنفيذ الرئيسي
# ============================================

# التحقق من التثبيت السابق
check_previous_installation

# سؤال التثبيت النظامي
echo "────────────────────────────────────────────────────────────"
print_info "$MSG_ASK_SYSTEM_INSTALL"
read -p "[y/N]: " system_install

if [[ "$system_install" =~ ^[Yy]$ ]]; then
    install_system_wide
    # إذا فشل التثبيت النظامي، نستمر في التشغيل المحلي
fi

# تشغيل الأداة محلياً (من الدليل المؤقت)
echo ""
print_info "$MSG_RUNNING_LOCAL"
sleep 2

# حفظ اللغة للاستخدام المستقبلي
echo "$LANG_MODE" > .language

# تشغيل الأداة الرئيسية
./gt-customterminal.sh

# بعد الخروج من الأداة
echo ""
echo "════════════════════════════════════════════════════════════"
if [ "$AR_MODE" = true ]; then
    echo "📌 الأداة ما زالت في الدليل المؤقت: $PWD"
    echo "   سيتم حذف هذا الدليل عند إعادة تشغيل النظام."
    echo ""
    echo "للتثبيت الدائم، قم بتشغيل هذا المثبت مرة أخرى واختر التثبيت النظامي."
else
    echo "📌 Tool is still in temporary directory: $PWD"
    echo "   This directory will be deleted on system reboot."
    echo ""
    echo "For permanent installation, run this installer again and choose system-wide install."
fi
echo "════════════════════════════════════════════════════════════"
print_success "$MSG_FINAL_NOTE"
