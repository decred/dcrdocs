# <i class="fa fa-windows"></i>دليل مستخدم ويندوز

---

## <i class="fa fa-cloud"></i> ربط dcrd مع شبكة Decred  

> الخطوة الأولى

لاحظ أن أوامر `dcrd`, `dcrwallet`, و `dcrctl`  يجب أن أقل في الدليل حيث ملفاتDecred الخاصة بك! بدأ ب `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

البدء بمحفظة dcr

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> الخطوة الثانية

إنشاء عنوان جديد للمحفظة:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

قم بنسخ العنوان (الإخراج من الأمر الأخير). إغلاق\إنهاء `dcrd` و `dcrwallet` من خلال الضغط على  `ctrl+c` في كل ويندوز

> الخطوة الثالثة

قم بإعادة تشغيل  `dcrd` بإستخدام الأوامر:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> تحميل وإستخراج cgminer 

قم بزيارة https://github.com/decred/cgminer/releases  للعثور على أحدث إطلاق ل cgminer . للحصول على ويندوز 64 بت، تحميل واستخراج `cgminer-decred-w64_*.zip`. و للحصول على ويندوز 32 بت, قم بتحميل وإستخراج `cgminer-decred-w32_*.zip`.  وإستخراج كل الملفات للحصول على ملف جديد و فتح ملف جديد لرؤية جميع الملفات.

---

## <i class="fa fa-play-circle"></i> تهيئة وتشغيل cgminer 

> الخطوة الأولى

انقر بزر الماوس الأيمن على `start_local.bat`  وانقر على  `Edit`. وقم بتغيير اسم المستخدم و كلمة المرور لتطابق بيانات الاعتماد المستخدمة في الخطوة 1. حفظ وإغلاق start_local.bat . وللمراجع, هنا أوامر start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> الخطوة الثانية

بحال أن dcrd لم ينتهي من مزامنة سلسلة الكتلة, انتظر حتى النهاية، ثم انتقل إلى الخطوة التالية. عند الانتهاء، وسوف تظهر:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> الخطوة الثالثة

قم بالنقر المزدوج على `start_local.bat`. `cgminer`  ليجيب فتحها. و قم بإنشاء ملف الضبط  `cgminer` من خلال الضغط على المفاتيح التالية:  `S` (الإعدادات), `W` (كتابة ضبط الملف), `Enter` (حفظ ضبط الملف ك  `cgminer.conf`). ولاحظ أن  `cgminer.conf`  سيتم إستبدالها في نفس دليل cgminer. cgminer وأنه يمكن إطلاقها ببساطة من خلال النقر المزدوج على `cgminer.exe`.  هذا يختتم دليل الإعداد cgminer للمنفرد الأساسي, ولمزيد من المعلومات حول استخدام cgminer والتفسيرات التفصيلية حول وظائف البرنامج، يرجى الرجوع إلى  [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
