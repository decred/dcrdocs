# اختلافات سطر الأوامر عبر أنظمة التشغيل

أخر تحديث لهذه الصفحة هو v1.0.0.

---

الغرض من هذه الصفحة هو شرح الاختلافات الرئيسية لتشغيل تطبيقات سطر الأوامر عبر منصة على Windows, Linux, و macOS.

---

> إطلاق الأوامر

الاختلاف الرئيسي في تطبيق سطر الأوامر (`dcrd`,`dcrwallet`,`dcrctl`) هو كيف يمكنك اطلاقهم خلال سطر الأوامر. وهذا هذا ليس بقدر من نظام التشغيل كما هو الفرق في قذائف. حيث يأتي ويندز مع موجه الأوامر وطاقة شل المثبتة. وايضا macOS  يستخدم داخل تطبيق المحطة الطرفية وايضا هناك العديد من الاستخدامات للتطبيق من قبل Linux. في ما يلي أمثلة على أساسيات تسغيل الأوامر ل Bash وموجه الأوامر.

**Command Prompt:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

العديد من الادلة قد تكون OS-agnostic مع موجه الأوامر. إذا كان الدليل يخبر عن تشغيل `dcrctl --wallet getbalance`,  الذي يعود الى `dcrctl.exe --wallet getbalance`  لموجه الأوامر و `./dcrctl --wallet getbalance` ل Bash.

> مواقع دليل التطبيق

بطريقة أخرى نرى أن سطر الأوامر الخاص بالعملاء يختلف عن الموقع الخاص بكل تطبيق (الكتل, المحافظ,يتم تخزين كافة ملفات التكوين داخل دليل البيانات). في ما يلي جدول بدليل التطبيق الافتراضي لكل تطبيق.

| OS      | dcrd, dcrwallet, dcrctl دليل التطبيق      | 
| -------:|:--------------------------------------------- |
| ويندوز | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

