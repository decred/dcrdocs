# 수동 CLI 설치 

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. 올바른 파일을 다운로드하십시오.

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. 다운로드 위치로 이동하여 .tar.gz 파일의 압축을 풉니 다.

    Finder: .tar.gz 파일을 두 번 클릭하기 만하면됩니다. <br />
    Terminal: `tar -xvzf filename.tar.gz` 명령을 사용하십시오.

    **참고**: MacOS Sierra에서 Safari를 사용하고 '다운로드 후'안전한 '파일'환경 설정을 사용하는 경우 다운로드 후에 .gz 및 .zip 파일의 압축이 자동으로 풀립니다. `tar -xvzf filename.tar.gz` 명령으로이 오류가 발생합니다 : `tar: Error opening archive: Failed to open 'filename.tar.gz'`. 대신 `tar -xvzf filename.tar` 을 사용하십시오 (이전 명령에서 .gz를 제거하십시오).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. 올바른 파일을 다운로드하십시오.

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. 다운로드 위치로 이동하여 .tar.gz 파일의 압축을 풉니 다.

    Ubuntu File Browser: .tar.gz를 마우스 오른쪽 버튼으로 클릭하고 "Extract Here"를 선택하십시오. <br />
    Terminal: `tar -xvzf filename.tar.gz` 명령을 사용하십시오.
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

참고: Windows 7/8/10은 기본적으로 `.zip` 파일에 대한 지원을 제공하므로 `.zip` 파일을 사용하여 타사 응용 프로그램이 `.tar.gz` 파일에 필요하지 않도록하는 것이 좋습니다. `.zip` 파일에 대한 지시 사항이 제공됩니다.

1. 올바른 파일을 다운로드하십시오.

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. 다운로드 위치로 이동하여 `.zip` 파일의 압축을 풉니다.

    파일 탐색기 : .zip 파일을 마우스 오른쪽 단추로 클릭하고 "모두 추출 ..."을 선택하면 사용할 디렉토리를 묻는 프롬프트가 열립니다. 기본값은 `.zip` 을 같은 이름의 폴더로 추출합니다. `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, `sample-dcrwallet.conf` 를 포함해야합니다.

`.tar.gz` 파일을 다운로드하기로 결정했다면 실제 바이너리를 얻기 위해 일부 타사 응용 프로그램 (7-zip, winRAR 등)에서 두 번의 별도 추출이 필요합니다.

---

## 최소 구성

최소한 `dcrd`, `dcrwallet`, `dcrctl` 이 서로 통신 할 수 있으려면, 동일한 rpcuser / rpcpass 조합으로 실행해야합니다. 수동 구성의 경우 다음 단계를 따르십시오.

1. 위의 [configuration files](#configuration-file-locations) 섹션에 나열된 운영 체제 종속 홈 디렉토리가 존재하지 않으면 `dcrd`, `dcrwallet`, 및 `dcrctl` 에 대해 작성하십시오.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. 임의의 사용자 이름과 암호를 선택하십시오. 이들은 원격 프로 시저 호출을 통해 통신 할 각 응용 프로그램에 대해서만 사용됩니다. 가장 쉬운 구성은 모두 동일하게 설정하는 것입니다.
6. `dcrd.conf`, 안에 `[Application Options]`, 밑에 다음 줄을 추가하십시오 :<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. `dcrwallet.conf`, 안에 `[Application Options]`, 밑에 다음 줄을 추가하십시오 :<br /><br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. `dcrctl.conf`, 안에 다음 줄을 추가하십시오 :<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. 세 가지 구성 파일을 모두 저장하십시오.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.