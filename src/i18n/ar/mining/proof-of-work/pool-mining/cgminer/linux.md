# <i class="fa fa-linux"></i> دليل مستخدم Linux

---

## <i class="fa fa-download"></i> تحميل وإستخراج cgminer

قم بزيارة https://github.com/decred/cgminer/releases  للعثور على أحدث إطلاق cgminer. لتحميل واستخراج الملفات من خلال المحطة، قم بتشغيل الأوامر التالية. لاحظ أن هذا المثال تحميل cgminer v0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

التحرك بداخل cgminer دليل الجديد :

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i>  تهيئة وتشغيل cgminer

> الخطوة الأولى

اكتب ما يلي في إطار المحطة الطرفية لإدراج الأجهزة القادرة على التعدين الخاص بك:

```no-highlight
~/Decred/$ ./cgminer -n
```

يجب أن ترى بطاقات الفيديو المدرجة إما من قبل الاسم الشائع ل GPU أو اسم السائق. يجب أن يظهر السطر الأخير من الناتج مع عدد الوحدات معالجة الرسومات متوافقة يمكنك إندماجها.

> الخطوة الثانية (إختياري)

لقياس النظام الخاص بك ومعرفة معدل التجزئة الخاصة بك GPUs القادرة على استخدام الأمر:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> الخطوة الثالثة

سجل لمرة واحدة في مواقع التجمع والإعداد لعامل جديد لكل منهم وذلك من أجهزة الكمبيوتر التعدين الخاص بك. قم بالرجوع إلى موقع البركة حيث يتم اختيارك للحصول على تعليمات، إذا لزم الأمر. في إطار المحطة الطرفية من الخطوة الأولى، اكتب الأمر التالي إلى إطلاق cgminer (تجاهل الأقواس):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

مثال :

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> الخطوة الرابعة

cgminer يجب أن يطلق الأن. وذلك لإنشاء ملف تكوين cgminer عن طريق الضغط على المفاتيح التالية: `S` (الإعدادات), `W` (كتابة الملف), `Enter` (حفظ الملف ك `cgminer.conf`). وقم بملاحظة أن `cgminer.conf` سيتم وضعها في نفس الدليل كما في  `cgminer`. لإضافة أي بركة إلى ملف التكوين الخاص بك، افتح `cgminer.conf` مع Gedit ل (GUI) / Pico (CLI) أو محرر نص المماثل. ويمكن أن تكون البرك متعددة التي تم إضافتها بنفس الصيغة "Pool" لقسم التكوين لذلك (لاحظ الفاصلة بين كل دخول إلى البرك الفردية):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> الخطوة الخامسة

حفظ  `cgminer.conf` و إغلاق `cgminer`. وذلك لإعادة إطلاق cgminer بإستخدام الأوامر:

```no-highlight
~/Decred/$ ./cgminer
```

وذلك يختتم الأساسيات حول دليل إعدادات cgminer, للمزيد من المعلومات حول استخدام cgminer والتفسيرات التفصيلية بشأن وظائف البرنامج، يرجى الرجوع إلى [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
