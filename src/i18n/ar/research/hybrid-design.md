# تصميم الهجين

---

ناقض الرئيسي لمخطط متابعة الوصف السابق [^ 1] هو نظام اليانصيب الجديد الذي يجب شراء التذاكر ومن ثم الانتظار فترة الاستحقاق قبل أن يمكن اختيارها وقضاءها. التي يتم تنفيذ اختيارها لتذاكر البلوك من تجمع تذكرة المدمجة على أساس الواردة في رأس البلوك. حيث أن التلاعب في هذا  يعد من الصعب في نظام PoW، والتلاعب اختيار تذكرة يرتبط بتكلفة أساسية للعامل PoW. ويمكن وصف اختيار التذاكر على مدى فترة زمنية بوظيفة الكثافة الاحتمالية المشابهة لاحتمال الحصول على بلوك في PoW بمعدل ثابت للتجزئة مع مرور الوقت عند صعوبة ثابتة [^ 2]، مما يؤدي إلى توزيع الاحتمال مع وضع يساوي تقريبا نصف حجم تجمع التذاكر. حيث يتم تنظيم السعر لشراء تذكرة من قبل وجود الصعوبة للحصة جديدة التي يتم تحديدها من قبل المتوسط المرجح لعدد التذاكر التي تم شراؤها وحجم تجمع تذكرة المدمجة في البلوك السابقة.

وتفسر عملية التحقق من كتل برنامج العمل من خلال الخطوات التالية:

1. يتم استخراج كتلة من قبل عاملي PoW، الذي يختار المعاملات لوضع داخله. ويتم إدراج المعاملات المتعلقة بنظام الحصص في مجموعة UTXO.
2. يصوت عمال PoS في الكتلة على الكتلة عن طريق إصدار صفقة تصويت من تذكرتهم. والتصويت على حد سواء تمكن الكتلة ليتم بناؤها فوق كتلة سابقة ويختار ما إذا كان أو لم تكن المعاملة العادية السابقة (التي تحتوي على قاعدة عملة والمعاملات ذات الصلة غير ذات الصلة) صالحة.
3. عاملين PoW الأخرين يبدأ من  بناء الكتلة، وإدراج أصوات عاملي PoS. ويجب إدراج أغلبية الأصوات المدلى بها في الكتلة التالية لكي تقبل الشبكة هذه الكتلة. ومن بين عمليات التصويت في هذه الكتلة الجديدة، يقوم عاملي مناجم النفط بفحص علم لمعرفة ما إذا كان عامل التعدين في الخدمة قد أشار إلى ما إذا كانت شجرة المعاملات المعتادة الصالحة. ويتم تحديد أعلام التصويت هذه، وبناء على تصويت الأغلبية، يتم تعيين علم قليلا في هذه الكتلة للإشارة إلى ما إذا كانت المعاملات العادية في الكتلة السابقة صالحة.
4. A nonce is found that satisfies the network difficulty, and the block is inserted into the blockchain. If the previous block's regular transaction tree was validated, insert these transactions into the UTXO set. Go to 1.

To discourage manipulation of the included votes, a linear subsidy penalty is applied to the current block if they fail to include all the voting transactions into their block. The "soft" penalty of invalidating the previous transaction tree helps prevent the discarding of work, which is necessary to secure the system, and makes the assumption that the next block will be obtained by a miner who is disinterested in preserving the subsidy of the former block in favour of their own. Even in the case that this is not true, a malicious miner with a high hash rate will still need at least \((\text{number for majority}/2)+1\) votes in favour of their previous block's transaction tree in order to produce a block that gives them any subsidy from the previous block.

جزء من الأعلام  يتم إضافتها بشكل واضح إلى رأس البلوك و التصويت, مما يعني أن يمكن لعامل المنجم التصويت بشكل جديد سواء كان بشكل لين أو صعب.

---

## <i class="fa fa-book"></i> المراجع

[^1]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [إثبات النشاط: توسيع دليل عمل بيتكوين عن طريق إثبات الملكية](https://decred.org/research/bentov2014.pdf).
[^2]: Nakamoto S. 2008. [بيتكوين: نظام النقد الإلكتروني](https://decred.org/research/nakamoto2008.pdf).
