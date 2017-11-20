# Decred 풀 요청 및 기여 

---

Decred의 모든 코드는 GitHub에 보관됩니다. 이 문서는 코드 기여를 처리하는 방법과 기여 방법에 대한 기본 정보를 제공합니다. 부분적으로는 [btcsuite](https://github.com/btcsuite) 와 비슷한 문서를 기반으로합니다.

---

## 초기 준비 

일단, [Code Contribution Guidelines documentation](https://github.com/decred/dcrd/blob/master/docs/code_contribution_guidelines.md) 을 읽어보고 해당 정책에 대한 올바른 이해를 얻으십시오.
계획. 이 문서는 주로 Go 코드베이스에 중점을두고 있지만 여전히 좋은 출발점입니다.

다음 예제는 Go 프로젝트 (dcrd, dcrwallet, gominer 등)와 Go (decrediton, Paymetheus, dcrdocs 등)를 사용하지 않는 프로젝트의 두 섹션으로 나뉩니다. 모든 경우에 특정 프로젝트를 설정하는 데 도움이 필요하면 각 프로젝트의 README.md를 확인하십시오.

---

## 일반 모델 

이 과정을 통해 우리는 높은 수준의 코드 품질과 깨끗한 기록을 유지하면서 단순하게 기여하고자합니다. Decred 팀의 구성원은 외부 참여자와 동일한 절차를 따라야합니다.

개요 양식의 해킹 코드 모델은 다음과 같습니다. 이 중 하나라도 이해가되지 않는다면 걱정하지 마십시오. 다음 섹션에서 자세히 설명합니다.

1. 원하는 문제를 찾으십시오. 문제를 설명하는 것이 없으면 지금 할 일을 여십시오.
1. 분기에서 코드를 변경하십시오.x
1. 1.이 변경 사항을 자신의 분기 된 GitHub 저장소로 푸시합니다.
1. 코드를 검토 할 준비가되었거나 다른 개발자의 입력을 원할 때 GitHub 웹 페이지의 주 Repo에서 Pull Request (PR)를 엽니다.
1. 당신이 고치는 이슈를 밝히는 PR에 코멘트를 추가하십시오. Closes # 또는 Fixes # 다음에 문제 번호를 한 줄에 입력하십시오. 이렇게하면 GitHub에서 자동으로 PR을 문제에 연결하고 PR이 닫힐 때 문제를 닫을 수 있습니다.
1. GitHub 웹 페이지에서 특정 리뷰어를 요청할 수 있으며, 누군가에게 irc / slack에 대해 검토하도록 요청할 수 있습니다.
1. 모든 코드는 검토가 끝나기 전에 하나 이상의 승인을 받아야합니다. 팀 구성원 만 공식 승인을 할 수 있지만 다른 사용자의 의견은 권장됩니다.
1. 요청 된 변경 사항이있을 경우 해당 변경 사항을 작성하여 지사로 위임하십시오.
1. 해킹당한 동일한 지점으로 변경 사항을 푸시하십시오. 그런 식으로 PR에 나타나게되며, 그러면 리뷰어는 이전 버전과 비교할 수 있습니다.
1. Once your code is approved, it can be merged into master.  To keep history clean, we only allow non-fast-forward merges (that means we want a linear history).  Most PRs also must be squashed to a single commit (although if there is reason to have it as multiple commits that can be considered on a case by case basis).
1. PR이 단일 커밋 (또는 자동으로 GitHub에 의해 스쿼시 될 수 있음)이고 마스터로 진행되면 검토자가 PR을 병합합니다. 지사가 너무 늦은 경우 커밋을 리베이스하라는 메시지가 표시 될 수 있습니다. 완료되고 푸시되면 검토자가 커밋을 병합합니다.

---

## 이동 

Go를 사용하는 프로젝트의 경우이 절차를 수행 할 수 있습니다. dcrd가 예제로 사용됩니다. 이것은 이미 go1.6 이상이 설치되어 있고 작동중인 `$GOPATH` 라고 가정합니다.

### 한 번 설정
- GitHub에서 포크 dcrd
- 다음 명령을 실행하여 dcrd 및 모든 종속성을 가져 와서 설치하십시오.

```bash
$ mkdir -p $GOPATH/src/github.com/decred/
$ git clone https://github.com/decred/dcrd $GOPATH/src/github.com/decred/dcrd
$ cd $GOPATH/src/github.com/decred/dcrd
$ go dep ensure
$ go install . ./cmd/...
```

- 귀하의 포크에 대한 자식 원격 추가 :

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrd.git
```

## 기타 프로젝트 

Go로 작성되지 않은 프로젝트의 경우 초기 설정은 프로젝트에 따라 다릅니다. 여기서는 예제로 dcrdocs를 사용 하겠지만 기본 단계는 모든 프로젝트에서 동일합니다. 특정 설정은 프로젝트 README.md에서 볼 수 있습니다 (예를 들어 mkdocs를 설치하여 dcrdocs 또는 전자 작업을 설치하는 방법).

### 한 번 설정 
- GitHub에서 포크 dcrdocs
- 다음 명령을 실행하여 dcrd 및 모든 종속성을 가져 와서 설치하십시오.

```bash
$ mkdir -p code/decred
$ cd code/decred
$ git clone https://github.com/decred/dcrdocs
$ cd dcrdocs
```

- 귀하의 포크에 대한 자식 원격 추가 :

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrdocs.git
```

## 새로운 기능 풀 요청 만들기 
- 작업 할 기능에 대한 GitHub 레포 (원래가 아닌 포크)를 찾거나 만듭니다.
- 수행 할 변경 사항을 저장할 새 지형지물을 체크 아웃합니다.

```bash
$ git checkout -b <feature_branch>
```
- 기능에 필요한 모든 사항을 변경하고 커밋하십시오.
- 기능 분기를 포크로 밀어 넣으십시오.

```bash
$ git push <yourname> <feature_branch>
```
- 브라우저를 사용하여 https://github.com/decred/dcrd를 탐색하십시오.
- GitHub UI로 끌어 오기 요청을 만듭니다. GitHub 웹 페이지에서 리뷰어를 요청하거나 irc / slack에서 누군가에게 질문 할 수 있습니다.

## 기존 끌어 오기 요청 중 하나 재부팅 

때로는 최신 master 브랜치로 pull 요청을 rebase 및 squash 요청할 것입니다.

- 마스터 브랜치가 최신인지 확인하십시오.

```bash
$ git checkout master
$ git pull
```
- 기존 지형지물을 체크 아웃하고 대화형 플래그로 전환합니다.

```bash
$ git checkout <feature_branch>
$ git rebase -i master
```
- Follow the directions presented to specify 's' meaning squash for the additional commits (the first commit must remain 'p' or 'pick').
- 포함 된 모든 커미트를 포함하도록 설정 한 단일 커밋 메시지를 편집기에 작성하십시오.
- 편집기를 저장하고 닫으면 git은 지정한 메시지와 추가 한 모든 커밋으로 단일 커밋을 생성해야합니다. ```git show``` 명령으로 커밋을 확인할 수 있습니다.
- F포크로 지점을 밀어 넣으십시오.

```bash
$ git push -f <yourname> <feature_branch>
```

## 기타 고려 사항 

끌어 오기 요청을 할 때 고려해야 할 몇 가지 사항이 있습니다. Go 코드의 경우 이미 상당한 테스트 커버리지가 있습니다. 코드를 추가하는 경우 테스트를 추가해야합니다. 무언가를 수정한다면 기존의 테스트에 차질이 없는지 확인해야합니다. Go 코드에는 테스트를 실행하는 각 repo와 우리가 가지고있는 정적 체커에 ```goclean.sh``` 스크립트가 있습니다. 모든 테스트를 통과하지 않고는 코드를 수락하지 않습니다. node.js 코드 (decrediton)의 경우 모든 코드가 eslint를 전달해야합니다. ```npm run lint``` 명령으로 이를 확인할 수 있습니다.

마지막으로 각 repo에는 라이센스가 있습니다. 새 코드는 기존 코드와 동일한 라이센스하에 있어야하며 'The Decred Developers'에게 저작권이 부여되어야합니다. 대부분의 경우 이것은 매우 자유주의 ISC 라이센스지만 몇 repos가 다릅니다. 반드시 repo를 확인하십시오.

기고에 대한 질문이 있으시면 irc / slack 또는 GitHub에서 언제든지 물어보십시오. 팀 멤버들 (그리고 아마 커뮤니티 회원들도)이 기꺼이 도와 드리겠습니다.
