#!/bin/bash

# ============================================
# GT-customterminal Installer
# Developer: SalehGNUTUX
# Version: 2.0.0
# Repository: https://github.com/SalehGNUTUX/gt-customterminal
# ============================================

TOOL_NAME="GT-customterminal"
DEV_NAME="SalehGNUTUX"
REPO_URL="https://github.com/SalehGNUTUX/gt-customterminal"
RAW_BASE="https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main"
MAIN_SCRIPT_URL="$RAW_BASE/gt-customterminal.sh"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="$HOME/.config/gt-customterminal"
VERSION_FILE="$CONFIG_DIR/version"
INSTALL_BIN="$INSTALL_DIR/gt-terminal"
WORK_DIR="$HOME/.gt-customterminal-src"

# الألوان
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

print_success() { echo -e "${GREEN}✓ $1${NC}"; }
print_error()   { echo -e "${RED}✗ $1${NC}"; }
print_warning() { echo -e "${YELLOW}⚠ $1${NC}"; }
print_info()    { echo -e "${BLUE}➜ $1${NC}"; }
print_step()    { echo -e "${CYAN}[*] $1${NC}"; }

# قراءة آمنة تعمل مع curl | bash
safe_read() {
    local prompt="$1"
    local varname="$2"
    local answer
    if [ -t 0 ]; then
        read -p "$prompt" answer
    else
        read -p "$prompt" answer < /dev/tty
    fi
    eval "$varname=\$answer"
}

# ============================================
# الشعار
# ============================================
show_banner() {
    clear
    echo ""
    echo -e "${CYAN}╔══════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}  🛠️   ${GREEN}GT-customterminal Installer${NC}         ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  👨‍💻   Developer: ${YELLOW}$DEV_NAME${NC}            ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  🌐   $REPO_URL  ${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════╝${NC}"
    echo ""
}

# ============================================
# اختيار اللغة
# ============================================
select_language() {
    echo "🌐 Please select language / الرجاء اختيار اللغة:"
    echo "   1) 🇸🇦 العربية (AR)"
    echo "   2) 🇺🇸 English (EN)"
    echo ""
    safe_read "Choice [1-2] (default: 2): " lang_choice

    case $lang_choice in
        1)
            LANG_MODE="AR"
            echo -e "${GREEN}✓ تم اختيار اللغة العربية${NC}"
            ;;
        *)
            LANG_MODE="EN"
            echo -e "${GREEN}✓ English language selected${NC}"
            ;;
    esac
    echo ""
}

# ============================================
# رسائل اللغة
# ============================================
msg() {
    local key="$1"
    if [ "$LANG_MODE" = "AR" ]; then
        case $key in
            checking_net)     echo "🔍 جاري التحقق من الاتصال بالإنترنت..." ;;
            net_ok)           echo "✓ الاتصال بالإنترنت جيد" ;;
            net_fail)         echo "❌ لا يوجد اتصال بالإنترنت. يرجى التحقق والمحاولة مرة أخرى." ;;
            need_sudo)        echo "🔐 جاري التحقق من صلاحيات sudo..." ;;
            sudo_fail)        echo "❌ فشل الحصول على صلاحيات sudo" ;;
            downloading)      echo "📥 جاري تنزيل الملفات إلى: $WORK_DIR" ;;
            download_ok)      echo "✓ تم تنزيل الملفات بنجاح" ;;
            download_fail)    echo "❌ فشل في تنزيل الملفات" ;;
            already_installed) echo "⚠ الأداة مثبتة مسبقاً في: $INSTALL_BIN" ;;
            installed_ver)    echo "   الإصدار المثبت:" ;;
            remote_ver)       echo "   الإصدار المتاح:" ;;
            choose_action)    echo "ماذا تريد أن تفعل؟" ;;
            opt_reinstall)    echo "   1) إعادة التثبيت (الإصدار نفسه)" ;;
            opt_update)       echo "   2) تحديث إلى أحدث إصدار" ;;
            opt_remove)       echo "   3) إلغاء التثبيت وإعادة التثبيت من جديد" ;;
            opt_cancel)       echo "   4) إلغاء العملية والخروج" ;;
            cancelled)        echo "⚠ تم إلغاء العملية" ;;
            removing_old)     echo "🗑️  جاري إزالة النسخة القديمة..." ;;
            remove_ok)        echo "✓ تمت إزالة النسخة القديمة" ;;
            installing)       echo "📦 جاري التثبيت النظامي..." ;;
            install_ok)       echo "🎉 تم تثبيت $TOOL_NAME بنجاح!" ;;
            run_with)         echo "🎯 يمكنك الآن تشغيل الأداة باستخدام:" ;;
            launch_now)       echo "هل تريد تشغيل الأداة الآن؟ (y/n): " ;;
            restart_terminal) echo "🔄 يرجى إعادة فتح الطرفية لتطبيق التغييرات" ;;
            saved_to)         echo "📁 تم حفظ الملفات في:" ;;
            no_dl_tool)       echo "❌ لم يتم العثور على curl أو wget. يرجى تثبيت أحدهما أولاً." ;;
        esac
    else
        case $key in
            checking_net)     echo "🔍 Checking internet connection..." ;;
            net_ok)           echo "✓ Internet connection OK" ;;
            net_fail)         echo "❌ No internet connection. Please check and try again." ;;
            need_sudo)        echo "🔐 Checking sudo permissions..." ;;
            sudo_fail)        echo "❌ Failed to get sudo permissions" ;;
            downloading)      echo "📥 Downloading files to: $WORK_DIR" ;;
            download_ok)      echo "✓ Files downloaded successfully" ;;
            download_fail)    echo "❌ Failed to download files" ;;
            already_installed) echo "⚠ Tool already installed at: $INSTALL_BIN" ;;
            installed_ver)    echo "   Installed version:" ;;
            remote_ver)       echo "   Available version:" ;;
            choose_action)    echo "What would you like to do?" ;;
            opt_reinstall)    echo "   1) Reinstall (same version)" ;;
            opt_update)       echo "   2) Update to latest version" ;;
            opt_remove)       echo "   3) Uninstall and reinstall fresh" ;;
            opt_cancel)       echo "   4) Cancel and exit" ;;
            cancelled)        echo "⚠ Operation cancelled" ;;
            removing_old)     echo "🗑️  Removing old version..." ;;
            remove_ok)        echo "✓ Old version removed" ;;
            installing)       echo "📦 Installing to system..." ;;
            install_ok)       echo "🎉 $TOOL_NAME installed successfully!" ;;
            run_with)         echo "🎯 You can now run the tool using:" ;;
            launch_now)       echo "Launch the tool now? (y/n): " ;;
            restart_terminal) echo "🔄 Please restart your terminal to apply changes" ;;
            saved_to)         echo "📁 Files saved to:" ;;
            no_dl_tool)       echo "❌ Neither curl nor wget found. Please install one first." ;;
        esac
    fi
}

# ============================================
# دالة التنزيل
# ============================================
download_file() {
    local url="$1"
    local dest="$2"

    if command -v curl &>/dev/null; then
        curl -sSL -o "$dest" "$url"
    elif command -v wget &>/dev/null; then
        wget -q -O "$dest" "$url"
    else
        print_error "$(msg no_dl_tool)"
        exit 1
    fi
}

# ============================================
# التحقق من الاتصال
# ============================================
check_internet() {
    print_step "$(msg checking_net)"
    if ! ping -c 1 github.com &>/dev/null 2>&1; then
        print_error "$(msg net_fail)"
        exit 1
    fi
    print_success "$(msg net_ok)"
    echo ""
}

# ============================================
# التحقق من sudo
# ============================================
check_sudo() {
    print_step "$(msg need_sudo)"
    if ! sudo -v 2>/dev/null; then
        print_error "$(msg sudo_fail)"
        exit 1
    fi
    print_success "OK"
    echo ""
}

# ============================================
# الحصول على الإصدار من ملف السكريبت
# ============================================
get_remote_version() {
    local tmp_ver
    tmp_ver=$(curl -sSL "$MAIN_SCRIPT_URL" 2>/dev/null | grep '^VERSION=' | head -1 | cut -d'"' -f2)
    echo "${tmp_ver:-unknown}"
}

get_installed_version() {
    if [ -f "$VERSION_FILE" ]; then
        cat "$VERSION_FILE"
    elif [ -f "$INSTALL_BIN" ]; then
        grep '^VERSION=' "$INSTALL_BIN" 2>/dev/null | head -1 | cut -d'"' -f2 || echo "unknown"
    else
        echo ""
    fi
}

# ============================================
# تنزيل الملفات إلى مجلد العمل
# ============================================
download_files() {
    print_step "$(msg downloading)"
    mkdir -p "$WORK_DIR"

    local files=("gt-customterminal.sh" "install.sh" "uninstall.sh")

    for file in "${files[@]}"; do
        print_info "Downloading $file..."
        download_file "$RAW_BASE/$file" "$WORK_DIR/$file"
        if [ $? -ne 0 ]; then
            print_error "$(msg download_fail): $file"
            exit 1
        fi
        chmod +x "$WORK_DIR/$file"
    done

    print_success "$(msg download_ok)"
    print_info "$(msg saved_to) $WORK_DIR"
    echo ""
}

# ============================================
# إزالة النسخة القديمة
# ============================================
remove_old() {
    print_step "$(msg removing_old)"
    sudo rm -f "$INSTALL_BIN" "/usr/local/bin/gt-term" 2>/dev/null
    mkdir -p "$CONFIG_DIR"
    print_success "$(msg remove_ok)"
    echo ""
}

# ============================================
# التثبيت النظامي
# ============================================
do_install() {
    print_step "$(msg installing)"

    sudo cp "$WORK_DIR/gt-customterminal.sh" "$INSTALL_BIN"
    sudo chmod +x "$INSTALL_BIN"
    sudo ln -sf "$INSTALL_BIN" "/usr/local/bin/gt-term" 2>/dev/null

    # حفظ الإصدار واللغة
    mkdir -p "$CONFIG_DIR"
    local ver
    ver=$(grep '^VERSION=' "$WORK_DIR/gt-customterminal.sh" | head -1 | cut -d'"' -f2)
    echo "${ver:-unknown}" > "$VERSION_FILE"
    echo "$LANG_MODE" > "$CONFIG_DIR/language"

    echo ""
    print_success "$(msg install_ok)"
    echo ""
    print_info "$(msg run_with)"
    echo -e "   ${GREEN}gt-terminal${NC}"
    echo -e "   ${GREEN}gt-term${NC}"
    echo ""
}

# ============================================
# التعامل مع الأداة المثبتة مسبقاً
# ============================================
handle_existing_install() {
    local installed_ver remote_ver

    installed_ver=$(get_installed_version)
    echo -e "${YELLOW}$(msg already_installed)${NC}"
    echo -e "$(msg installed_ver) ${CYAN}${installed_ver:-unknown}${NC}"

    # جلب الإصدار البعيد لمقارنته
    print_info "Fetching remote version..."
    remote_ver=$(get_remote_version)
    echo -e "$(msg remote_ver) ${CYAN}${remote_ver}${NC}"
    echo ""

    echo "$(msg choose_action)"
    echo "$(msg opt_reinstall)"
    echo "$(msg opt_update)"
    echo "$(msg opt_remove)"
    echo "$(msg opt_cancel)"
    echo ""
    safe_read "Choice [1-4]: " action_choice

    case $action_choice in
        1)
            # إعادة التثبيت بنفس الإصدار
            download_files
            remove_old
            do_install
            ;;
        2)
            # تحديث: تنزيل أحدث إصدار
            download_files
            remove_old
            do_install
            ;;
        3)
            # إزالة كاملة ثم تثبيت جديد
            remove_old
            # حذف الإعدادات
            safe_read "$(if [ "$LANG_MODE" = "AR" ]; then echo "هل تريد حذف ملفات الإعدادات أيضاً؟ (y/n): "; else echo "Also remove configuration files? (y/n): "; fi)" rm_config
            if [ "$rm_config" = "y" ] || [ "$rm_config" = "Y" ]; then
                rm -rf "$CONFIG_DIR"
                print_success "$(if [ "$LANG_MODE" = "AR" ]; then echo "تم حذف ملفات الإعدادات"; else echo "Configuration files removed"; fi)"
            fi
            echo ""
            download_files
            do_install
            ;;
        4|*)
            print_warning "$(msg cancelled)"
            exit 0
            ;;
    esac
}

# ============================================
# تشغيل الأداة
# ============================================
launch_tool() {
    safe_read "$(msg launch_now)" launch_choice
    if [ "$launch_choice" = "y" ] || [ "$launch_choice" = "Y" ]; then
        exec gt-terminal
    else
        echo ""
        print_info "$(msg restart_terminal)"
        echo ""
    fi
}

# ============================================
# البرنامج الرئيسي
# ============================================
main() {
    show_banner
    select_language
    check_internet
    check_sudo

    # هل الأداة مثبتة مسبقاً؟
    if [ -f "$INSTALL_BIN" ]; then
        handle_existing_install
    else
        # تثبيت جديد
        download_files
        do_install
    fi

    launch_tool

    echo -e "${CYAN}═══════════════════════════════════════════${NC}"
    echo -e "${GREEN}  $TOOL_NAME — Developer: $DEV_NAME${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════${NC}"
    echo ""
}

main "$@"
