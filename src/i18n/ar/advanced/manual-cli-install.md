# دليل تثبيت CLI

---

أحدث الإصدارات الثنائية يمكن العثور عليها هنا: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). فيما عدا عن ملفات  `.msi` و `.dmg`, لأنهم محفوظات في أحدث الثنائيات القابلة للتنفيذ لكل إصدار.  على الرغم من أن معظم هذا سوف يكون بفك وذهاب، وتقديم التعليمات ل macOS, Linux, و Windows التالية (الكفاءة المفترضة للمستخدمين *BSD).

> macOS

1. تحميل الملف الصحيح

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. انتقل الى تنزيل الموقع واستخراج ملف .tar.gz:

   الباحث: انقر نقرا مزدوجا على ملف .tar.gz file. <br /> 
    المحطة النهائية: استخدم الأمر  `tar -xvzf filename.tar.gz`.

   ** ملاحظة **: إذا كنت تستخدم سفاري على ماك سييرا يجب ان يكون "فتحه" آمن "للملفات بعد تحميلها" وتمكين التفضيلات، الملفات .gz و. zip تلقائيا من ان يكونن غير مضغوط بعد التحميل. ينتج الأمر `تار -xvzf filename.tar.gz` هذا الخطأ: `tar: خطأ في فتح الأرشيف: فشل فتح 'filename.tar.gz'`. اي استخدم `tar -xvzf filename.tar` بدلا من ذلك (قم بإزالة .gz من الأمر السابق).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. حمل الملف الصحيح

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. انتقل إلى تنزيل الموقع واستخراج ملف .tar.gz:

   أوبونتو متصفح الملفات: ببساطة انقر بزر الماوس الأيمن على .tar.gz وحدد "استخراج هنا" <br />
    المحطة الطرفية: استخدم الأمر ` tar -xvzf filename.tar.gz`.
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

ملاحظة: يوفر ويندوز 7/8/10 أصلا الدعم لملفات `.zip`، ولذلك يفضل استخدام ملف` .zip` بحيث لا تكون هناك حاجة إلى تطبيقات جهة خارجية لملف `.tar.gz`. يتم توفير تعليمات لملف `.zip`.

1. حمل الملف الصحيح

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. انتقل إلى تنزيل الموقع وفك ضغط الملف `.zip`:

    فيل إكسبلورر: انقر بزر الماوس الأيمن على ملف .zip، وحدد "إكستراكت آل .." ويجب أن تفتح المطالبة بالسؤال عن الدليل المطلوب استخدامه. سيقوم الافتراضي باستخراج `.zip` إلى مجلد بنفس الاسم. يجب أن تتضمن `dcrctl`،` dcrd`، `dcrwallet`،` سامبل-dcrctl.conf`، `سامبل-dcrd.conf`، و` سامبل-dcrwallet.conf`.

إذا قررت تنزيل ملف `.tar.gz`، فستحتاج إلى استخراج بعض تطبيقات الجهات الخارجية (7-زيب و وينرار وما إلى ذلك) للوصول إلى الثنائيات الفعلية.

---

## الحد الأدنى من التكوين

في الحد الأدنى، ل `dcrd`،` dcrwallet`، و `dcrctl` لتكون قادرة على التواصل مع بعضها البعض، فإنها تحتاج إلى أن تطلق مع نفس ريكوسر / رباس الجمع. للحصول على التكوين اليدوي يرجى اتباع الخطوات التالية:

1. إذا كانت الدلائل الرئيسية المعتمدة على نظام التشغيل المدرجة في قسم [ملفات التكوين] (https://github.com/decred/dcrd/blob/master/sam)  أعلاه غير موجودة، فالرجاء إنشاؤها ل `dcrd` و` dcrwallet` و `dcrctl`.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. اختر اسم مستخدم وكلمة مرور تعسفيين، وسيتم استخدام هذه فقط ل كل تطبيق على التواصل عبر إجراء إجراءات عن بعد. أسهل التكوين هو تعيين كل منهم على قدم المساواة.
6. داخل `dcrd.conf`، أسفل` [خيارات التطبيق]`، أضف السطور التالية: <br /> <br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. داخل `dcrwallet.conf`، أسفل` [خيارات التطبيق]`، أضف السطور التالية: <br /> <br />
        `أوزرنام = <تشوسن-أوزرنام>` <br />
        `كلمة المرور = <تشانل-باسورد>` <br /> <br />
8. داخل `dcrctl.conf`، أضف السطور التالية: <br /> <br />
        `ريكوسر = <تشوسن-أوزرنام>` <br />
        `رسيباس = <تشانجد-باسورد>` <br /> <br />
9. حفظ جميع ملفات التكوين الثلاثة.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.