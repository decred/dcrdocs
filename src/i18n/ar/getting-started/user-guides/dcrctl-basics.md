# dcrctl مبادئ 

 أخر تحديث للإصدار هو v1.0.0.

ويهدف هذا الدليل لمساعدتك على تعلم الأوامر الأساسية لتطبيق `dcrctl` باستخدام [ملف التكوين الحد الأدنى] (/advanced/manual-cli-install.md#minimum-configuration).

**Prerequisites:**

- أحدث إستخدام [تثبيت DCR] (/getting-started/user-guides/cli-installation.md) لتثبيت `dcrctl`. وستكون هناك حاجة إلى خطوات إضافية إذا تم استخدام طريقة تثبيت أخرى.
- قم بمراجعة إطلاق الأوامر لكل من موجه الأوامر  (Windows) و Bash (macOS/Linux)  وقد تختلف [هنا] (/getting-started/cli-differences.md).
- [البدء dcrd](/getting-started/user-guides/dcrd-setup.md) وخلفية تشغيلها.
- [البدء dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) خلفية تشغيلها.

---

`dcrctl` هو العميل الذي يتحكم` dcrd` و `dcrwallet` عبر استدعاء الإجراء البعيد (RPC). يمكنك استخدام `dcrctl` لأشياء كثيرة مثل التحقق من رصيدك، وشراء التذاكر، وخلق المعاملات، وعرض معلومات الشبكة.

**للتذكير:** يستخدم هذا الدليل أمثلة OS-agnostic للأوامر. راجع المتطلبات المسبقة لتحديد ما إذا كان يجب استخدام `. / dcrctl` أو` dcrctl.exe` بدلا من `dcrctl`.

---

> تكوين اسم المستخدم وكلمة المرور RPC

الأوامر المرسلة إلى `dcrd` أو` dcrwallet` تتطلب اسم المستخدم / كلمات المرور ليتم الإعداد في ملفات التكوين.

إذا إستخدمت [`تثبيت DCR`](/getting-started/user-guides/cli-installation.md), يتم بالفعل إعداد ملفات التهيئة باستخدام اسم مستخدم / كلمة مرور ل `dcrd` و` dcrwallet` و `dcrctl`.

إذا كنت لا تستخدم `dcrinstall`، سوف تحتاج إلى تمكين الحد الأدنى من الإعدادات في ملفات التكوين الخاص بك. اتبع [هذا الدليل ](/advanced/manual-cli-install.md#minimum-configuration) للقيام بذلك.

---

## dcrctl أوامر

سوف تحتاج لتشغيل أوامر dcrctl في نافذة قذيفة منفصلة (موجه الأوامر / BASH).

لإصدار الأوامر إلى `dcrwallet`، سوف تحتاج إلى استخدام` dcrctl --wallet <كوماند> `.

لإصدار الأوامر إلى `dcrd`، ستحتاج إلى استخدام` dcrctl <command>`.

لرؤية قائمة كاملة من الأوامر التي `dcrctl` يمكن إرسالها إلى` dcrd` و `dcrwallet`، قم بإصدار الأمر التالي في غلافك:

```no-highlight
dcrctl -l
```

وذلك سيعود عليه العديد من الأوامر, مفصولة عن التطبيق. وهذه الأوامر تعد في مقدمة خيارات `dcrd` والأوامر في القسم السفلي هي `dcrwallet`. يمكنك معرفة المزيد عن أمر فردي بكتابة ما يلي لأوامر `dcrwallet`:

```no-highlight
dcrctl help --wallet <command>
```

أو ما يعد أوامر  `dcrd`:

```no-highlight
dcrctl help <command>
```

---

## إلغاء قفل محفظتك

بعض وظائف `dcrwallet` تتطلب إقفال المحفظة.

الأمر بفتح محفظتك:

```no-highlight
dcrctl --wallet walletpassphrase <private passphrase set during wallet creation> 0
```

هنا، يتم تحديد  `dcrctl` لإرسال الأمر إلى` dcrwallet` باستخدام العلم `--wallet`. الأمر الفعلي هو `عبارة مرور المحفظة` أي ما يقبل المعاملات،والتي تحتاج المرور الخاصة بك. تحديد `0` لفترة زمنية يفتح` dcrwallet` دون حد زمني. لاحظ، مع ذلك، أن هذا يفتح  المحفظة للدورة الحالية. وإذا قمت بإغلاق نافذة المحفظة قيد التشغيل، أو إيقاف / إعادة تشغيل `dcrwallet`، سوف تحتاج إلى فتحه مرة أخرى في المرة القادمة التي تبدأ به.

إذا كانت الأوامر ناجحة, فإنك لن تحصل على التأكيد من `dcrctl`، ولكن يمكنك النظر إلى أجزاء `dcrwallet` التي سوف تقول:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

 ملاحظة: الغاء قفل المحغظة يتطلب العديد من المهام ل  `dcrwallet`, `dcrwallet` بحيث يمكن البدء ب  `--تمرير الموجة` أو إعدادات `تمرير الموجه =الصحيحة` في  `dcrwallet.conf` (يناقش [هنا](/advanced/storing-login-details.md#dcrwalletconf)).

---

## فحص توازنك

إرسال الأوامر `للحصول على التوازن`  `dcrwallet` باستخدام `dcrctl`,  قم بإدخال ما يلي:

```no-highlight
dcrctl --wallet getbalance
```

وهذا ما سيعيد كل التوازن لحسابك.

---

## الحصول على عنوان جديد للإستقبال

إرسال أوامر `الحصول على عنوان جديد` ل `dcrwallet`  بإستخدام  `dcrctl`, إضغط على ما يلي:

```no-highlight
dcrctl --wallet getnewaddress
```

سيؤدي هذا إلى إنشاء عنوان جديد للدفع. وذلك لتقليل إعادة استخدام العنوان، ويتم إستخدام هذا الأمر للحصول على عنوان جديد لكل معاملة ترغب في تلقيها.

---

## إرسال DCR

لإرسال DCR الى العنوان, يعدد قضية للاوامر `إرسالها إلى العنوان` ل  `dcrwallet` باستخدام `dcrctl`. إتبع ما يلي,  ملء عنوان التلقي وكمية إرساله:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

اذا كانت ناجحة, `dcrctl` فإن تجزئت الصفقة سوف تعود لما يمكن إستخدامه من الصفقة المسؤولة [Decred الكتل المكتشفة من ] (/getting-started/using-the-block-explorer.md).

---

## تحقق من إحصائيات الشبكة

هنالك العديد من الأوامر التي تفحص حالات الشبكة. وهنا يمكن تغطيته من خلال إرسال `الحصول على معلومات` ل `dcrd` و `الحصول على حصة من المعلومات` ل `dcrwallet`.

للحصول على المعلومات المحليه حول `dcrd` عقد, وتعد قضية الأوامر `للحصول على المعلومات` ل `dcrd`  بإستخدام `dcrctl`. اضغظ على ما يلي:

```no-highlight
dcrctl getinfo
```

للحصول على معلومات حول شبكة الإثبات, قضية للأوامر `الحصول على حصة من المعلومات` ل `dcrwallet`  باستخدام `dcrctl`. أضغط على ما يلي:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## الأوامر الإضافية

المزيد من الأوامر يمكن إيجادها من خلال [اختيار البرنامج](/advanced/program-options.md) page.

---
