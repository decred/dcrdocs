# <i class="fa fa-hdd-o"></i> 월렛 삭제

지갑을 삭제해야 할 경우에는 몇 가지 이유가 있습니다.

* 씨드에서 지갑을 복원해야할경우.
* 당신은 더 이상 씨드가 없고 새로운 지갑을 만들어야할 경우.
* 특정 컴퓨터에서 지갑을 제거하려고할 경우

먼저 플랫폼별로 다른 dcrwallet 응용 프로그램 디렉토리를 찾아야합니다.
이것은 [구성 파일](/getting-started/startup-basics.md#configuration-files) 의 홈 디렉토리와 동일한 디렉토리입니다.

그 디렉토리에서 `mainnet/wallet.db`파일을 삭제해야합니다.
그러면 컴퓨터에서 지갑이 완전히 제거됩니다. 
다시 원래의 씨앗에서 복원해야합니다.

가능하면 (확실하지는 않지만)
삭제 된 파일은 파일 복구 도구를 사용하여 복구 할 수 있습니다.
보안상의 이유로 이것을 삭제하는 경우에는 아래와 같은 보안 삭제도구가 필요할수도 있습니다. 
삭제 도구
[GNU shred](https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html).


