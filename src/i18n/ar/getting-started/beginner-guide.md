# دليل المبتدئين

آخر تحديث ل v1.0.1

---

## مرحبا بك في ديكريد

مرحبا بك في ديكرد! نحن سعداء بكونك معنا. كما تعرف أو لا، ديكريد مختلفة.هناك العديد من الاشياء الجديدة لتتعلمها حتى تستوعب بالكامل كيفية سير الامور.هذه الوثيقة ستساعدك على فهم الاشياء.

ودليل المبتدئين هو مسار للحصول على برامج Decred وتشغيلها. ويمكنك الاختيار بين العديد من العملاء للحصول على عقدة في الشبكة و Decred في محفظتك. على وجه التحديد، سوف تتعلم كيفية تثبيت والإعداد، واستخدام تطبيقات Decred. كيفية الحصول على DCR. كيفية التصويت عن طريقا الإثبات . وكيفية استخدام مستكشف كتلة.

ستحتاج إلى اتباع [دليل التثبيت] (# دليل التثبيت)، ثم اتباع مسارالتطبيق لاختيارك أدناه. . بعد إعداد التطبيق، انتقل إلى [الأدلة العامة] (# أدلة عامة) الموجود أسفل هذه الصفحة. إذا كان لديك أي أسئلة حول طول الطريق، انضم إلينا في [سلاك] (/ support-directory.md # جوين-أوس-أون-سلاك).

**ملاحظة: استخدم صصافي الاختبار ينصح بشدة لتعلم كيفية استخدام البرامج دون الخوف من ارتكاب الخطأ أو فقدان الأموال. بعد إتباع الأدلة لإعداد إختيارك من البرمجيات, يرجى منك زيارة  [باستخدام دليل صافي الاختبار] (/ جيتينغ-ستارتد / using-testnet.md) وذلك لمعرفة كيفية ارسال طلبك إلى تطبيق صافي الاختبار ل Decred's. **

---

## التطبيقات

في الأسفل سوف تجد قائمة من التطبيقات المتاحة حاليا, مع رسوم بيانية للعرض التوافقي مع مختلف أنظمة الخيارات.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | الدفع لنا | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| ويندوز   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| UNIX أخرى|            | X    | X         | X      |             |

"أخرى UNIX" يشمل حاليا مختلف * BSDs و سولاريس / إلوموس.

ملاحظة: قد تلاحظ قريبا واحدة من العديد من الاختلافات بين مدمن وغيرها
والعملات الشعبية الاخرى: المحفظة الخفي والعقدة الخفي منفصلة.
وهناك الكثير من القطع النقدية الأخرى تشغيل هذه الوظائف معا في وقت واحد.
بالنسبة لأولئك الذين يختارون استخدام واجهات الأوامر، وهذا يعني أنك يجب
تشغيل `dcrd` للحصول على وظيفة عقدة كاملة، و` dcrwallet` لتخزين DCR الخاص بك،
إنشاء المعاملات والمشاركة في إثبات من التعدين / التصويت.

---

## دليل التثبيت

للبدء به, اختار خيار الإثبات المتاح لتشغيل النظام المتاح:

* [الدفع لنا](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) -  ملاحظة: طريقة `dcrinstall` هي أسرع وأسهل طريقة للحصول على عقدة سطر الأوامر والمحفظة جري. من المستحسن أن تفترض أدلة إعداد مسار سطر الأوامر أدناه أنك قد استخدمت هذه الطريقة.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

** ملاحظة:** كل الأدلة التالية يمكنها إيجادها في القائمة المتاحة لهذه الأسماء.

## مسار الدفع لنا

الدليل التالي, من أجل, توفير البداية لدفعك لنا:

* [خطوات الدفع لنا](/getting-started/user-guides/paymetheus.md)
* [استخدام الدفع لنا](/getting-started/user-guides/using-paymetheus.md)

## Decrediton مسار 

الدليل التالي يساعدك في تحميل Decrediton

* [Decrediton إعداد](/getting-started/user-guides/decrediton-setup.md)

## مسار سطر الأوامر المتبعة

الدليل التالي, من أجل, ما ستحصل عليه لبدأ تطبيق سطر الأوامر  (`dcrd`, `dcrwallet`, `dcrctl`):

* [إختلافات سطر الأوامر](/getting-started/cli-differences.md)
* [أساسيات خيار التشغيل](/getting-started/startup-basics.md)
* [dcrd بدأ إعداد](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet بدأ إعداد](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl الاستخدام الأساسي](/getting-started/user-guides/dcrctl-basics.md)

## الارشادات الأساسية

الإرشادات التالية تحتوي على تطبيقات مختلفة:

* [استخدام صافي الاختبار](/getting-started/using-testnet.md)
* [الحصول على DCR](/getting-started/obtaining-dcr.md)
* [استخدام مستكشف الكتلة](/getting-started/using-the-block-explorer.md)
* [دليل إثبات الحصة](/mining/proof-of-stake.md)
* [دليل التصويت لصافي الشبكة الرئيسي](/getting-started/user-guides/agenda-voting.md)
