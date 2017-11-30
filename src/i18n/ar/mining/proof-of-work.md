# إثبات العمل (PoW) تعدينه

---

## النظرة العامة

دليل على العمل التعدين، يعد الأكثر شيوعا المشار إليها حيث أن التعدين هو النشاط من ارتكاب جهاز الكمبيوتر الخاص بك الأجهزة والموارد لمعالجة وذلك لمعاملات الشبكة وبناء الكتل لتشكل سلسلة كتل في شبكة Decred. وكل كتلة تم إنشاءها (بواسطة العاملين), هي حوالي 30 عملة Decred جديدة الإنتاج. وهذه العملات تم تقسيمها عل النحو التالي:

دعم مالي | حفل
---     | ---
60٪   | PoW عاملي
30%   | PoS ناخبي
10%   | Decred لدعم التنمية

سوف تحصل، في المتوسط، على مكافأة حيث يتناسب ذلك مع معدل التجزئة, من عاملي التعدين الخاص بك, ومعدل التجزئة الإجمالية من الشبكة الخاص بك عند إرتكابها من خلال جهازك الخاص بالتعدين. ولكي تبدأ, يجب عليك الحصول على جهاز حاسوب مع كرت خاص بالفيديو. معظم بطاقات الفيديو يمكن استخدامها للتعدين (بما في ذلك أنواع "المحمول" وجدت في بعض أجهزة الكمبيوتر المحمولة). حيث أنه بشكل عام الأداء الأعلى للبطاقات يكون في
ارتفاع معدلات التجزئة وبالتالي الحصول على مكافآت أعلى. ---

## التعدين أو التعدين المنفرد

> <i class="fa fa-male"></i> التعدين المنفرد

<i class="fa fa-exclamation-triangle"></i> ** التعدين المنفرد لا ينصح به, حيث أنه لم يتم تغطيته من خلال هذه الوثائق!** حيث أن شبكة Decred يرى بانتظام معدل تجزئة الشبكة تصل إلى 10،000Gh / ثانية. وعملية التعدين المنفرد عادة ما تكون من قبل المتقدمين أو المجموعات المنظمة مع مجموعات كبيرة من مجموعات GPUs لذلك لم يتم تناولها.

> <i class="fa fa-users"></i> التعدين

عندما تكون منسجمة، ومعدل التجزئة الخاص بك جنبا إلى جنب مع جميع معدلات تجزئة تجمع عمال المناجم الأخرى للبحث عن الحل الصحيح للكتل, و تعد عملية التعدين المنفرد لتوزيع الأسهم على أساسالكتل التي وجدت حتى تتمكن من كسب كمية ثابتة بدلا من "الكل أو لا شيء". 

---

## الحصول على عنوان Decred لإستلام الأموال مع

قم بمتابعة دليل  [dcrctl مبادئ](/getting-started/user-guides/dcrctl-basics.md)  لإنشاء عنوان يمكنك من سحب المكافآت التعدين.

---

## <i class="fa fa-life-ring"></i> قم بالتسجيل فالتعدين

ويعد التعدين معروفا لدعم Decred

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

التعدين هو كل عمل أقل أو أكثر من التشابه من حيث الإشتراك في البرك المتعددة وبذلك تحدد أي منها يناسبك أكثر.

قم بإختيار التعدين لبركة صغيرة حيث أن معدل إنتشار الشبكة قد يؤدي لتحسين اللامركزية من قوة التعدين!

---

## برامج تشغيل كمبيوتر / برامج تشغيل كمبيوتر

عادة ما تحتوي برامج تشغيل GPU والمكتبات اللازمة للتعدين. إذا كان لديك صعوبات في تشغيل البرامج الذي قد ترغب في إعادة تثبيتها وذلك تحديدا يتم باختيار مكتبات  OpenCL (AMD) or CUDA (NVIDIA) 

---

## <i class="fa fa-download"></i> تحميل وتحديد برمجيات التعدين

### رسمية decred (gominer)

Gominer هو يعد الأكثر رسمية ل Decred التي وضعت وبدعم من فريق Decred. وهو من أسهل العوامل لإعداد وبدء التعدين وهكذا فمن المستحسن بالنسبة لمعظم المستخدمين. حاليا، أحدث إصدار من Gominer هو **<i class="fa fa-github"></i>  [v1.0.0](https://github.com/decred/gominer/releases/)**  و الثنائيات الرسمية يمكن تحميلها من **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

يرجى التأكد من تحديد نظام التشغيل الصحيح (Windows/Linux)  و النسخة الصحيحة من نوع GPU  (CUDA for NVIDIA cards, OpenCL/OpenCLADL for AMD cards).  حيث أن gominer  يتوفر فقط لأنظمة التشغيل 64 بت. أدلة المستخدم لبدء التعدين مع gominer يمكن العثور عليها هنا:

- [ويندوز التعدين](/mining/proof-of-work/pool-mining/gominer/windows.md)

### العمال الغير رسمين

* <i class="fa fa-github"></i>  [cgminer](https://github.com/kR105-zz/cgminer) - cgminer  هو عامل شعبي ل **AMD** GPUs التي لديها تاريخ طويل من استخدام في العديد من العملات التشفير المختلفة. ومن الأصعب إستخدام  decred gominer.

* <i class="fa fa-github"></i>  [ccminer](https://github.com/tpruvot/ccminer) - ccminer هو العامل الشعبي ل **NVIDIA** GPUs الذي لديه تاريخ طويل من استخدام في العديد من العملات التشفير المختلفة. ومن الأصعب من decred gominer.

* <i class="fa fa-github"></i>  [sgminer](https://github.com/tpruvot/sgminer) -  وهذه مع بطاقات الجرافيك **AMD** لتشغيل ويندوز حيث يعتمد على تحميل sgminer.

---

## تشغيل البرنامج

* فك ضغط وتثبيت البرنامج لمكان من اختيارك
* فتح الأمر الموجه لهذا المسار
* قم بإتباع تعليمات البركة الخاصة بك للإعدادات
* تشغيل العامل

المتابعة إلى [PoW Mining FAQ](/faq/proof-of-work-mining.md)
