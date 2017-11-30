# <i class="fa fa-linux"></i>***gominer* Linux دليل مستخدمين للتعدين**

ويهدف هذا الدليل للإعدادات الأولية الأساسية من gominer مع تجمع التعدين وخيار إستخدام ملف التكوين, حيث تتوفر خيارات أكثر تقدما.

آخر تحديث كان في 28 نيسان 2017.

---

### ** <i class="fa fa-download"></i> تحميل و الإستخراج الثنائي من *gominer* **


>تحميل .tar.gz File

قم بزيارة  [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases) وذلك لتحديث gominer Linux الثنائي. و فقط 64 بايت لإصدارات gominer المتاح. و التحديث الحالي يحتوي على الإصدارات:

- `gominer-linux-amd64-cuda-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencl-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencladl-v1.0.0.tar.gz`.

لبطاقات التصميم الجرافيكي من NVIDIA , قم بتحميل  `*-cuda-*.tar.gz` file. <br /> و لبطاقات التصميم الجرافيكي من  AMD من خطوط Radeon و FirePro, قم بتحميل  `*-opencladl-*.tar.gz` file. <br /> و للبطاقات الأخرى من التصميم الجرافيكي قم بتحميل  ملف `*-opencl-*.tar.gz` file.

ولك أوامر المتابعين,  وهنا هي الروابط المباشرة ل v1.0.0:

```no-highlight
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-cuda-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencl-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencladl-v1.0.0.tar.gz
```

>إستخراج .tar.gz File

لنسخ أو إستخراج جميع الملفات الى الدليل الجديد. سوف يستخدم هذا البرنامج التعليمي `~/decred/` كما هو لدينا من دليل العمل. من خلال سطر الأوامر التالي:

```no-highlight
$ tar -xzf gominer-linux-amd64-cuda-v1.0.0.tar.gz -C ~/decred/
```

عند فك الأقطار، فإنه سيتم إنشاء دليل اسمه `gominer-linux-amd64-opencladl-v1.0.0`.  ويجب أن تكون محتويات هذا الدليل  `blake256.cl`, `blake256-old.cl`, `gominer`, `LICENSE`, `README.md`, و `sample-gominer.conf`.

لإصدار CUDA  و  CUDA الذي يتم تضمين مكتبة التشغيل الآن. فإن ملف الإصدار يحتوي على  `libcudart.so.8.0` و `rungominer.sh`.  يتم استخدام البرنامج النصي لبدء gominer  مع مكتبة التشغيل لراحتك.  حيث يجب أن يكون لديك برامج تشغيل مثبتة لبطاقة الرسومات الخاصة بك ذلك لدعم CUDA 8, ومع  ذلك فإن أقدم برامج التشغيل تسبب ل gominer التحطم المطلق.

### **قم بإعداد  *gominer* ملف الضبط**

> الخطوة 1: قم بإختيار برك التعدين

قبل البدء بهذه الخطوة, فإن من المهم ان تكون بالفعل قد إشتريت حساب تعدين البرك (إذا لزم الأمر من قبل تجمع التعدين الذي اخترته، سيكون لديك عامل في موقع البركة). وقم بتسجيل العمل و كلمة المرور وعنوان stratum+tcp. 

في حال أن هذا جديد لك. هنا تجد الدليل لإنشاء العاملين حول تعدين Decred (تحذير: لا تنسى رمز PIN الخاص بك ليتم تعيينك خلال إنشاء حساب - سوف تكون غير قادر على سحب أي من Decred دون ذلك):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> الخطوة 2: التحقق من الجهاز #ID

قبل إعداد ملف التكوين, فمن الأهمية أن تجد أي الأجهزة، كما حددها gominer، التي كنت ترغب في استخدام التعدين. وللقيام بذلك, قم بفتح نافذة المحطة، وانتقل إلى الموقع الذي قمت بتثبيتgominer أعلاه  (e.g. `~/decred/gominer-linux-amd64-cuda-v1.0.0`),  نوع  `./gominer -l` أو `./rungominer.sh -l` اذا كنت تستخدم إصدار CUDA , قم بالنقر على موافق, و وقائمة من الأجهزة التي يمكن تعدينها مع ما سيعرض. قم بتسجيل اي من العناوين الشخصية لحسابك التي سوف تفضل إستخدامها. تلميح: قد يتم سرد بطاقات الفيديو الخاصة بك حسب الاسم الشريطي.

> الخطوة 3: تحرير ملف التكوين

قم بفتح ملف `sample-gominer.conf` مع تحرير النص من إختيارك. فإن لكل من الإعدادات التي تخص التغيير, وحذف النقطتين قبل متغير الإعداد بعد علامة `=`.

ضمن قسم "الإعدادات العامة":

- قم بضبط `devices=`  الى الجهاز ID#(s) المسجلة بإستخدام الأمر في الخطوة 2 `./gominer -l` أو `./rungominer.sh -l`  يجب فصل الأجهزة المتعددة بفاصلة، على سبيل المثال `devices=2,3`.

ضمن قسم " إعدادات التعدين":

- قم بتعيين  `pool=`  لعنوان stratum+tcp: ميناء تجمع التعدين من اختيارك، على سبيل المثال: decredpool.org  بإستخدام `stratum+tcp://stratum.decredpool.org:3333`  (تصريح بأن:  http://address:port لن يعمل مع gominer - stratum+tcp *يجب* ان يتم إستخدامه).
- قم بتعين `pooluser=` لتسجيل عملك ودخولك
- قم بتعيين `pooluser=` لتسجيل عملك وكلمة المرور.

بعد التغيرات التي حصلت, قم بحفظ الملف. و قم بإعداد نسخة منه و قم بالإتصال ب gominer.conf في دليل تكوين gominer:

```no-highlight
$ mkdir -p ~/.gominer
$ cp sample-gominer.conf ~/.gominer/gominer.conf
```

### **إطلاق  gominer**

إنتقل الى الدليل الذي يحتوي على `gominer` و `blake256.cl`, `على سبيل المثال. ~/decred/gominer-linux-amd64-cuda-v1.0.0/`, وقم بإطلاق - `./gominer` أو `./rungominer.sh`.  بحال أن كلشي قد تم بشكل صحيح, يجب على gominer قرأت ملف التكوين, ليتم الإيصال الى التجمع, وبدء التجزئة مع الأجهزة المحددة. وبهذا سوف تبدأ برؤية رسائل التمرير, بما في ذلك الإحصائيات حول معدل التجزئة المقبولة في كل جهاز, أو المرفوضة, القديمة, وإجمالي الأسهم المقدمة.

هنالك خطأ في التواصل, كما يبدو أنه `pool`, `pooluser`  أو`poolpass` قد تم تكوينه بشكل غير صحيح

بحال أن gominer  قد بدأ بالتجزئة على جهاز كنت لا تريد استخدامه، فمن المرجح أن الإعداد `devices` تكون قد تم تكوينها بشكل غير صحيح.

في حالة وجود كل من المشكلات المذكورة أعلاه، فمن المرجح أن ملف التكوين غير صحيح اسمه (يجب أن يكون name`gominer.conf`) أو قم بتحديد دليل الخطأ (حيث يجب أن يكون  `~/.gominer/`).

### **تعرف على نفسك من خلال موقع البرك الخاص بك**

الآن يمكن القول ان gominer الخاص بك هو تجزئة بعيدة بالنسبة لك , حيث أن لديك الوقت للقيام بفحصها, ومعظم التجمعات لديها لوحة القيادة على موقعه على الانترنت التي يمكنك استخدامها للعثور على إحصاءات حول التجمع، والشبكة، والجولة الحالية (الوقت المنقضي بين كل كتلة وجدت من قبل التجمع). وأيضا, بمجرد حصولك على دفعات كبيرة بما فيه الكفاية، يمكنك سحب القطع النقدية الخاصة بك من خلال تحرير حساب الصفحة عن طريق وضع عنوان الدفع DCR أو تعيين عتبة دفع تعويضات التلقائي، أو اختيار الحساب الخارجي كرصيد حسابك الإجمالي.

### ** تلميحات مفيدة **

*لفتح إصدارات OpenCL و OpenCL ADL الخاص ب gominer*,  فإن gominer تلقائيا سوف يقوم بحساب حجم العمل الذي سيتم تنفيذه خلال كل 500ms. وتغيير إعدادات الكثافة\ وحجم العمل ضمن `gominer.conf`  حيث سيتسبب في قضايا غير معروفة- و ايضا فإن الخوارزمية سوف تنفذ بشكل أسرع وذلك بسبب إنخفاض حجم العمل (وهذا لن يؤدي إلى المزيد من الأسهم التي يتم إنشاؤها)، مما أدى إلى زيادة استخدام الذاكرة في بعض الأحيان تصل إلى 10MB / ثانية.
