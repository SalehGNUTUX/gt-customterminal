# أداة تخصيص الطرفية GT-customterminal

## 📌 نظرة عامة
أداة متكاملة لتخصيص وتحسين تجربة استخدام الطرفية في أنظمة لينكس، مع دعم كامل للغة العربية والإنجليزية، وميزات أمان تلقائية، ونظام نسخ احتياطي مدمج.

**المطور**: SalehGNUTUX  
**الإصدار**: 1.0.4  
**الرخصة**: رخصة جنو العمومية الإصدار الثاني  
**المستودع**: https://github.com/SalehGNUTUX/gt-customterminal

---

## 🚀 طرق التثبيت السريعة

### 1. تثبيت سطر أوامر واحد (موصى به)

# النسخة العربية
```bash
curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/blob/main/install.sh | bash
```
# النسخة الإنجليزية (نفس الأمر)
```bash
curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/blob/main/install.sh | bash
```

### 2. تنزيل وتثبيت يدوي

# تنزيل السكربت
```bash
wget https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/gt-customterminal.sh
```
# منح صلاحيات التنفيذ
```bash
chmod +x gt-customterminal.sh
```
# التشغيل
```bash
./gt-customterminal.sh
```

### 3. التثبيت نظامياً
عند تشغيل السكربت لأول مرة، سيتم سؤالك عن التثبيت النظامي:
```bash
./gt-customterminal.sh
# عندما يُسأل: "هل تريد التثبيت نظامياً لسهولة الوصول؟" → اضغط 'y'
```

بعد التثبيت النظامي، يمكنك التشغيل بأي من:
```bash
gt-terminal  # أو
gt-term
```

---

## 📊 أمثلة من شاشة الطرفية

### لوحة معلومات النظام الشاملة (النمط 5) - النسخة العربية
```
════════════════════════════════════════════════════════════
              🚀 لوحة معلومات النظام الشاملة
════════════════════════════════════════════════════════════
👤  المستخدم:     GNUTUX
🐧  النظام:        ديبيان 13 (تريكسي)
🏗️   النواة:       6.12.57+deb13-amd64
⏰  مدة التشغيل:   3 ساعات، 41 دقيقة
🔥  المعالج:      4.4%
💾  الذاكرة:      5747/7832 ميجابايت
💾  الإبدال:      149 ميجابايت / 7.6 جيجابايت
📅  التاريخ:      2025-12-15 12:19:13
════════════════════════════════════════════════════════════
```

### لوحة معلومات النظام الشاملة (النمط 5) - النسخة الإنجليزية
```
════════════════════════════════════════════════════════════
              🚀 SYSTEM DASHBOARD
════════════════════════════════════════════════════════════
👤  User:    GNUTUX
🐧  OS:      Debian GNU/Linux 13 (trixie)
🏗️   Kernel: 6.12.57+deb13-amd64
⏰  Uptime:  3 hours, 41 minutes
🔥  CPU:     4.4%
💾  RAM:     5747/7832MB
💾  Swap:    149Mi/7.6Gi
📅  Date:    2025-12-15 12:19:13
════════════════════════════════════════════════════════════
```

### القائمة الرئيسية - العربية
```
🛡️  GT-customterminal v1.0.4 - بأمان كامل
مطور: SalehGNUTUX
اللغة: العربية (AR)
═════════════════════════════════════════
1. 📦 تثبيت Powerline
2. 🔒 نجمات كلمة المرور
3. 🛠️  أدوات مساعدة
4. 🎨 تخصيص الطرفية
5. 🛡️  إعدادات الأمان
6. ⚡ تثبيت كل الخيارات
7. 💾 استرجاع الإعدادات
8. 🔄 تحديث الأداة
9. 🌐 تغيير اللغة
10. 💾 إدارة مساحة الإبدال
11. 🗑️  إلغاء تثبيت الأداة
0. 🚪 الخروج
═════════════════════════════════════════
اختر خياراً [0-11]:
```

### القائمة الرئيسية - الإنجليزية
```
🛡️  GT-customterminal v1.0.4 - Safe Customization
Developer: SalehGNUTUX
Language: English (EN)
═════════════════════════════════════════
1. 📦 Install Powerline
2. 🔒 Password stars
3. 🛠️  Helper tools
4. 🎨 Customize terminal
5. 🛡️  Security settings
6. ⚡ Install all options
7. 💾 Restore settings
8. 🔄 Update tool
9. 🌐 Change language
10. 💾 Swap Management
11. 🗑️  Uninstall tool
0. 🚪 Exit
═════════════════════════════════════════
Choose option [0-11]:
```

---

## 🗑️ إلغاء التثبيت

### الخيار 11 من القائمة الرئيسية
```
هل تريد إلغاء تثبيت الأداة؟ (y/n): y

🔧 إزالة الملفات النظامية:
✓ تم إزالة: /usr/local/bin/gt-terminal
✓ تم إزالة: /usr/local/bin/gt-term

هل تريد الاحتفاظ بملفات الإعدادات؟ (y/n): n

✓ تم حذف جميع ملفات الإعدادات
✓ تم إلغاء التثبيت بنجاح
🔄 يرجى إعادة فتح الطرفية لتطبيق التغييرات
```

### إلغاء التثبيت عن بعد
```bash
# إذا كانت مثبتة نظامياً
ssh user@server "gt-terminal"
# ثم اختيار الخيار 11

# أو إزالة يدوية
ssh user@server "sudo rm -f /usr/local/bin/gt-terminal /usr/local/bin/gt-term && rm -rf ~/.config/gt-customterminal"
```

---

## ✨ الميزات الرئيسية

### 🎨 تخصيص الطرفية
- 5 أنماط مختلفة لرسائل الترحيب
- لوحة معلومات النظام الشاملة (عربي/إنجليزي)
- ألوان مخصصة وأسماء مختصرة
- دعم Powerline للطرفية المحسنة

### 🔧 الأدوات المساعدة
- تثبيت أدوات مفيدة تلقائياً
- إدارة مساحة الإبدال (Swap/ZRAM)
- أدوات مراقبة النظام

### 🛡️ تحسينات الأمان
- إظهار نجمات كلمة المرور في sudo
- فحص أذونات SSH
- عرض محاولات الدخول الأخيرة
- مراقبة اتصالات الشبكة

### 💾 نظام النسخ الاحتياطي
- نسخ احتياطي تلقائي لكل التعديلات
- استرجاع سهل للإعدادات السابقة
- سجل تغييرات مفصل

### 🌐 متعدد اللغات
- دعم كامل للعربية والإنجليزية
- تبديل لغوي ديناميكي
- لوحة معلومات بالكامل بالعربية

---

## 📄 الرخصة

### رخصة جنو العمومية الإصدار الثاني (GPLv2)
```
هذا البرنامج مجاني؛ يمكنك إعادة توزيعه و/أو تعديله
تحت بنود رخصة جنو العمومية الإصدار الثاني
المنشورة من قبل مؤسسة البرمجيات الحرة.

يُوزع هذا البرنامج على أمل أن يكون مفيداً،
ولكن دون أي ضمان؛ دون حتى الضمان الضمني
للتسويق أو الملاءمة لغرض معين.
راجع رخصة جنو العمومية لمزيد من التفاصيل.

يجب أن تكون قد تلقيت نسخة من رخصة جنو العمومية
مع هذا البرنامج؛ إذا لم تكن قد تلقيتها،
اكتب إلى: Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
```

### حقوق النسخ
```
حقوق النسخ (C) 2024 SalehGNUTUX

يسمح باستخدام، نسخ، تعديل، و/أو توزيع هذا البرنامج
وفقاً لبنود رخصة جنو العمومية الإصدار الثاني.
```

---

## 🔄 تحديثات متكررة

### التحقق من التحديثات
الأداة تتحقق تلقائياً من التحديثات عند كل تشغيل:
```
🔍 جاري التحقق من التحديثات...
🔄 يتوفر تحديث جديد: 1.0.5
الإصدار الحالي: 1.0.4
هل تريد التحديث الآن؟ (y/n): y
✓ تم التحديث بنجاح إلى الإصدار 1.0.5
🔄 جاري إعادة تشغيل الأداة...
```

### التحديث اليدوي
```bash
# من داخل الأداة: الخيار 8
# أو من السطر:
gt-terminal --update
```

---

## ⚠️ ملاحظات مهمة

### قبل التثبيت
1. تأكد من صلاحيات `sudo`
2. تحقق من اتصال الإنترنت (لتحميل التحديثات)
3. احفظ إعداداتك الحالية

### بعد التثبيت
1. أعد فتح الطرفية لتطبيق التغييرات
2. اختبر الأنماط المختلفة (الخيار 4)
3. استخدم الخيار 6 لتثبيت كل الميزات مرة واحدة

### إلغاء التثبيت
- **الخيار 11 آمن تماماً** - يحفظ نسخاً احتياطية
- يمكن استرجاع الإعدادات في أي وقت (الخيار 7)
- الملفات الشخصية لا يتم حذفها

---

# GT-customterminal - Terminal Customization Tool

## 📌 Overview
A comprehensive tool for customizing and enhancing the Linux terminal experience, with full Arabic/English support, automatic security features, and built-in backup system.

**Developer**: SalehGNUTUX  
**Version**: 1.0.4  
**License**: GNU General Public License v2.0  
**Repository**: https://github.com/SalehGNUTUX/gt-customterminal

---

## 🚀 Quick Installation Methods

### 1. One-Line Remote Installation (Recommended)
```bash
# English version
curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/gt-customterminal.sh | bash

# Arabic version (same command)
curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/gt-customterminal.sh | bash
```

### 2. Manual Download & Install
```bash
# Download the script
wget https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/gt-customterminal.sh

# Make it executable
chmod +x gt-customterminal.sh

# Run it
./gt-customterminal.sh
```

### 3. System-wide Installation
When you first run the script, you'll be prompted to install system-wide:
```bash
./gt-customterminal.sh
# When prompted: "Install system-wide for easy access?" → Press 'y'
```

After system-wide installation, you can run:
```bash
gt-terminal  # or
gt-term
```

---

## 📊 Terminal Screen Examples

### Comprehensive System Dashboard (Style 5) - Arabic Version
```
════════════════════════════════════════════════════════════
              🚀 لوحة معلومات النظام الشاملة
════════════════════════════════════════════════════════════
👤  المستخدم:     GNUTUX
🐧  النظام:        ديبيان 13 (تريكسي)
🏗️   النواة:       6.12.57+deb13-amd64
⏰  مدة التشغيل:   3 ساعات، 41 دقيقة
🔥  المعالج:      4.4%
💾  الذاكرة:      5747/7832 ميجابايت
💾  الإبدال:      149 ميجابايت / 7.6 جيجابايت
📅  التاريخ:      2025-12-15 12:19:13
════════════════════════════════════════════════════════════
```

### Comprehensive System Dashboard (Style 5) - English Version
```
════════════════════════════════════════════════════════════
              🚀 SYSTEM DASHBOARD
════════════════════════════════════════════════════════════
👤  User:    GNUTUX
🐧  OS:      Debian GNU/Linux 13 (trixie)
🏗️   Kernel: 6.12.57+deb13-amd64
⏰  Uptime:  3 hours, 41 minutes
🔥  CPU:     4.4%
💾  RAM:     5747/7832MB
💾  Swap:    149Mi/7.6Gi
📅  Date:    2025-12-15 12:19:13
════════════════════════════════════════════════════════════
```

### Main Menu - Arabic
```
🛡️  GT-customterminal v1.0.4 - بأمان كامل
مطور: SalehGNUTUX
اللغة: العربية (AR)
═════════════════════════════════════════
1. 📦 تثبيت Powerline
2. 🔒 نجمات كلمة المرور
3. 🛠️  أدوات مساعدة
4. 🎨 تخصيص الطرفية
5. 🛡️  إعدادات الأمان
6. ⚡ تثبيت كل الخيارات
7. 💾 استرجاع الإعدادات
8. 🔄 تحديث الأداة
9. 🌐 تغيير اللغة
10. 💾 إدارة مساحة الإبدال
11. 🗑️  إلغاء تثبيت الأداة
0. 🚪 الخروج
═════════════════════════════════════════
اختر خياراً [0-11]:
```

### Main Menu - English
```
🛡️  GT-customterminal v1.0.4 - Safe Customization
Developer: SalehGNUTUX
Language: English (EN)
═════════════════════════════════════════
1. 📦 Install Powerline
2. 🔒 Password stars
3. 🛠️  Helper tools
4. 🎨 Customize terminal
5. 🛡️  Security settings
6. ⚡ Install all options
7. 💾 Restore settings
8. 🔄 Update tool
9. 🌐 Change language
10. 💾 Swap Management
11. 🗑️  Uninstall tool
0. 🚪 Exit
═════════════════════════════════════════
Choose option [0-11]:
```

---

## 🗑️ Uninstallation

### Option 11 from Main Menu
```
Do you want to uninstall the tool? (y/n): y

🔧 Removing system files:
✓ Removed: /usr/local/bin/gt-terminal
✓ Removed: /usr/local/bin/gt-term

Keep configuration files? (y/n): n

✓ All configuration files removed
✓ Uninstall completed successfully
🔄 Please restart your terminal to apply changes
```

### Remote Uninstallation
```bash
# If installed system-wide
ssh user@server "gt-terminal"
# Then choose option 11

# Or manual removal
ssh user@server "sudo rm -f /usr/local/bin/gt-terminal /usr/local/bin/gt-term && rm -rf ~/.config/gt-customterminal"
```

---

## ✨ Key Features

### 🎨 Terminal Customization
- 5 different welcome message styles
- Comprehensive System Dashboard (Arabic/English)
- Custom colors and aliases
- Powerline support for enhanced terminal

### 🔧 Helper Tools
- Automatic installation of useful tools
- Swap/ZRAM space management
- System monitoring tools

### 🛡️ Security Enhancements
- Password stars in sudo
- SSH permissions check
- Recent login attempts display
- Network connection monitoring

### 💾 Backup System
- Automatic backup of all modifications
- Easy restoration of previous settings
- Detailed change log

### 🌐 Multi-language Support
- Full Arabic/English support
- Dynamic language switching
- Fully Arabic system dashboard

---

## 📄 License

### GNU General Public License v2.0 (GPLv2)
```
This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License version 2
as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
```

### Copyright Notice
```
Copyright (C) 2024 SalehGNUTUX

Permission is granted to use, copy, modify, and/or distribute this program
under the terms of the GNU General Public License version 2.
```

---

## 🔄 Frequent Updates

### Update Check
The tool automatically checks for updates on every run:
```
🔍 Checking for updates...
🔄 New version available: 1.0.5
Current version: 1.0.4
Update now? (y/n): y
✓ Updated successfully to version 1.0.5
🔄 Restarting the tool...
```

### Manual Update
```bash
# From within the tool: Option 8
# Or from command line:
gt-terminal --update
```

---

## ⚠️ Important Notes

### Before Installation
1. Ensure `sudo` permissions
2. Check internet connection (for downloading updates)
3. Backup your current settings

### After Installation
1. Restart terminal to apply changes
2. Test different styles (Option 4)
3. Use Option 6 to install all features at once

### Uninstallation
- **Option 11 is completely safe** - keeps backups
- Settings can be restored anytime (Option 7)
- Personal files are not deleted

---

## 🎯 Quick Start Guide

### For Arabic Users:
1. `curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/gt-customterminal.sh | bash`
2. اضغط 'y' للسؤال عن التثبيت النظامي
3. اختر الخيار 6 لتثبيت كل الميزات
4. اختر الخيار 4 → 5 للوحة المعلومات العربية

### For English Users:
1. `curl -sSL https://raw.githubusercontent.com/SalehGNUTUX/gt-customterminal/main/gt-customterminal.sh | bash`
2. Press 'y' when asked about system-wide installation
3. Choose Option 6 to install all features
4. Choose Option 4 → 5 for English System Dashboard

### Uninstall Anytime:
- Run `gt-terminal` → Option 11
- Or from command line if you prefer manual removal

**Remember**: All modifications are reversible, and all operations are safe with automatic backup! 🛡️
