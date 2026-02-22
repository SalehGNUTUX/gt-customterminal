#!/bin/bash

# ============================================
# GT-customterminal - Terminal Customization Tool
# Developer: SalehGNUTUX
# Version: 1.0.4
# Repository: https://github.com/SalehGNUTUX/gt-customterminal
# ============================================

# معلومات الأداة
TOOL_NAME="GT-customterminal"
DEV_NAME="SalehGNUTUX"
VERSION="1.0.4"
REPO_URL="https://github.com/SalehGNUTUX/gt-customterminal"

# المسارات
CONFIG_DIR="$HOME/.config/gt-customterminal"
BACKUP_DIR="$CONFIG_DIR/backups"
LOG_FILE="$CONFIG_DIR/gt-terminal.log"
LANG_FILE="$CONFIG_DIR/language"
VERSION_FILE="$CONFIG_DIR/version"

# نظام اللغة
LANG_MODE="AR"
if [ -f "$LANG_FILE" ]; then
    LANG_MODE=$(cat "$LANG_FILE")
fi

# الألوان
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# ============================================
# نظام الترجمة
# ============================================

# رسائل بالعربية
AR_MESSAGES=(
    "welcome=مرحباً! جميع العمليات تخضع للنسخ الاحتياطي التلقائي"
    "restore_note=يمكنك استرجاع إعداداتك في أي وقت من الخيار 7"
    "menu_title=🛡️  $TOOL_NAME v$VERSION - بأمان كامل"
    "choose_option=اختر خياراً [0-11]: "
    "press_enter=اضغط Enter للمتابعة... "
    "success=✓ تم بنجاح:"
    "error=✗ خطأ:"
    "warning=⚠ تحذير:"
    "info=🔍"
    "backup_created=✓ تم إنشاء نسخة احتياطية:"
    "file_not_found=⚠ الملف غير موجود:"
    "installing=📦 جاري التثبيت:"
    "customizing=🎨 جاري التخصيص:"
    "checking=🔍 جاري التحقق:"
    "applying=⚡ جاري التطبيق:"
    "updating=🔄 جاري التحديث:"
    "operation_cancelled=⚠ تم إلغاء العملية"
    "no_selection=⚠ لم يتم اختيار أي شيء"
    "already_exists=⚠ موجود مسبقاً:"
    "thank_you=🙏 شكراً لاستخدامك $TOOL_NAME!"
    "need_sudo=🔐 تحتاج صلاحيات sudo للمتابعة..."
    "no_internet=❌ لا يوجد اتصال بالإنترنت"
    "update_available=🔄 يتوفر تحديث جديد:"
    "current_version=الإصدار الحالي:"
    "latest_version=أنت تستخدم أحدث إصدار"
    "install_all=⚡ جاري تثبيت جميع الخيارات..."
    "all_installed=🎉 تم تثبيت جميع الميزات بنجاح!"
    "select_tools=📦 اختر الأدوات المساعدة:"
    "select_numbers=اختر أرقاماً مفصولة بمسافات"
    "install_all_tools=تثبيت جميع الأدوات الموصى بها"
    "cancel_install=إلغاء التثبيت"
    "selected_tools=الأدوات المختارة:"
    "confirm_install=هل تريد تثبيت هذه الأدوات؟"
    "tools_installed=✓ تم تثبيت الأدوات المساعدة بنجاح"
    "tools_failed=✗ فشل تثبيت بعض الأدوات"
    "terminal_styles=🎨 أنماط تخصيص الطرفية:"
    "style1=🌟 رسالة ترحيب بسيطة"
    "style2=👤 معلومات المستخدم + التوزيعة"
    "style3=💻 معلومات النظام الكاملة"
    "style4=📊 عرض استخدام الموارد"
    "style5=🚀 لوحة معلومات النظام الشاملة"
    "styleC=✏️  تخصيص مخصص"
    "back_menu=↩️  العودة للقائمة"
    "choose_style=اختر النمط [1-5/C/0]: "
    "terminal_done=✓ تم تخصيص الطرفية بنجاح"
    "preview_next=🔍 معاينة (ستظهر عند فتح طرفية جديدة):"
    "security_menu=🔒 تحسينات أمان بسيطة:"
    "security_safe=آمنة للاستخدام اليومي"
    "sec1=عرض محاولات الدخول الأخيرة"
    "sec2=فحص أذونات ملفات SSH"
    "sec3=عرض اتصالات الشبكة النشطة"
    "sec4=التحقق من تحديثات النظام"
    "sec5=حالة الجدار الناري الأساسي"
    "back_menu2=العودة للقائمة"
    "choose_security=اختر خياراً [0-5]: "
    "recent_logins=📋 آخر 10 محاولات دخول:"
    "ssh_permissions=🔐 أذونات مجلد SSH:"
    "ssh_secured=✓ تم تأمين أذونات SSH"
    "no_ssh_dir=⚠ لم يتم العثور على مجلد SSH"
    "network_connections=🌐 اتصالات الشبكة النشطة:"
    "checking_updates=🔄 جاري التحقق من تحديثات النظام..."
    "firewall_status=🛡️  حالة الجدار الناري:"
    "no_firewall=⚠ لم يتم العثور على مدير جدار ناري"
    "restore_menu=🛡️  استرجاع الإعدادات - $TOOL_NAME"
    "restore_bashrc=استرجاع bashrc"
    "restore_zshrc=استرجاع zshrc"
    "restore_sudoers=استرجاع sudoers"
    "view_changelog=عرض سجل التغييرات"
    "list_backups=عرض جميع النسخ الاحتياطية"
    "back_main=العودة للقائمة الرئيسية"
    "choose_restore=اختر خياراً [0-5]: "
    "change_log=📋 سجل التغييرات:"
    "no_changes=لا توجد تغييرات مسجلة بعد"
    "all_backups=💾 جميع النسخ الاحتياطية في"
    "no_backups=لم يتم العثور على نسخ احتياطية"
    "language_menu=🌐 تغيير اللغة:"
    "current_lang_ar=اللغة الحالية: العربية"
    "change_to_en=التغيير إلى الإنجليزية؟"
    "lang_changed=✓ تم تغيير اللغة إلى الإنجليزية"
    "run_now=هل تريد تشغيل الأداة الآن؟"
    "low_storage=⚠ مساحة التخزين منخفضة"
    "continue_anyway=المتابعة على أي حال؟"
    "powerline_installing=📦 جاري تثبيت Powerline..."
    "powerline_done=✓ تم تثبيت وإعداد Powerline بنجاح"
    "powerline_exists=⚠ إعدادات Powerline موجودة مسبقاً"
    "powerline_failed=✗ فشل تثبيت Powerline"
    "password_stars=🔒 تفعيل إظهار نجمات كلمة المرور..."
    "stars_done=✓ تم تفعيل النجمات بنجاح"
    "stars_exists=⚠ إعدادات النجمات موجودة مسبقاً"
    "pkg_not_supported=✗ مدير الحزم غير مدعوم"
    "shell_not_supported=✗ نوع الطرفية غير مدعوم"
    "backups_for=النسخ الاحتياطية المتاحة لـ"
    "cancel=إلغاء"
    "backup_restored=✓ تم استرجاع الملف بنجاح"
    "backup_not_found=✗ النسخة الاحتياطية غير موجودة"
    "checking_updates_tool=🔍 جاري التحقق من التحديثات..."
    "update_confirm=هل تريد التحديث الآن؟"
    "update_done=✓ تم التحديث بنجاح إلى الإصدار"
    "update_failed=✗ فشل التحديث"
    "update_restart=🔄 جاري إعادة تشغيل الأداة..."
    "uninstall_tool=🗑️  إلغاء تثبيت الأداة..."
    "uninstall_confirm=هل تريد إلغاء تثبيت الأداة؟"
    "uninstall_done=✓ تم إلغاء التثبيت بنجاح"
    "keep_config=هل تريد الاحتفاظ بملفات الإعدادات؟"
    "config_kept=✓ تم الاحتفاظ بملفات الإعدادات في"
    "config_removed=✓ تم حذف جميع ملفات الإعدادات"
    "restart_terminal=🔄 يرجى إعادة فتح الطرفية لتطبيق التغييرات"
    "swap_menu=💾 إدارة مساحة الإبدال (Swap)"
    "swap_option1=1. إعداد ZRAM (مضغوط)"
    "swap_option2=2. إنشاء ملف Swap تقليدي"
    "swap_option3=3. عرض حالة Swap الحالية"
    "swap_option4=4. إلغاء تهيئة Swap"
    "back_to_main=↩️  العودة للقائمة الرئيسية"
    "choose_swap=اختر خياراً [0-4]: "
    "zram_installing=📦 جاري تثبيت وإعداد ZRAM..."
    "enter_swap_size=أدخل حجم مساحة الإبدال بالغيغابايت (GB): "
    "swap_created=✓ تم إنشاء مساحة إبدال بحجم"
    "swap_exists=⚠ مساحة الإبدال موجودة مسبقاً"
    "swap_removed=✓ تم إزالة مساحة الإبدال"
    "no_swap=⚠ لا توجد مساحة إبدال مثبتة"
    "current_swap_status=📊 حالة Swap الحالية:"
    "swap_total=الحجم الكلي:"
    "swap_used=المستخدم:"
    "swap_free=المتاح:"
    "swap_percent=النسبة:"
    "gb=جيجابايت"
    "mb=ميجابايت"
    "confirm_remove=هل تريد إزالة مساحة الإبدال؟"
    "operation_completed=✓ تمت العملية بنجاح"
    "not_installed=⚠ الأداة غير مثبتة نظامياً. يرجى تشغيل المثبت أولاً: curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/git.sh | bash"
)

# رسائل بالإنجليزية
EN_MESSAGES=(
    "welcome=Welcome! All operations include automatic backup"
    "restore_note=You can restore your settings anytime from option 7"
    "menu_title=🛡️  $TOOL_NAME v$VERSION - Safe Customization"
    "choose_option=Choose option [0-11]: "
    "press_enter=Press Enter to continue... "
    "success=✓ Success:"
    "error=✗ Error:"
    "warning=⚠ Warning:"
    "info=🔍"
    "backup_created=✓ Backup created:"
    "file_not_found=⚠ File not found:"
    "installing=📦 Installing:"
    "customizing=🎨 Customizing:"
    "checking=🔍 Checking:"
    "applying=⚡ Applying:"
    "updating=🔄 Updating:"
    "operation_cancelled=⚠ Operation cancelled"
    "no_selection=⚠ No selection made"
    "already_exists=⚠ Already exists:"
    "thank_you=🙏 Thank you for using $TOOL_NAME!"
    "need_sudo=🔐 Need sudo permissions to continue..."
    "no_internet=❌ No internet connection"
    "update_available=🔄 New version available:"
    "current_version=Current version:"
    "latest_version=You have the latest version"
    "install_all=⚡ Installing all options..."
    "all_installed=🎉 All features installed successfully!"
    "select_tools=📦 Select helper tools:"
    "select_numbers=Select numbers separated by spaces"
    "install_all_tools=Install all recommended tools"
    "cancel_install=Cancel installation"
    "selected_tools=Selected tools:"
    "confirm_install=Install selected tools?"
    "tools_installed=✓ Helper tools installed successfully"
    "tools_failed=✗ Some tools failed to install"
    "terminal_styles=🎨 Terminal Customization Styles:"
    "style1=🌟 Simple welcome message"
    "style2=👤 User + Distribution info"
    "style3=💻 Full system information"
    "style4=📊 Resource usage display"
    "style5=🚀 Comprehensive System Dashboard"
    "styleC=✏️  Custom configuration"
    "back_menu=↩️  Back to menu"
    "choose_style=Choose style [1-5/C/0]: "
    "terminal_done=✓ Terminal customized successfully"
    "preview_next=🔍 Preview (will appear on next terminal opening):"
    "security_menu=🔒 Simple Security Enhancements:"
    "security_safe=Safe for everyday use"
    "sec1=Show recent login attempts"
    "sec2=Check SSH file permissions"
    "sec3=Show active network connections"
    "sec4=Check for system updates"
    "sec5=Basic firewall status"
    "back_menu2=Back to menu"
    "choose_security=Choose option [0-5]: "
    "recent_logins=📋 Last 10 login attempts:"
    "ssh_permissions=🔐 SSH directory permissions:"
    "ssh_secured=✓ SSH permissions secured"
    "no_ssh_dir=⚠ No SSH directory found"
    "network_connections=🌐 Active network connections:"
    "checking_updates=🔄 Checking for system updates..."
    "firewall_status=🛡️  Firewall status:"
    "no_firewall=⚠ No firewall manager found"
    "restore_menu=🛡️  Restore Settings - $TOOL_NAME"
    "restore_bashrc=Restore bashrc"
    "restore_zshrc=Restore zshrc"
    "restore_sudoers=Restore sudoers"
    "view_changelog=View change log"
    "list_backups=List all backups"
    "back_main=Back to main menu"
    "choose_restore=Choose option [0-5]: "
    "change_log=📋 Change Log:"
    "no_changes=No changes recorded yet"
    "all_backups=💾 All backups in"
    "no_backups=No backups found"
    "language_menu=🌐 Change Language:"
    "current_lang_en=Current language: English"
    "change_to_ar=Change to Arabic?"
    "lang_changed=✓ Language changed to Arabic"
    "run_now=Run the tool now?"
    "low_storage=⚠ Low storage space"
    "continue_anyway=Continue anyway?"
    "powerline_installing=📦 Installing Powerline..."
    "powerline_done=✓ Powerline installed and configured successfully"
    "powerline_exists=⚠ Powerline configuration already exists"
    "powerline_failed=✗ Powerline installation failed"
    "password_stars=🔒 Enabling password stars..."
    "stars_done=✓ Password stars enabled successfully"
    "stars_exists=⚠ Password stars setting already exists"
    "pkg_not_supported=✗ Package manager not supported"
    "shell_not_supported=✗ Shell type not supported"
    "backups_for=Available backups for"
    "cancel=Cancel"
    "backup_restored=✓ File restored successfully"
    "backup_not_found=✗ Backup not found"
    "checking_updates_tool=🔍 Checking for updates..."
    "update_confirm=Update now?"
    "update_done=✓ Updated successfully to version"
    "update_failed=✗ Update failed"
    "update_restart=🔄 Restarting the tool..."
    "uninstall_tool=🗑️  Uninstalling tool..."
    "uninstall_confirm=Do you want to uninstall the tool?"
    "uninstall_done=✓ Uninstall completed successfully"
    "keep_config=Keep configuration files?"
    "config_kept=✓ Configuration files kept in"
    "config_removed=✓ All configuration files removed"
    "restart_terminal=🔄 Please restart your terminal to apply changes"
    "swap_menu=💾 Swap Space Management"
    "swap_option1=1. Setup ZRAM (Compressed)"
    "swap_option2=2. Create traditional Swap file"
    "swap_option3=3. Show current Swap status"
    "swap_option4=4. Remove Swap configuration"
    "back_to_main=↩️  Back to main menu"
    "choose_swap=Choose option [0-4]: "
    "zram_installing=📦 Installing and configuring ZRAM..."
    "enter_swap_size=Enter swap size in gigabytes (GB): "
    "swap_created=✓ Swap space created with size"
    "swap_exists=⚠ Swap space already exists"
    "swap_removed=✓ Swap space removed"
    "no_swap=⚠ No swap space configured"
    "current_swap_status=📊 Current Swap Status:"
    "swap_total=Total size:"
    "swap_used=Used:"
    "swap_free=Free:"
    "swap_percent=Percentage:"
    "gb=GB"
    "mb=MB"
    "confirm_remove=Do you want to remove swap space?"
    "operation_completed=✓ Operation completed successfully"
    "not_installed=⚠ Tool not installed system-wide. Please run the installer first: curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/git.sh | bash"
)

# دالة الترجمة
translate() {
    local key="$1"
    local param="$2"

    if [ "$LANG_MODE" = "EN" ]; then
        for msg in "${EN_MESSAGES[@]}"; do
            if [[ "$msg" == "$key="* ]]; then
                local message="${msg#*=}"
                if [ -n "$param" ]; then
                    echo "$message $param"
                else
                    echo "$message"
                fi
                return
            fi
        done
        echo "$key"
    else
        for msg in "${AR_MESSAGES[@]}"; do
            if [[ "$msg" == "$key="* ]]; then
                local message="${msg#*=}"
                if [ -n "$param" ]; then
                    echo "$message $param"
                else
                    echo "$message"
                fi
                return
            fi
        done
        echo "$key"
    fi
}

# دوال الطباعة الملونة
print_color() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

print_success() {
    print_color "$GREEN" "$1"
}

print_error() {
    print_color "$RED" "$1"
}

print_warning() {
    print_color "$YELLOW" "$1"
}

print_info() {
    print_color "$BLUE" "$1"
}

# ============================================
# وظائف النظام الأساسية
# ============================================

# تهيئة النظام
init_system() {
    mkdir -p "$CONFIG_DIR" "$BACKUP_DIR"
    touch "$LOG_FILE"

    if [ ! -f "$VERSION_FILE" ]; then
        echo "$VERSION" > "$VERSION_FILE"
    fi

    if [ ! -f "$LANG_FILE" ]; then
        echo "$LANG_MODE" > "$LANG_FILE"
    fi
}

# تسجيل الأحداث
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# اكتشاف مدير الحزم
detect_package_manager() {
    if command -v apt &> /dev/null; then
        echo "apt"
    elif command -v pacman &> /dev/null; then
        echo "pacman"
    elif command -v dnf &> /dev/null; then
        echo "dnf"
    elif command -v yum &> /dev/null; then
        echo "yum"
    elif command -v zypper &> /dev/null; then
        echo "zypper"
    else
        echo "unsupported"
        return 1
    fi
}

# دالة الحصول على معلومات Swap (آمنة بدون أخطاء)
get_swap_info() {
    local swap_info=$(free -h | grep -i swap || echo "Swap: 0B 0B 0B")

    # استخراج المعلومات بطريقة آمنة
    local swap_total=$(echo "$swap_info" | awk '{print $2}')
    local swap_used=$(echo "$swap_info" | awk '{print $3}')
    local swap_free=$(echo "$swap_info" | awk '{print $4}')

    # إذا لم توجد معلومات swap
    if [ -z "$swap_total" ] || [ "$swap_total" = "0B" ]; then
        swap_total="0"
        swap_used="0"
        swap_free="0"
    fi

    echo "$swap_total|$swap_used|$swap_free"
}

# النسخ الاحتياطي للملف
backup_file() {
    local file_path=$1
    local description=$2
    local backup_name=$(basename "$file_path")
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local backup_file="$BACKUP_DIR/${backup_name}.backup_${timestamp}"

    if [ -f "$file_path" ]; then
        cp "$file_path" "$backup_file"
        log "BACKUP: $description - $file_path -> $backup_file"
        print_success "$(translate "backup_created") $backup_file"
        return 0
    else
        print_warning "$(translate "file_not_found") $file_path"
        return 1
    fi
}

# استرجاع ملف
restore_file() {
    local original_file=$1
    local backup_name=$(basename "$original_file")

    echo ""
    echo "$(translate "backups_for") $backup_name:"
    echo "═════════════════════════════════════════"

    local backups=($(ls -1t "$BACKUP_DIR" | grep "$backup_name.backup_" | head -10))

    if [ ${#backups[@]} -eq 0 ]; then
        print_error "$(translate "file_not_found") backups"
        return 1
    fi

    for i in "${!backups[@]}"; do
        echo "$(($i+1)). ${backups[$i]}"
    done

    echo "0. $(translate "cancel")"
    echo "═════════════════════════════════════════"

    read -p "$(if [ "$LANG_MODE" = "EN" ]; then echo "Choose backup number to restore (0 to cancel): "; else echo "اختر رقم النسخة للاسترجاع (0 للإلغاء): "; fi)" restore_choice

    if [ "$restore_choice" -eq 0 ] 2>/dev/null; then
        print_warning "$(translate "operation_cancelled")"
        return 1
    fi

    local backup_file="${backups[$(($restore_choice-1))]}"
    local full_backup_path="$BACKUP_DIR/$backup_file"

    if [ -f "$full_backup_path" ]; then
        sudo cp "$full_backup_path" "$original_file"
        log "RESTORE: Restored $original_file from $backup_file"
        print_success "$(translate "backup_restored")"
    else
        print_error "$(translate "backup_not_found")"
        return 1
    fi
}

# ============================================
# إدارة Swap/ZRAM
# ============================================

# إظهار حالة Swap الحالية
show_swap_status() {
    echo ""
    echo "$(translate "current_swap_status")"
    echo "═════════════════════════════════════════"

    # استخدام دالة آمنة للحصول على معلومات swap
    local swap_info=$(get_swap_info)
    local swap_total=$(echo "$swap_info" | cut -d'|' -f1)
    local swap_used=$(echo "$swap_info" | cut -d'|' -f2)
    local swap_free=$(echo "$swap_info" | cut -d'|' -f3)

    if [ "$swap_total" = "0" ] || [ -z "$swap_total" ]; then
        print_warning "$(translate "no_swap")"
    else
        echo "$(translate "swap_total") $swap_total"
        echo "$(translate "swap_used") $swap_used"
        echo "$(translate "swap_free") $swap_free"

        # حساب النسبة المئوية إذا أمكن
        if [ "$swap_total" != "0" ] && [ "$swap_used" != "0" ]; then
            # تحويل إلى بايت أولاً للحساب
            local total_mb=$(echo "$swap_total" | sed 's/[^0-9.]//g')
            local used_mb=$(echo "$swap_used" | sed 's/[^0-9.]//g')

            if [[ "$total_mb" =~ ^[0-9.]+$ ]] && [[ "$used_mb" =~ ^[0-9.]+$ ]] && [ $(echo "$total_mb > 0" | bc -l 2>/dev/null) = "1" ]; then
                local percent=$(echo "scale=1; $used_mb * 100 / $total_mb" | bc 2>/dev/null || echo "0")
                echo "$(translate "swap_percent") ${percent}%"
            fi
        fi
    fi

    echo "═════════════════════════════════════════"

    # إظهار معلومات إضافية
    echo ""
    echo "📋 معلومات إضافية:"
    echo "─────────────────────────────────────────"
    swapon --show 2>/dev/null || echo "لا توجد معلومات تفصيلية متاحة"
    echo "─────────────────────────────────────────"
}

# إعداد ZRAM
setup_zram() {
    print_info "$(translate "zram_installing")"

    # التحقق من وجود swap حالياً
    local current_swap=$(swapon --show | wc -l)
    if [ "$current_swap" -gt 1 ]; then
        print_warning "$(translate "swap_exists")"
        show_swap_status
        return 1
    fi

    echo ""
    read -p "$(translate "enter_swap_size")" swap_size

    # التحقق من صحة المدخل
    if ! [[ "$swap_size" =~ ^[0-9]+$ ]] || [ "$swap_size" -lt 1 ] || [ "$swap_size" -gt 32 ]; then
        print_error "$(if [ "$LANG_MODE" = "EN" ]; then echo "Invalid size. Please enter a number between 1 and 32 GB"; else echo "حجم غير صالح. الرجاء إدخال رقم بين 1 و 32 جيجابايت"; fi)"
        return 1
    fi

    # تثبيت zram-tools إذا لم يكن مثبتاً
    pkg_manager=$(detect_package_manager)

    case $pkg_manager in
        apt)
            sudo apt update && sudo apt install -y zram-tools
            ;;
        pacman)
            sudo pacman -S --noconfirm zram-generator
            ;;
        dnf)
            sudo dnf install -y zram-generator
            ;;
        yum)
            sudo yum install -y zram-generator
            ;;
        *)
            print_error "$(translate "pkg_not_supported")"
            return 1
            ;;
    esac

    if [ $? -ne 0 ]; then
        print_error "$(if [ "$LANG_MODE" = "EN" ]; then echo "Failed to install ZRAM tools"; else echo "فشل تثبيت أدوات ZRAM"; fi)"
        return 1
    fi

    # تهيئة ZRAM
    # إنشاء ملف إعدادات ZRAM
    sudo tee /etc/default/zram-swap << EOF
# ZRAM configuration - GT-customterminal
ALGO=lz4
PERCENT=50
PRIORITY=100
EOF

    # إعادة تشغيل خدمة ZRAM
    if systemctl list-unit-files | grep -q zram; then
        sudo systemctl restart zram-swap
    else
        sudo modprobe zram
        echo "zram" | sudo tee /etc/modules-load.d/zram.conf
        sudo systemctl daemon-reload
    fi

    print_success "$(translate "swap_created") ${swap_size}$(translate "gb")"
    log "SWAP: ZRAM configured with ${swap_size}GB"

    show_swap_status
}

# إنشاء ملف swap تقليدي
create_swap_file() {
    print_info "$(if [ "$LANG_MODE" = "EN" ]; then echo "Creating traditional swap file..."; else echo "جاري إنشاء ملف swap تقليدي..."; fi)"

    # التحقق من وجود swap حالياً
    local current_swap=$(swapon --show | wc -l)
    if [ "$current_swap" -gt 1 ]; then
        print_warning "$(translate "swap_exists")"
        show_swap_status
        return 1
    fi

    echo ""
    read -p "$(translate "enter_swap_size")" swap_size

    # التحقق من صحة المدخل
    if ! [[ "$swap_size" =~ ^[0-9]+$ ]] || [ "$swap_size" -lt 1 ] || [ "$swap_size" -gt 32 ]; then
        print_error "$(if [ "$LANG_MODE" = "EN" ]; then echo "Invalid size. Please enter a number between 1 and 32 GB"; else echo "حجم غير صالح. الرجاء إدخال رقم بين 1 و 32 جيجابايت"; fi)"
        return 1
    fi

    # حساب الحجم بالميجابايت
    local swap_mb=$((swap_size * 1024))

    # إنشاء ملف swap
    sudo fallocate -l ${swap_size}G /swapfile
    if [ $? -ne 0 ]; then
        # إذا فشل fallocate، استخدم dd
        sudo dd if=/dev/zero of=/swapfile bs=1M count=$swap_mb
    fi

    # تعيين الصلاحيات
    sudo chmod 600 /swapfile

    # تهيئة swap
    sudo mkswap /swapfile
    sudo swapon /swapfile

    # إضافة إلى fstab للتشغيل التلقائي
    echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

    # ضبط swappiness (اختياري)
    echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p

    print_success "$(translate "swap_created") ${swap_size}$(translate "gb")"
    log "SWAP: Traditional swap file created with ${swap_size}GB"

    show_swap_status
}

# إزالة swap
remove_swap() {
    echo ""
    read -p "$(translate "confirm_remove") (y/n): " confirm_remove

    if [ "$confirm_remove" != "y" ] && [ "$confirm_remove" != "Y" ]; then
        print_warning "$(translate "operation_cancelled")"
        return
    fi

    # إيقاف swap الحالي
    sudo swapoff -a

    # إزالة ملف swap إذا كان موجوداً
    if [ -f "/swapfile" ]; then
        sudo rm -f /swapfile
        # إزالة من fstab
        sudo sed -i '/\/swapfile/d' /etc/fstab
    fi

    # إيقاف ZRAM إذا كان مفعلاً
    if systemctl list-unit-files | grep -q zram; then
        sudo systemctl stop zram-swap
        sudo systemctl disable zram-swap
    fi

    print_success "$(translate "swap_removed")"
    log "SWAP: Swap configuration removed"

    show_swap_status
}

# قائمة إدارة swap
swap_management_menu() {
    while true; do
        echo ""
        echo "$(translate "swap_menu")"
        echo "═════════════════════════════════════════"
        echo "$(translate "swap_option1")"
        echo "$(translate "swap_option2")"
        echo "$(translate "swap_option3")"
        echo "$(translate "swap_option4")"
        echo "0. $(translate "back_to_main")"
        echo "═════════════════════════════════════════"

        read -p "$(translate "choose_swap")" swap_choice

        case $swap_choice in
            1) setup_zram ;;
            2) create_swap_file ;;
            3) show_swap_status ;;
            4) remove_swap ;;
            0) break ;;
            *) print_error "$(translate "error") $(if [ "$LANG_MODE" = "EN" ]; then echo "Invalid option"; else echo "خيار غير صحيح"; fi)" ;;
        esac

        echo ""
        read -p "$(translate "press_enter")" dummy
    done
}

# ============================================
# إلغاء التثبيت
# ============================================

uninstall_tool() {
    print_info "$(translate "uninstall_tool")"

    if [ "$LANG_MODE" = "EN" ]; then
        read -p "$(translate "uninstall_confirm") (y/n): " confirm_uninstall
    else
        read -p "$(translate "uninstall_confirm") (y/n): " confirm_uninstall
    fi

    if [ "$confirm_uninstall" != "y" ] && [ "$confirm_uninstall" != "Y" ]; then
        print_warning "$(translate "operation_cancelled")"
        return
    fi

    # التحقق مما إذا كانت الأداة مثبتة نظامياً
    INSTALL_DIR="/usr/local/bin"
    SYSTEM_INSTALLED=false
    
    if [ -f "$INSTALL_DIR/gt-terminal" ] || [ -f "/usr/local/bin/gt-term" ]; then
        SYSTEM_INSTALLED=true
    fi

    if [ "$SYSTEM_INSTALLED" = false ]; then
        print_warning "الأداة غير مثبتة نظامياً. سيتم حذف الملفات المحلية فقط."
    fi

    # إزالة الملفات النظامية إذا كانت موجودة
    if [ "$SYSTEM_INSTALLED" = true ]; then
        echo ""
        print_info "إزالة الملفات النظامية..."
        
        if [ -f "$INSTALL_DIR/gt-terminal" ]; then
            sudo rm -f "$INSTALL_DIR/gt-terminal"
            print_success "$(if [ "$LANG_MODE" = "EN" ]; then echo "Removed: $INSTALL_DIR/gt-terminal"; else echo "تم إزالة: $INSTALL_DIR/gt-terminal"; fi)"
        fi

        if [ -f "/usr/local/bin/gt-term" ]; then
            sudo rm -f "/usr/local/bin/gt-term"
            print_success "$(if [ "$LANG_MODE" = "EN" ]; then echo "Removed: /usr/local/bin/gt-term"; else echo "تم إزالة: /usr/local/bin/gt-term"; fi)"
        fi
    fi

    # سؤال عن إبقاء ملفات الإعدادات
    echo ""
    if [ "$LANG_MODE" = "EN" ]; then
        read -p "$(translate "keep_config") (y/n): " keep_config
    else
        read -p "$(translate "keep_config") (y/n): " keep_config
    fi

    if [ "$keep_config" = "y" ] || [ "$keep_config" = "Y" ]; then
        print_success "$(translate "config_kept") $CONFIG_DIR"
        log "UNINSTALL: Tool uninstalled, config kept"
    else
        rm -rf "$CONFIG_DIR"
        print_success "$(translate "config_removed")"
        log "UNINSTALL: Tool uninstalled, config removed"
    fi

    print_success "$(translate "uninstall_done")"
    print_info "$(translate "restart_terminal")"

    exit 0
}

# ============================================
# وظائف التثبيت (تعديل: إزالة التثبيت الذاتي)
# ============================================

# تثبيت Powerline
install_powerline() {
    print_info "$(translate "powerline_installing")"

    backup_file "$HOME/.bashrc" "Before installing Powerline"
    backup_file "$HOME/.zshrc" "Before installing Powerline"

    pkg_manager=$(detect_package_manager)

    case $pkg_manager in
        apt)
            sudo apt update && sudo apt install -y powerline fonts-powerline python3-powerline
            ;;
        pacman)
            sudo pacman -Syu --noconfirm powerline powerline-fonts powerline-vim
            ;;
        dnf)
            sudo dnf install -y powerline powerline-fonts python3-powerline
            ;;
        yum)
            sudo yum install -y powerline powerline-fonts python-powerline
            ;;
        zypper)
            sudo zypper install -y powerline powerline-fonts python3-powerline
            ;;
        *)
            print_error "$(translate "pkg_not_supported")"
            return 1
            ;;
    esac

    if [ $? -eq 0 ]; then
        local shell_config=""
        case $SHELL in
            *bash*) shell_config="$HOME/.bashrc" ;;
            *zsh*) shell_config="$HOME/.zshrc" ;;
            *) print_error "$(translate "shell_not_supported")"; return 1 ;;
        esac

        if ! grep -q "POWERLINE" "$shell_config"; then
            cat >> "$shell_config" << 'EOF'

# Powerline settings - GT-customterminal
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bindings/bash/powerline.sh
fi
EOF
            print_success "$(translate "powerline_done")"
        else
            print_warning "$(translate "powerline_exists")"
        fi

        log "INSTALL: Powerline installed"
    else
        print_error "$(translate "powerline_failed")"
        return 1
    fi
}

# نجمات كلمة المرور
enable_password_stars() {
    print_info "$(translate "password_stars")"

    backup_file "/etc/sudoers" "Before adding pwfeedback"

    if sudo grep -q "Defaults.*pwfeedback" /etc/sudoers; then
        print_warning "$(translate "stars_exists")"
    else
        echo 'Defaults        pwfeedback' | sudo EDITOR='tee -a' visudo > /dev/null 2>&1

        if sudo visudo -c > /dev/null 2>&1; then
            print_success "$(translate "stars_done")"
            log "CONFIG: Added pwfeedback to sudoers"
        else
            print_error "$(translate "error") $(if [ "$LANG_MODE" = "EN" ]; then echo "Failed to modify sudoers"; else echo "خطأ في التعديل"; fi)"
            if [ "$LANG_MODE" = "EN" ]; then
                read -p "Restore backup? (y/n): " restore_backup
            else
                read -p "هل تريد استرجاع النسخة الاحتياطية؟ (y/n): " restore_backup
            fi
            if [ "$restore_backup" = "y" ] || [ "$restore_backup" = "Y" ]; then
                restore_file "/etc/sudoers"
            fi
            return 1
        fi
    fi
}

# تثبيت الأدوات المساعدة
install_helpers() {
    print_info "$(translate "installing") $(if [ "$LANG_MODE" = "EN" ]; then echo "helper tools"; else echo "الأدوات المساعدة"; fi)"

    pkg_manager=$(detect_package_manager)

    local tools=()
    local packages_available=""

    case $pkg_manager in
        apt)
            tools=(
                "htop:Process monitor - مراقب العمليات"
                "tree:Directory tree viewer - عارض هيكلة المجلدات"
                "neofetch:System info display - عرض معلومات النظام"
                "curl:URL transfer tool - أداة نقل البيانات"
                "wget:Web downloader - منزل صفحات الويب"
                "git:Version control system - نظام التحكم بالإصدارات"
                "nmap:Network scanner - ماسح الشبكة"
                "tldr:Simplified man pages - صفحات مساعدة مبسطة"
                "batcat:Syntax highlighting for cat - cat مع تلوين الصياغة"
                "ncdu:Disk usage analyzer - محلل استخدام القرص"
                "vim:Advanced text editor - محرر نصوص متقدم"
                "tmux:Terminal multiplexer - مضاعف الطرفية"
            )
            packages_available="htop tree neofetch curl wget git nmap tldr batcat ncdu vim tmux"
            ;;
        pacman|dnf|yum|zypper)
            tools=(
                "htop:Process monitor - مراقب العمليات"
                "tree:Directory tree viewer - عارض هيكلة المجلدات"
                "neofetch:System info display - عرض معلومات النظام"
                "curl:URL transfer tool - أداة نقل البيانات"
                "wget:Web downloader - منزل صفحات الويب"
                "git:Version control system - نظام التحكم بالإصدارات"
                "nmap:Network scanner - ماسح الشبكة"
                "tldr:Simplified man pages - صفحات مساعدة مبسطة"
                "bat:Syntax highlighting for cat - cat مع تلوين الصياغة"
                "ncdu:Disk usage analyzer - محلل استخدام القرص"
                "vim:Advanced text editor - محرر نصوص متقدم"
                "tmux:Terminal multiplexer - مضاعف الطرفية"
            )
            packages_available="htop tree neofetch curl wget git nmap tldr bat ncdu vim tmux"
            ;;
        *)
            print_error "$(translate "pkg_not_supported")"
            return 1
            ;;
    esac

    echo ""
    echo "$(translate "select_tools")"
    echo "$(translate "select_numbers")"
    echo "═════════════════════════════════════════"

    local selected_tools=()
    for i in "${!tools[@]}"; do
        local tool_info=(${tools[$i]//:/ })
        local tool_name="${tool_info[0]}"
        local tool_desc="${tool_info[1]}"

        if [ "$LANG_MODE" = "EN" ]; then
            local desc_part=$(echo $tool_desc | cut -d'-' -f1)
        else
            local desc_part=$(echo $tool_desc | cut -d'-' -f2)
        fi

        printf "%-2s) %-12s - %s\n" "$(($i+1))" "$tool_name" "$desc_part"
        selected_tools[$i]="0"
    done

    echo "A) $(translate "install_all_tools")"
    echo "0) $(translate "cancel_install")"
    echo "═════════════════════════════════════════"

    read -p "$(if [ "$LANG_MODE" = "EN" ]; then echo "Select tools [numbers/A/0]: "; else echo "اختر الأدوات [أرقام/A/0]: "; fi)" choices

    if [[ "$choices" == "0" ]]; then
        print_warning "$(translate "operation_cancelled")"
        return
    fi

    local install_list=""
    if [[ "$choices" == "A" || "$choices" == "a" ]]; then
        install_list="$packages_available"
        if [ "$LANG_MODE" = "EN" ]; then
            echo "Selected: All recommended tools"
        else
            echo "المختار: جميع الأدوات الموصى بها"
        fi
    else
        for choice in $choices; do
            if [[ $choice =~ ^[0-9]+$ ]] && [ $choice -ge 1 ] && [ $choice -le ${#tools[@]} ]; then
                local tool_index=$(($choice-1))
                local tool_name=$(echo "${tools[$tool_index]}" | cut -d':' -f1)
                install_list="$install_list $tool_name"
                selected_tools[$tool_index]="1"
            fi
        done

        if [ -z "$install_list" ]; then
            print_warning "$(translate "no_selection")"
            return
        fi

        echo ""
        echo "$(translate "selected_tools")$install_list"
    fi

    echo ""
    read -p "$(translate "confirm_install") (y/n): " confirm_install

    if [ "$confirm_install" != "y" ] && [ "$confirm_install" != "Y" ]; then
        print_warning "$(translate "operation_cancelled")"
        return
    fi

    case $pkg_manager in
        apt)
            sudo apt update && sudo apt install -y $install_list
            ;;
        pacman)
            sudo pacman -S --noconfirm $install_list
            ;;
        dnf)
            sudo dnf install -y $install_list
            ;;
        yum)
            sudo yum install -y $install_list
            ;;
        zypper)
            sudo zypper install -y $install_list
            ;;
    esac

    if [ $? -eq 0 ]; then
        print_success "$(translate "tools_installed")"
        log "INSTALL: Installed tools: $install_list"
    else
        print_error "$(translate "tools_failed")"
    fi
}

# تخصيص الطرفية
customize_terminal() {
    print_info "$(translate "customizing") $(if [ "$LANG_MODE" = "EN" ]; then echo "terminal appearance"; else echo "مظهر الطرفية"; fi)"

    local shell_config=""
    case $SHELL in
        *bash*) shell_config="$HOME/.bashrc" ;;
        *zsh*) shell_config="$HOME/.zshrc" ;;
        *) print_error "$(translate "shell_not_supported")"; return 1 ;;
    esac

    backup_file "$shell_config" "Before customizing terminal"

    sed -i '/# ======= GT-customterminal Customization =======/,/# ======= End GT-customterminal =======/d' "$shell_config" 2>/dev/null

    echo ""
    echo "$(translate "terminal_styles")"
    echo "═════════════════════════════════════════"
    echo "1) $(translate "style1")"
    echo "2) $(translate "style2")"
    echo "3) $(translate "style3")"
    echo "4) $(translate "style4")"
    echo "5) $(translate "style5")"
    echo "C) $(translate "styleC")"
    echo "0) $(translate "back_menu")"
    echo "═════════════════════════════════════════"

    read -p "$(translate "choose_style")" style_choice

    if [[ "$style_choice" == "0" ]]; then
        print_warning "$(translate "operation_cancelled")"
        return
    fi

    local welcome_message=""

    case $style_choice in
        1)
            if [ "$LANG_MODE" = "EN" ]; then
                welcome_message='echo -e "\033[1;36m══════════════════════════════════════════\033[0m"
echo -e "\033[1;36m      🌟 WELCOME TO YOUR SYSTEM 🌟     \033[0m"
echo -e "\033[1;36m══════════════════════════════════════════\033[0m"
echo -e "\033[1;33mHello \033[1;32m$(whoami)\033[1;33m! Have a productive day!\033[0m"
echo'
            else
                welcome_message='echo -e "\033[1;36m══════════════════════════════════════════\033[0m"
echo -e "\033[1;36m      🌟 مرحباً بك في نظامك 🌟        \033[0m"
echo -e "\033[1;36m══════════════════════════════════════════\033[0m"
echo -e "\033[1;33mمرحباً \033[1;32m$(whoami)\033[1;33m! أتمنى لك يوماً مثمراً!\033[0m"
echo'
            fi
            ;;
        2)
            if [ "$LANG_MODE" = "EN" ]; then
                welcome_message='echo -e "\033[1;35m══════════════════════════════════════════\033[0m"
echo -e "\033[1;35m        🖥️  USER INFORMATION         \033[0m"
echo -e "\033[1;35m══════════════════════════════════════════\033[0m"
echo -e "👤 \033[1;34mUser:\033[0m     \033[1;32m$(whoami)\033[0m"
echo -e "🐧 \033[1;34mDistro:\033[0m    \033[1;32m$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || echo "Unknown")\033[0m"
echo -e "📅 \033[1;34mDate:\033[0m      \033[1;32m$(date +"%A, %d %B %Y")\033[0m"
echo -e "⏰ \033[1;34mTime:\033[0m      \033[1;32m$(date +"%I:%M:%S %p")\033[0m"
echo'
            else
                welcome_message='echo -e "\033[1;35m══════════════════════════════════════════\033[0m"
echo -e "\033[1;35m        🖥️  معلومات المستخدم         \033[0m"
echo -e "\033[1;35m══════════════════════════════════════════\033[0m"
echo -e "👤 \033[1;34mالمستخدم:\033[0m     \033[1;32m$(whoami)\033[0m"
echo -e "🐧 \033[1;34mالتوزيعة:\033[0m      \033[1;32m$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || echo "غير معروف")\033[0m"
echo -e "📅 \033[1;34mالتاريخ:\033[0m       \033[1;32m$(date +"%A، %d %B %Y")\033[0m"
echo -e "⏰ \033[1;34mالوقت:\033[0m         \033[1;32m$(date +"%I:%M:%S %p")\033[0m"
echo'
            fi
            ;;
        3)
            if [ "$LANG_MODE" = "EN" ]; then
                welcome_message='echo -e "\033[1;32m══════════════════════════════════════════\033[0m"
echo -e "\033[1;32m        🖥️  SYSTEM INFORMATION         \033[0m"
echo -e "\033[1;32m══════════════════════════════════════════\033[0m"
echo -e "👤 \033[1;34mUser:\033[0m       \033[1;32m$(whoami)\033[0m"
echo -e "🐧 \033[1;34mDistro:\033[0m      \033[1;32m$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || echo "Unknown")\033[0m"
echo -e "🏗️  \033[1;34mKernel:\033[0m     \033[1;32m$(uname -r)\033[0m"
echo -e "🖥️  \033[1;34mArch:\033[0m       \033[1;32m$(uname -m)\033[0m"
echo -e "⏰ \033[1;34mUptime:\033[0m      \033[1;32m$(uptime -p | sed '"'"'s/up //'"'"')\033[0m"
echo -e "📅 \033[1;34mDate:\033[0m        \033[1;32m$(date +"%Y-%m-%d %H:%M:%S")\033[0m"
echo'
            else
                welcome_message='echo -e "\033[1;32m══════════════════════════════════════════\033[0m"
echo -e "\033[1;32m        🖥️  معلومات النظام           \033[0m"
echo -e "\033[1;32m══════════════════════════════════════════\033[0m"
echo -e "👤 \033[1;34mالمستخدم:\033[0m       \033[1;32m$(whoami)\033[0m"
echo -e "🐧 \033[1;34mالتوزيعة:\033[0m        \033[1;32m$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || echo "غير معروف")\033[0m"
echo -e "🏗️  \033[1;34mالنواة:\033[0m         \033[1;32m$(uname -r)\033[0m"
echo -e "🖥️  \033[1;34mالمعمارية:\033[0m      \033[1;32m$(uname -m)\033[0m"
echo -e "⏰ \033[1;34مدة التشغيل:\033[0m     \033[1;32m$(uptime -p | sed '"'"'s/up //'"'"')\033[0m"
echo -e "📅 \033[1;34mالتاريخ:\033[0m         \033[1;32m$(date +"%Y-%m-%d %H:%M:%S")\033[0m"
echo'
            fi
            ;;
        4)
            if [ "$LANG_MODE" = "EN" ]; then
                welcome_message='echo -e "\033[1;33m══════════════════════════════════════════\033[0m"
echo -e "\033[1;33m        📊 SYSTEM RESOURCES           \033[0m"
echo -e "\033[1;33m══════════════════════════════════════════\033[0m"
echo -e "🔥 \033[1;34mCPU Usage:\033[0m   \033[1;32m$(top -bn1 | grep "Cpu(s)" | awk "{print \$2}" | cut -d"'"%"'" -f1)%\033[0m"
echo -e "💾 \033[1;34mRAM Usage:\033[0m   \033[1;32m$(free -m | awk "/Mem:/ {printf \"%d/%dMB (%.1f%%)\", \$3, \$2, \$3*100/\$2}")\033[0m"
echo -e "💿 \033[1;34mDisk Usage:\033[0m  \033[1;32m$(df -h / | awk "NR==2 {print \$5}")\033[0m"
echo -e "🌡️  \033[1;34mLoad Avg:\033[0m    \033[1;32m$(uptime | awk -F"load average:" "{print \$2}")\033[0m"
echo -e "👥 \033[1;34mUsers:\033[0m       \033[1;32m$(who | wc -l) connected\033[0m"
echo'
            else
                welcome_message='echo -e "\033[1;33m══════════════════════════════════════════\033[0m"
echo -e "\033[1;33m        📊 موارد النظام              \033[0m"
echo -e "\033[1;33m══════════════════════════════════════════\033[0m"
echo -e "🔥 \033[1;34mاستخدام المعالج:\033[0m   \033[1;32m$(top -bn1 | grep "Cpu(s)" | awk "{print \$2}" | cut -d"'"%"'" -f1)%\033[0m"
echo -e "💾 \033[1;34mاستخدام الذاكرة:\033[0m   \033[1;32m$(free -m | awk "/Mem:/ {printf \"%d/%d ميجابايت (%.1f%%)\", \$3, \$2, \$3*100/\$2}")\033[0m"
echo -e "💿 \033[1;34mاستخدام القرص:\033[0m     \033[1;32m$(df -h / | awk "NR==2 {print \$5}")\033[0m"
echo -e "🌡️  \033[1;34mمتوسط الحمل:\033[0m      \033[1;32m$(uptime | awk -F"load average:" "{print \$2}")\033[0m"
echo -e "👥 \033[1;34mالمستخدمون:\033[0m        \033[1;32m$(who | wc -l) متصل\033[0m"
echo'
            fi
            ;;
        5)
            if [ "$LANG_MODE" = "EN" ]; then
                welcome_message='echo -e "\033[1;36m════════════════════════════════════════════════════════════\033[0m"
echo -e "\033[1;36m              🚀 SYSTEM DASHBOARD\033[0m"
echo -e "\033[1;36m════════════════════════════════════════════════════════════\033[0m"
echo -e "👤  \033[1;34mUser:\033[0m    \033[1;32m$(whoami)\033[0m"
echo -e "🐧  \033[1;34mOS:\033[0m      \033[1;32m$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1)\033[0m"
echo -e "🏗️   \033[1;34mKernel:\033[0m \033[1;32m$(uname -r)\033[0m"
echo -e "⏰  \033[1;34mUptime:\033[0m  \033[1;32m$(uptime -p | sed '"'"'s/up //'"'"')\033[0m"
echo -e "🔥  \033[1;34mCPU:\033[0m     \033[1;32m$(top -bn1 | grep "Cpu(s)" | awk "{print \$2}" | cut -d"'"%"'" -f1)%\033[0m"
echo -e "💾  \033[1;34mRAM:\033[0m     \033[1;32m$(free -m | awk "/Mem:/ {printf \"%d/%dMB\", \$3, \$2}")\033[0m"
echo -e "💾  \033[1;34mSwap:\033[0m    \033[1;32m$(free -h | grep -i swap | awk "{print \$3 \"/\" \$2}" || echo "0/0")\033[0m"
echo -e "📅  \033[1;34mDate:\033[0m    \033[1;32m$(date +"%Y-%m-%d %H:%M:%S")\033[0m"
echo -e "\033[1;36m════════════════════════════════════════════════════════════\033[0m"'
            else
                welcome_message='echo -e "\033[1;36m════════════════════════════════════════════════════════════\033[0m"
echo -e "\033[1;36m              🚀 لوحة معلومات النظام الشاملة\033[0m"
echo -e "\033[1;36m════════════════════════════════════════════════════════════\033[0m"
echo -e "👤  \033[1;34mUser:\033[0m    \033[1;32m$(whoami)\033[0m"
echo -e "🐧  \033[1;34mOS:\033[0m      \033[1;32m$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1)\033[0m"
echo -e "🏗️   \033[1;34mKernel:\033[0m \033[1;32m$(uname -r)\033[0m"
echo -e "⏰  \033[1;34mUptime:\033[0m  \033[1;32m$(uptime -p | sed '"'"'s/up //'"'"')\033[0m"
echo -e "🔥  \033[1;34mCPU:\033[0m     \033[1;32m$(top -bn1 | grep "Cpu(s)" | awk "{print \$2}" | cut -d"'"%"'" -f1)%\033[0m"
echo -e "💾  \033[1;34mRAM:\033[0m     \033[1;32m$(free -m | awk "/Mem:/ {printf \"%d/%dMB\", \$3, \$2}")\033[0m"
echo -e "💾  \033[1;34mSwap:\033[0m    \033[1;32m$(free -h | grep -i swap | awk "{print \$3 \"/\" \$2}" || echo "0/0")\033[0m"
echo -e "📅  \033[1;34mDate:\033[0m    \033[1;32m$(date +"%Y-%m-%d %H:%M:%S")\033[0m"
echo -e "\033[1;36m════════════════════════════════════════════════════════════\033[0m"'
            fi
            ;;
        C|c)
            echo ""
            if [ "$LANG_MODE" = "EN" ]; then
                echo "✏️  Enter your custom welcome message:"
                echo "(Use \$(command) for dynamic content)"
                echo "Example: echo 'Welcome \$(whoami)!'"
                echo ""
                read -p "Your custom message: " custom_message
            else
                echo "✏️  أدخل رسالة الترحيب المخصصة:"
                echo "(استخدم \$(command) للمحتوى الديناميكي)"
                echo "مثال: echo 'مرحباً \$(whoami)!'"
                echo ""
                read -p "رسالتك المخصصة: " custom_message
            fi

            if [ -n "$custom_message" ]; then
                welcome_message="$custom_message"
            else
                print_warning "$(translate "operation_cancelled")"
                return
            fi
            ;;
        *)
            print_warning "$(translate "operation_cancelled")"
            return
            ;;
    esac

    cat >> "$shell_config" << EOF

# ======= GT-customterminal Customization =======
# Colors and Aliases
export LS_COLORS='di=1;34:ln=1;36:so=1;35:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='clear'
alias h='history'
alias update-system='sudo apt update && sudo apt upgrade -y 2>/dev/null || sudo pacman -Syu --noconfirm 2>/dev/null || sudo dnf update -y 2>/dev/null'

# Welcome Message
$welcome_message

# Custom Prompt
export PS1='\[\033[1;32m\]\u@\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0m\]\$ '
# ======= End GT-customterminal =======
EOF

    print_success "$(translate "terminal_done")"

    # عرض معاينة بدون أخطاء
    echo ""
    echo "$(translate "preview_next")"
    echo "═════════════════════════════════════════"

    # تشغيل الرسالة الترحيبية في بيئة محمية
    eval "$welcome_message" 2>/dev/null || echo "Preview not available"

    echo "═════════════════════════════════════════"

    log "CONFIG: Terminal customization applied (Style: $style_choice)"
}

# إعدادات الأمان
security_settings() {
    print_info "$(translate "applying") $(if [ "$LANG_MODE" = "EN" ]; then echo "security settings"; else echo "إعدادات الأمان"; fi)"

    echo ""
    echo "$(translate "security_menu")"
    echo "$(translate "security_safe")"
    echo "═════════════════════════════════════════"
    echo "1) $(translate "sec1")"
    echo "2) $(translate "sec2")"
    echo "3) $(translate "sec3")"
    echo "4) $(translate "sec4")"
    echo "5) $(translate "sec5")"
    echo "0) $(translate "back_menu2")"
    echo "═════════════════════════════════════════"

    read -p "$(translate "choose_security")" sec_choice

    case $sec_choice in
        1)
            echo ""
            echo "$(translate "recent_logins")"
            echo "─────────────────────────────────────────"
            last -10 2>/dev/null || echo "No login history available"
            echo "─────────────────────────────────────────"
            ;;
        2)
            echo ""
            if [ -d ~/.ssh ]; then
                echo "$(translate "ssh_permissions")"
                ls -la ~/.ssh/

                chmod 700 ~/.ssh 2>/dev/null
                chmod 600 ~/.ssh/* 2>/dev/null
                chmod 644 ~/.ssh/*.pub 2>/dev/null
                print_success "$(translate "ssh_secured")"
            else
                print_warning "$(translate "no_ssh_dir")"
            fi
            ;;
        3)
            echo ""
            echo "$(translate "network_connections")"
            echo "─────────────────────────────────────────"
            netstat -tulpn 2>/dev/null | head -20 || ss -tulpn 2>/dev/null | head -20 || echo "Network information not available"
            echo "─────────────────────────────────────────"
            ;;
        4)
            echo ""
            echo "$(translate "checking_updates")"

            pkg_manager=$(detect_package_manager)
            case $pkg_manager in
                apt)
                    sudo apt update && apt list --upgradable 2>/dev/null | head -20
                    ;;
                pacman)
                    pacman -Qu 2>/dev/null | head -20
                    ;;
                dnf|yum)
                    dnf check-update 2>/dev/null | head -20 || yum check-update 2>/dev/null | head -20
                    ;;
                *)
                    print_warning "$(translate "error") $(if [ "$LANG_MODE" = "EN" ]; then echo "Cannot check updates automatically"; else echo "لا يمكن التحقق من التحديثات تلقائياً"; fi)"
                    ;;
            esac
            ;;
        5)
            echo ""
            echo "$(translate "firewall_status")"
            echo "─────────────────────────────────────────"

            if command -v ufw &> /dev/null; then
                sudo ufw status verbose 2>/dev/null || echo "UFW status unknown"
            elif command -v firewall-cmd &> /dev/null; then
                sudo firewall-cmd --state 2>/dev/null || echo "Firewall status unknown"
            elif command -v iptables &> /dev/null; then
                sudo iptables -L -n 2>/dev/null | head -30 || echo "IPTables status unknown"
            else
                print_warning "$(translate "no_firewall")"
            fi
            echo "─────────────────────────────────────────"
            ;;
        0)
            print_warning "$(translate "operation_cancelled")"
            return
            ;;
        *)
            print_error "$(translate "error") $(if [ "$LANG_MODE" = "EN" ]; then echo "Invalid option"; else echo "خيار غير صحيح"; fi)"
            ;;
    esac

    log "SECURITY: Security check performed (Option: $sec_choice)"
}

# تثبيت كل الخيارات
install_all() {
    print_info "$(translate "install_all")"

    read -p "$(translate "install_confirm") (y/n): " confirm_all

    if [ "$confirm_all" != "y" ] && [ "$confirm_all" != "Y" ]; then
        print_warning "$(translate "operation_cancelled")"
        return
    fi

    echo ""
    echo "═════════════════════════════════════════"
    install_powerline
    echo "═════════════════════════════════════════"
    enable_password_stars
    echo "═════════════════════════════════════════"
    install_helpers
    echo "═════════════════════════════════════════"
    customize_terminal
    echo "═════════════════════════════════════════"

    print_success "$(translate "all_installed")"
    log "INSTALL: All features installed"
}

# استرجاع الإعدادات
show_restore_menu() {
    while true; do
        echo ""
        echo "$(translate "restore_menu")"
        echo "═════════════════════════════════════════"
        echo "1) $(translate "restore_bashrc")"
        echo "2) $(translate "restore_zshrc")"
        echo "3) $(translate "restore_sudoers")"
        echo "4) $(translate "view_changelog")"
        echo "5) $(translate "list_backups")"
        echo "0) $(translate "back_main")"
        echo "═════════════════════════════════════════"

        read -p "$(translate "choose_restore")" restore_choice

        case $restore_choice in
            1) restore_file "$HOME/.bashrc" ;;
            2) restore_file "$HOME/.zshrc" ;;
            3) restore_file "/etc/sudoers" ;;
            4)
                echo ""
                echo "$(translate "change_log")"
                echo "═════════════════════════════════════════"
                if [ -f "$LOG_FILE" ]; then
                    tail -50 "$LOG_FILE"
                else
                    echo "$(translate "no_changes")"
                fi
                echo "═════════════════════════════════════════"
                ;;
            5)
                echo ""
                echo "$(translate "all_backups") $BACKUP_DIR:"
                echo "═════════════════════════════════════════"
                ls -la "$BACKUP_DIR/" 2>/dev/null || echo "$(translate "no_backups")"
                echo "═════════════════════════════════════════"
                ;;
            0) break ;;
            *) print_error "$(translate "error") $(if [ "$LANG_MODE" = "EN" ]; then echo "Invalid option"; else echo "خيار غير صحيح"; fi)" ;;
        esac

        read -p "$(translate "press_enter")" dummy
    done
}

# التحقق من التحديثات
check_updates() {
    print_info "$(translate "checking_updates_tool")"

    local current_version=$(cat "$VERSION_FILE" 2>/dev/null || echo "$VERSION")
    local latest_version="$current_version"

    if command -v curl &> /dev/null; then
        latest_version=$(curl -s --connect-timeout 5 "https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/version.txt" 2>/dev/null || echo "$current_version")
    elif command -v wget &> /dev/null; then
        latest_version=$(wget -qO- --timeout=5 "https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/version.txt" 2>/dev/null || echo "$current_version")
    fi

    latest_version=$(echo "$latest_version" | grep -v '^<' | head -1 | tr -d '[:space:]')

    if [[ "$latest_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] && [ "$latest_version" != "$current_version" ]; then
        echo ""
        print_color "$YELLOW" "$(translate "update_available") $latest_version"
        print_color "$YELLOW" "$(translate "current_version") $current_version"
        echo ""

        read -p "$(translate "update_confirm") (y/n): " update_choice

        if [ "$update_choice" = "y" ] || [ "$update_choice" = "Y" ]; then
            # تنزيل النسخة الجديدة من git.sh الذي سيقوم بالتحديث
            print_info "Please run the installer again to update:"
            echo "curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/git.sh | bash"
        fi
    else
        print_success "$(translate "latest_version") ($current_version)"
    fi
}

# تغيير اللغة
change_language() {
    echo ""
    if [ "$LANG_MODE" = "EN" ]; then
        echo "$(translate "language_menu")"
        echo "$(translate "current_lang_en")"
        read -p "$(translate "change_to_ar") (y/n): " lang_confirm
        if [ "$lang_confirm" = "y" ] || [ "$lang_confirm" = "Y" ]; then
            LANG_MODE="AR"
            echo "AR" > "$LANG_FILE"
            print_success "$(translate "lang_changed")"
            log "LANGUAGE: Changed to Arabic"

            echo ""
            echo "═════════════════════════════════════════"
            echo "تم تغيير اللغة إلى العربية (AR)"
            echo "جاري إعادة تشغيل الأداة..."
            echo "═════════════════════════════════════════"
            sleep 2
            exec "$0"
        fi
    else
        echo "$(translate "language_menu")"
        echo "$(translate "current_lang_ar")"
        read -p "$(translate "change_to_en") (y/n): " lang_confirm
        if [ "$lang_confirm" = "y" ] || [ "$lang_confirm" = "Y" ]; then
            LANG_MODE="EN"
            echo "EN" > "$LANG_FILE"
            print_success "$(translate "lang_changed")"
            log "LANGUAGE: Changed to English"

            echo ""
            echo "═════════════════════════════════════════"
            echo "Language changed to English (EN)"
            echo "Restarting the tool..."
            echo "═════════════════════════════════════════"
            sleep 2
            exec "$0"
        fi
    fi
}

# التحقق من النظام
pre_install_check() {
    if command -v sudo &> /dev/null; then
        if ! sudo -n true 2>/dev/null; then
            print_info "$(translate "need_sudo")"
            sudo -v
            if [ $? -ne 0 ]; then
                print_warning "Some features may not work without sudo permissions"
            fi
        fi
    fi

    # التحقق من مساحة التخزين (اختياري)
    if command -v df &> /dev/null; then
        local available_space=$(df / | awk 'NR==2 {print $4}')
        if [ "$available_space" -lt 50000 ]; then
            print_warning "$(translate "low_storage")"
        fi
    fi
}

# التحقق من التثبيت النظامي (وظيفة جديدة)
check_system_installation() {
    if [ ! -f "/usr/local/bin/gt-terminal" ] && [ ! -f "/usr/local/bin/gt-term" ]; then
        # الأداة غير مثبتة نظامياً
        if [ "$LANG_MODE" = "EN" ]; then
            print_warning "Tool is not installed system-wide."
            echo ""
            echo "To install it system-wide, please run:"
            echo "  curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/git.sh | bash"
            echo ""
            echo "Continuing in local mode..."
        else
            print_warning "الأداة غير مثبتة نظامياً."
            echo ""
            echo "لتثبيتها نظامياً، يرجى تشغيل:"
            echo "  curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/git.sh | bash"
            echo ""
            echo "جارٍ التشغيل في الوضع المحلي..."
        fi
        echo ""
        sleep 2
    fi
}

# عرض القائمة الرئيسية
show_menu() {
    clear
    echo -e "
$(translate "menu_title")
${BLUE}$(if [ "$LANG_MODE" = "EN" ]; then echo "Developer: $DEV_NAME"; else echo "مطور: $DEV_NAME"; fi)${NC}
${CYAN}$(if [ "$LANG_MODE" = "EN" ]; then echo "Language: English (EN)"; else echo "اللغة: العربية (AR)"; fi)${NC}
═════════════════════════════════════════
1. 📦 $(if [ "$LANG_MODE" = "EN" ]; then echo "Install Powerline"; else echo "تثبيت Powerline"; fi)
2. 🔒 $(if [ "$LANG_MODE" = "EN" ]; then echo "Password stars"; else echo "نجمات كلمة المرور"; fi)
3. 🛠️  $(if [ "$LANG_MODE" = "EN" ]; then echo "Helper tools"; else echo "أدوات مساعدة"; fi)
4. 🎨 $(if [ "$LANG_MODE" = "EN" ]; then echo "Customize terminal"; else echo "تخصيص الطرفية"; fi)
5. 🛡️  $(if [ "$LANG_MODE" = "EN" ]; then echo "Security settings"; else echo "إعدادات الأمان"; fi)
6. ⚡ $(if [ "$LANG_MODE" = "EN" ]; then echo "Install all options"; else echo "تثبيت كل الخيارات"; fi)
7. 💾 $(if [ "$LANG_MODE" = "EN" ]; then echo "Restore settings"; else echo "استرجاع الإعدادات"; fi)
8. 🔄 $(if [ "$LANG_MODE" = "EN" ]; then echo "Update tool"; else echo "تحديث الأداة"; fi)
9. 🌐 $(if [ "$LANG_MODE" = "EN" ]; then echo "Change language"; else echo "تغيير اللغة"; fi)
10. 💾 $(if [ "$LANG_MODE" = "EN" ]; then echo "Swap Management"; else echo "إدارة مساحة الإبدال"; fi)
11. 🗑️  $(if [ "$LANG_MODE" = "EN" ]; then echo "Uninstall tool"; else echo "إلغاء تثبيت الأداة"; fi)
0. 🚪 $(if [ "$LANG_MODE" = "EN" ]; then echo "Exit"; else echo "الخروج"; fi)
═════════════════════════════════════════"
}

# الرئيسي
main() {
    init_system

    # التحقق من التثبيت النظامي (وظيفة جديدة)
    check_system_installation

    # التحقق من التحديثات إذا كانت الأداة مثبتة نظامياً
    if [ -f "/usr/local/bin/gt-terminal" ]; then
        check_updates
        echo ""
    fi

    pre_install_check

    echo ""
    print_color "$GREEN" "$(translate "welcome")"
    print_color "$BLUE" "$(translate "restore_note")"
    echo ""

    while true; do
        show_menu
        echo ""
        read -p "$(translate "choose_option")" choice

        case $choice in
            1) install_powerline ;;
            2) enable_password_stars ;;
            3) install_helpers ;;
            4) customize_terminal ;;
            5) security_settings ;;
            6) install_all ;;
            7) show_restore_menu ;;
            8) check_updates ;;  # تعديل: استدعاء check_updates بدلاً من update_tool
            9) change_language ;;
            10) swap_management_menu ;;
            11) uninstall_tool ;;
            0)
                echo ""
                print_color "$GREEN" "$(translate "thank_you")"
                exit 0
                ;;
            *)
                print_error "$(translate "error") $(if [ "$LANG_MODE" = "EN" ]; then echo "Invalid option"; else echo "خيار غير صحيح"; fi)"
                ;;
        esac

        echo ""
        read -p "$(translate "press_enter")" dummy
    done
}

# بداية البرنامج
main "$@"
