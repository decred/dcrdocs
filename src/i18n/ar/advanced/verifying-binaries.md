# التحقق من الثنائيات

---

الرسمي [النشرات المصدق] (https://github.com/decred/decred-release) يكون التجزئات التي وقعت بين ما أن يتم التحقق والتأكد من أنها هي نفسها منالثنائيات التي نشرت للمطورين. وتوفر هذه الصفحة الإرشادات من أجل هذا.

من أجل التحقق من الثنائيات أو الملفات الموقعة الأخرى من مشروع Decred،  من البرنامج هناك بضع القطع المطلوبة:

* SHA256 - بمجرد تحميل الملف الخاص بك (ق)، تحتاج إلى التحقق منها
  SHA256 التجزئة، لذلك قد تحتاج إلى تحميل أداة للقيام بذلك،
  تعتمد على نظام التشغيل الخاص بك.
* GnuPG or PGR -  هذا مطلوب لاستيراد المفاتيح العامة والتحقق منها
  التواقيع. تستخدم الأمثلة أدناه GnuPG.

 اتباع التعليمات يجب أن تعمل كما هو عليه في Linux/UNIX/macOS. ومستخدمين ويندوز سوف يقومون بتنزيل sha256 و gnupg بأنفسهم وإستخدام الويندوز  cmd للقيام بذلك. و الخطوات التالية للتحقق من الثنائيات هي كما يلي:

> الخطوة الأولى

تحميل بيانات الملف، والتوقيع لبيان الملف، والرمز البريدي / القطران لنظام التشغيل الخاص بك من [هنا](https://github.com/decred/decred-binaries). الحصول على قيمة SHA256 ل زيب / تاربال لنظام التشغيل الخاص بك والتحقق من ذلك فإنه يطابق القيمة في البيان الجانبي، على سبيل المثال. ل 64 بت لينكس:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> الخطوة الثانية

قارن القيمة التي حصلت عليها في الخطوة الأولى وقيمة الملف في ملف البيانات.

> الخطوة الثالثة

استيرادات الإصدار المصدق ومفتاح التوقيع في GnuPG. سوف تحتاج فقط للقيام بذلك مرة واحدة ويمكن تخطي هذا عند التحقق لاحقا الإصدارات على نفس الكمبيوتر.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> الخطوة الرابعة

تحقق من التوقيع لبيان للملفات الصالحة و التي تم أنشأتها لمفتاح التوقيع والإصدارات المصدقة:

```no-highlight
$ gpg --verify manifest-20160127-02.txt.asc
gpg: assuming signed data in `manifest-20160127-02.txt'
gpg: Signature made Wed 27 Jan 2016 08:56:59 PM UTC using RSA key ID 518A031D
gpg: Good signature from "Decred Release <release@decred.org>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg: There is no indication that the signature belongs to the owner.
Primary key fingerprint: FD13 B683 5E24 8FAF 4BD1 838D 6DF6 34AA 7608 AF04
Subkey fingerprint: F516 ADB7 A069 852C 7C28 A02D 6D89 7EDF 518A 031D
```

الرمز البريدي مع الثنائيات التي تم التحقق من النظام الأساسي الآن و يمكنها أن تكون واثقة أنها ولدت من قبل مشروع Decred.
