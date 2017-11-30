# CLI دليل التثبيت

اخر تحديث لهذه الصفحة كان بالإصدار v1.0.1.

---

## dcrinstall 

`dcrinstall` هو الأسلوب الموصى به لتثبيت الأدوات الخاصة ب Decred لسطر الأوامر` dcrd`، `dcrwallet`، و` dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` يتم من خلاله التحميل التلقائي للحزمة الثنائية الموقعة مسبقا و الموجودة على GitHub, ولتحقق من صحة توقيع الحزمة يمكن نسخ الثنائيات داخل الحزمة وذلك الى مجلد معين يعتمد على نظام التشغيل, وإنشاء ملفات التكوين مع إعدادات تسمح ل 3 من التطبيقات للتواصل مع بعضهم البعض, وأيضا لتشغيل من خلال إنشاء العمل. وبعد تشغيله يمكن ل `dcrinstall`, إعطاءك القدرة لإطلاق البرنامج مع أي تكوين إضافي.

> macOS:

1. تحميل الملف الصحيح:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. جعل dcrinstall-darwin-xxxx-vx.x.x  قابل للتنفيذ داخل المحفظة الخاصة بك، وتشغيلها:

   انتقل الى الدليل في مكان تحميل ملف DCR باستخدام الأمر  `cd`، تشغيل تشمود مع u+x بواسطة DCR  لتثبيتالملف، وتشغيل قابل للتنفيذ منها وفيما يلي مثال على تلك الأوامر (تغيير الدلائل أو اسم الملف حسب الحاجة):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. يمكن العثور على الثنائيات القابلة للتنفيذ ل `dcrd` و` dcrwallet` و `dcrctl` الآن في دليل `~ / ديكريد /`. قبل اكتمال عملية `dcrinstall`، سيتم نقلك إلى موجه إنشاء المحفظة. اتبع الخطوات الضمان [إنشاء محفظة تجول] (/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough)  من دليل الإعدادت النهائية.

> Linux:

1. تحميل الملف الصحيح:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. جعل dcrinstall-linux-xxxx-vx.x.x كالمحطة الخاصة بك القابلة للتنفيذ, وتشغيلها.

   انتقل إلى الدليل حيث يتم تحميل ملف التثبيت من DCR باستخدام الأمر `cd`، تشغيل تشمود مع u+x بواسطة ملف التشغيل, وتشغيل القابل للتشغيل منها, وفي ما يلي مثال عليها  (تغيير الدلائل أو اسم الملف حسب الحاجة):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. يمكن الآن العثور على الثنائيات ل `dcrd` و` dcrwallet` و `dcrctl` في الدليل` ~ / ديكريد / `. قبل اكتمال عملية `dcrinstall`، سيتم توجيهك لتنقل المحفظة. اتبع الخطوات ضمن [إنشاء محفظة تجول] (/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) من دليل الاعداد النهائي.

> Windows:

1. حمل الملف الصحيح:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  تشغيل  ملف التثبيت  قابل للتنفيذ.

    يمكنك إما النقر المزدوج عليه أو تشغيله من موجه الأوامر.
    
3. الثنائيات ل `dcrd`, `dcrwallet`,  و`dcrctl`  يمكن إيجادها في `%HOMEPATH%\decred\` 
 usually %HOMEPATH% is `C:\Users\ <username>`).  وقبل تشغيل  `dcrinstall` , سيتم نقلك إلى موجه إنشاء المحفظة. اتبع الخطوات ضمن [إنشاء محفظة تجول] (/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough)  لإعدادت دليل dcrwallet لإنهاءها.
