# <i class="fa fa-hdd-o"></i>استخدام  dcrctl

dcrctl يتيح طريقة ضبط كل من البرنامج الخفى `dcrd` والمحفظة
`dcrwallet` باستخدام واجهة json rpc دون الكتابة في الواقع
json.

لتبسيط الأمثلة سوف نفترض أن لديك كل كلمة السر
مخزنة في [config files] (/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i>إيقاف البرامج

لإغلاق البرامج بشكل نظيف

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i>العثور على الارتفاع الحالي للبلوك 

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> راجع رصيدك

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> احصل على عنوان جديد

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> أرسل الأموال الى العنوان

```
dcrctl --wallet sendtoaddress <address> <amount>
```

