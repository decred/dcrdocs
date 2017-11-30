# 오류 및 일반적인 문제 

## Paymetheus 

#### 1. 나는 방금 Paymetheus를 사용하기 시작했으나 막혔습니다. 

Paymetheus를 처음 시작할 때 블록 체인을 다운로드합니다. 이것은
Paymetheus는 아무것도하지 않는 것처럼 보일 것입니다.

#### 2. 마스터 개인 키에 대한 암호가 유효하지 않습니다. 

이것은 "암호가 틀립니다"라고 하는것과 같습니다. 잘못된 비밀번호를 입력하셨습니다.

#### 3. "티켓을 구입할 수 없습니다 : 사용할 수있는 자금이 충분하지 않습니다 ..."하지만 지갑에 내가 충분하다고합니다.

미성숙 한 기금이 유효하다고 계산 된 Paymetheus에 알려진 버그가 있습니다. 티켓 표를 얻은 후에는
자금이 여전히 잠겨있는 256 블록 창이 있습니다. 이 상태에서 그들은 미성숙했다고합니다. 기간이 만료되면
그들은 다시 사용할 수있게 될 것입니다.

#### 4. Paymetheus가 잘못된 균형을 나타내고 있습니다. 

> 이 지침은 버전 0.8.x부터 유효하며 이후 버전에서는 작동하지 않을 수 있습니다.

Paymetheus가 잘못된 잔액을 표시하면 명령 줄 유틸리티를 사용하여 일부 파일을 덮어 쓸 수 있습니다.
명령 줄에 익숙하지 않은 경우 혼란스러울 수도 있지만 명령을 한 줄씩 따라야합니다.
너 괜찮을거야. `look like this`, 라는 명령을 보게되면 명령 행에 그대로 복사하여 붙여 넣기 만하면됩니다.
각 명령 다음에 <ENTER> 키를 누르는 것을 잊지 마십시오. 막히면 [Slack channel](https://decred.slack.com) 에 가입하십시오. 누군가가 도움을 줄 것입니다.
먼저 명령을 확인하고 올바르게 입력했는지 확인하십시오. 지갑 씨앗이 필요합니다. 이 프로세스는 약 15 분이 소요됩니다.

1. PowerShell 3 개의 창을 엽니 다. Window 키를 누릅니다. 'powershell'(여기 또는 나중에 따옴표를 입력하지 마십시오)를 입력하고 Enter 키를 누릅니다.
2. 이것을 두 번 더하십시오.
3. 모든 창을 볼 수 있도록 창을 이동하십시오.
4. 다음 명령을 복사하여 붙여 넣으십시오 : `cd $env:programfiles/decred/paymetheus` (powershell에서는 CTRL + V를 누르거나 마우스 오른쪽을 클릭하여 붙여 넣기하십시오). Enter 키를 누릅니다.
5. 다른 두 창에서 동일한 명령을 실행하십시오.
6. Windows 탐색기를 엽니 다.
7. `%localappdata%/decred/paymetheus` 를 위치 표시 줄에 붙여 넣으십시오. Enter 키를 누릅니다.
8. 'mainnet'폴더를 삭제하십시오.
9. PowerShell 창 중 하나로 이동하여 `./dcrd -u <username> -P <password>`. 를 붙여 넣습니다. Enter 키를 누릅니다.
10. 다른 Powershell 창 중 하나로 이동하여 `./dcrwallet --appdata=$env:localappdata/decred/paymetheus --create` 를 붙여 넣습니다.
11. 프롬프트에 따라 시드를 가져옵니다. 추가 암호화 레이어를 묻는 질문에 no라고 말하고 시드가 있는지 묻는 질문에 yes라고 말하십시오.
12. 프롬프트에서 시드 단어를 입력하고 Enter 키를 두 번 누릅니다.
13. 동일한 창에 다음 명령을 붙여 넣으십시오 : `./dcrwallet -u <username> -P <password> --appdata=$env:localappdata/decred/paymetheus`. Enter 키를 누릅니다.
14. 지갑을 만들 때 사용한 개인용 암호 문구를 입력하십시오.
15. 세 번째 PowerShell 창으로 이동하여 `./dcrctl -u <username> -P <password> --wallet -c $env:localappdata/decred/paymetheus/rpc.cert getbalance`. 를 붙여 넣습니다. Enter 키를 누릅니다.
16. 처음 두 창에서 Ctrl + C를 눌러 프로그램을 닫습니다 (dcrd 및 dcrwallet).
17. 세 개의 PowerShell 창을 모두 닫을 수 있습니다.
18. 탐색기 창으로 돌아갑니다. rpc.cert와 rpc.key라는 두 파일을 삭제하십시오.
19. Decem 프로그램을 시작하여 Paymetheus를 다시 사용하십시오.

-----

## 스테이크 증언 

#### 1. 내가 놓친 / 만료 된 티켓 중 일부는 하루 이상 지난 후에도 잠겨 있습니다. 

1. `--enablevoting` 플래그로 지갑 프로세스를 시작하십시오. 그것 없이는 취소하지 않습니다.
2. `dcrctl --wallet walletpassphrase <yourpassphrase> 0`. 을 사용하여 지갑의 잠금을 해제하십시오. 해지를 작성하고 서명 할 수 있으려면 지갑의 잠금을 해제해야합니다.
3. `dcrctl rebroadcastmissed` 로 취소를 발행 할 수 있도록 누락 된 티켓을 지갑에 알리도록 dcrd에게 지시하십시오.


이 시점에서 지갑 로그의 해지 트랜잭션에 대한 세부 정보를 볼 수 있습니다.
이러한 해지 트랜잭션이 블록 (다음 블록이어야 함)으로 채워지면
당신은 자금이 `dcrctl --wallet`
의 미성숙 세대 카테고리로 이동하는 것을 보게 될 것입니다.
마지막으로, 256 블록 후에, 그들은 소비 가능한 범주로 이동하여 지출 할 수있게됩니다.
