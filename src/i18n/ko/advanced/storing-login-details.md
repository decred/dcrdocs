# <i class="fa fa-hdd-o"></i> 로그인 세부 정보 저장

dcrd를 시작하는 동안 명령 줄에 지정된 모든 매개 변수,
dcrwallet 및 dcrctl은 구성 파일에도 보관할 수 있습니다. 이것은 매번 로그인 정보를 입력하지 않아도 되게 로그인 자격 증명을 저장하는 좋은 방법입니다.

---

## <i class="fa fa-laptop"></i> 구성 파일 기본 사항

구성 파일의 기본 사항에 익숙하지 않은 경우 [Startup Options Intro](/getting-started/startup-basics.md#configuration-files) 페이지의 정보를 검토하십시오.

---

## <i class="fa fa-terminal"></i> dcrd.conf 

다음 단계에서 원하는 사용자 이름과 암호를 선택하십시오. 등록 할 필요가 없습니다.
어디서나 사용할 수 있으며 `dcrwallet` 과 `dcrctl` 이 `dcrd` 와 통신 할 수있게합니다.

> 샘플 구성 파일 사용

샘플 구성 파일을 해당 디렉토리에 이미 복사 한 경우 아래 단계를 수행하십시오.

1. 에 설명 된대로 `dcrd` 응용 프로그램 폴더로 이동하십시오. [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. 텍스트 편집기에서 `dcrd.conf` 를 엽니 다.
3. 다음 줄을 찾습니다:

    `;rpcuser=` <br />
    `;rpcpass=`

4. 세미콜론을 제거하여 줄의 주석을 제거하고 선택한 줄의 사용자 이름과 암호를 추가하십시오.

> 새 구성 파일 만들기

샘플 구성 파일을 적절한 디렉토리에 복사하지 **않은** 경우 아래 단계를 따르십시오.

1. 우리의 `dcrd` 에 설명 된대로 dcrd 응용 프로그램 폴더로 이동하십시오 [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. 새 텍스트 파일을 만듭니다.
3. 이름을 `dcrd.conf` 로 변경하십시오.
3. 텍스트 편집기에서 `dcrd.conf` 를 엽니 다.
4. 다음 행을 추가하십시오:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-terminal"></i> dcrwallet.conf 

 `dcrwallet.conf` 절차는 `dcrd.conf` 절차와 매우 유사합니다.

Please note that if the values of `username=` and `password=` in `dcrwallet.conf` do not match the values of `rpcuser=` and `rpcpass=` in  `dcrd.conf`, you will need to set `dcrdusername=` and `dcrdpassword=`  in `dcrwallet.conf` to the `rpcuser`/`rpcpass` values found in `dcrd.conf` (it is easiest to set all of the username/passwords the same).

> 샘플 구성 파일 사용

샘플 구성 파일을 해당 디렉토리에 이미 복사 한 경우 아래 단계를 수행하십시오.

1. 에 설명 된대로 `dcrwallet` 응용 프로그램 폴더로 이동하십시오. [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. 텍스트 편집기에서 `dcrwallet.conf` 를 엽니 다.
3. 다음 줄을 찾습니다:

    `;username=` <br />
    `;password=`

4. 세미콜론을 제거하여 줄의 주석을 제거하고 선택한 줄의 사용자 이름과 암호를 추가하십시오.

> 새 구성 파일 만들기

샘플 구성 파일을 적절한 디렉토리에 복사하지 **않은** 경우 아래 단계를 따르십시오.

1. 에 설명 된대로 `dcrwallet` 응용 프로그램 폴더로 이동하십시오 [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. 새 텍스트 파일을 만듭니다.
3. 이름을 `dcrwallet.conf` 로 변경하십시오.
3. 텍스트 편집기에서 `dcrwallet.conf` 를 엽니 다.
4. 다음 행을 추가하십시오:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

지갑의 선택적 공용 암호 (두 번째 암호
지갑 생성 도중) `dcrwallet.conf` 에 추가 할 수 있습니다 :

```no-highlight
walletpass=<yourwalletpassword>
```

구성 파일에서 개인 지갑 암호를 지정할 수 없습니다. 그것은 `dcrctl` 을 사용하여 수동으로 입력해야합니다.

---

## <i class="fa fa-terminal"></i> dcrctl.conf 

 `dcrd.conf`, `dcrwallet.conf`, `dcrctl.conf` 에서 사용자 이름과 패스워드를 똑같이 설정하는 것이 가장 쉽습니다. dcrwallet에 다른 자격 증명을 사용한 경우 명령을 실행할 때 명령 줄에서 여기와 다른 자격 증명을 지정해야합니다.

> 샘플 구성 파일 사용

샘플 구성 파일을 해당 디렉토리에 이미 복사 한 경우 아래 단계를 수행하십시오.

1. [Startup Options Intro](/getting-started/startup-basics.md#configuration-files) 에 설명 된대로 `dcrctl` 응용 프로그램 폴더로 이동하십시오.
2. 텍스트 편집기에서 `dcrctl.conf` 를 엽니 다.
3. 다음 줄을 찾습니다:

    `;rpcuser=` <br />
    `;rpcpass=`

4. 세미콜론을 제거하여 줄의 주석을 제거하고 선택한 줄의 사용자 이름과 암호를 추가하십시오.

> 새 구성 파일 만들기

샘플 구성 파일을 적절한 디렉토리에 복사하지 **않은** 경우 아래 단계를 따르십시오.

1. 1.[Startup Options Intro](/getting-started/startup-basics.md#configuration-files) 에 설명 된대로 `dcrctl` 응용 프로그램 폴더로 이동하십시오.
2. 새 텍스트 파일을 만듭니다.
3. 이름을 `dcrctl.conf` 로 변경하십시오.
3. 텍스트 편집기에서 `dcrctl.conf` 를 엽니다.
4. 다음 행을 추가하십시오:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-tasks"></i> 추가 구성 옵션

모든 명령 행 옵션을 설정 파일에 넣을 수 있습니다.
릴리스 패키지의 샘플 구성 파일은
옵션을 사용하거나 프로그램 중 하나를 `-h` 플래그와 함께 사용하여 지정된 응용 프로그램에 대한 모든 옵션 목록과 설명을 표시 할 수 있습니다.

[here](/advanced/program-options.md) 에서 찾을 수있는 각 응용 프로그램의 전체 옵션 목록도 있습니다.
