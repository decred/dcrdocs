# BLAKE-256 وظيفة التجزئة 

---

SHA256, يتم إستخدامه في Bitcoin, حيث أن لديها عدد من أوجه القصور التقنية بسبب بناء Merkle-Damgård. حيث أدت هذه الثغرات الأمنية إلى المنافسة SHA3 لوظيفة تجزئة جديدة تقوم على بناء أساسي مختلف. وقد اختارت ديكريد BLAKE256 كدالة تجزئة لها، وهي المباراة النهائية للمنافسة [^ 1] [^ 2]. ويستند معدل الدلالة حول بناء HAIFA يتضمن الإختلاف في تشفيرات ChaCha. والمعدل الملحوظ لأداءها العالي على الهندسة المعمارية المصغرة هو x86-64، حيث أنها أسرع للرسائل القصيرة من SHA256 [^ 3] على الرغم من اعتبارها لديها هامش أمان أعلى بكثير في 14 جولة.

---

## <i class="fa fa-book"></i> المراجع

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 proposal BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. The hash function BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT benchmarking of cryptographic systems](http://bench.cr.yp.to).
