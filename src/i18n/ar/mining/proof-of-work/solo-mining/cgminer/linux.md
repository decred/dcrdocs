# <i class="fa fa-linux"></i> Linux دليل مستخدم 

---

## <i class="fa fa-cloud"></i> قم بربط  dcrd مع شبكة Decred  

> الخطوة الأولى

لاحظ أن كل من الأوامر `dcrd`, `dcrwallet`, و `dcrctl`  التي يجب أن يتم تنفيذها في الدليل حيث أن الملفات الخاصة بك Decred هي! لتشغيل `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

إبدأ بمحفظة dcr

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> الخطوة الثانية

قم بإنشاء عنوان محفظة جديد:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

قم بنسخ العنوان الجديد (من خلال عرض الأوامر). إغلاق\إنتهاء  `dcrd` و `dcrwallet`  من خلال الضغط على `ctrl+c` 

> الخطوة الثالثة

قم بإعادة التشغيل من خلال إستخدام الأمر  `dcrd`

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> الخطوة الرابعة

إعدادات الأمان ل TLS من خلال نسخ rpc.cert  إلى /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

قم بإستخدام تعديل النص لإضافة السطر "dcrd.crt" (بدون علامات إقتباس) إلى /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

تحديث قائمة الشهادات CA:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i> تحميل وإستخراج cgminer 

قم بزيارة ttps://github.com/decred/cgminer/releases  لإيجاد أحدث الإطلاقات ل cgminer. ولتحميلها و إستخراجها مقابل محطة Linux قم بإتباع الأوامر التالية:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> تهيئة وتشغيل cgminer 

> الخطوة الأولى

إذا لم يتم الانتهاء من مزامنة `dcrd` إلى تسلسل الكنلة، يجب أن تنتظر حتى النهاية، وبعدها إنتقل إلى الخطوة التالية. وعند إنتهائك منها فإنها سوف تظهر :

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> الخطوة الثانية

في دليل cgminer الخاص بك, يتم بدءه من خلال الأوامر:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

قم بإنشاء ملف الضبط ل cgminer من خلال الضغط على المفاتيح :  `S` (الإعدادات), `W` (كتابة ضبط الملف), `Enter` (حفظ ملف الضبط ك `cgminer.conf`).  ولاحظ أن  `cgminer.conf`  سيتم إستبداله في نفس الدليل مع  cgminer. cgminer التي يمكن إطلاقها من خلال تشغيل الأوامر أي بشكل بسيط:

```no-highlight
~/Decred/$ ./cgminer
```

هذا يحتوي على مبادئ المنفردة ل  cgminer ودليل إعدادها. ولمزيد من المعلومات حول إستخدامات وتفاصيل متوقعة لبرامج  cgminer, ما يعود إلى القسم الرئيسي [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
