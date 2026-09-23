# GitHub npm Registry 배포 가이드

## 1. GitHub Personal Access Token 생성

1. GitHub 설정 페이지로 이동: https://github.com/settings/tokens
2. "Generate new token" → "Generate new token (classic)" 클릭
3. 토큰 이름 입력 (예: "npm-publish")
4. 다음 권한 선택:
   - ✅ `write:packages` (패키지 업로드 권한)
   - ✅ `read:packages` (패키지 다운로드 권한)
   - ✅ `delete:packages` (선택사항)
5. "Generate token" 클릭
6. **생성된 토큰을 복사하여 안전한 곳에 보관** (다시 볼 수 없습니다!)

## 2. 환경변수 설정

터미널에서 다음 명령어로 토큰을 환경변수로 설정:

```bash
export GITHUB_TOKEN=ghp_your_token_here
```

또는 영구적으로 설정하려면 `~/.zshrc` 또는 `~/.bashrc`에 추가:

```bash
echo 'export GITHUB_TOKEN=ghp_your_token_here' >> ~/.zshrc
source ~/.zshrc
```

## 3. 배포 실행

```bash
cd /Users/bbroshong/ddocdoc/react-native-naver-map
pnpm publish
```

## 4. 배포 확인

배포가 완료되면 다음 URL에서 확인 가능:
- https://github.com/boostbrothers/react-native-naver-map/packages

## 5. 프로젝트에서 사용하기

다른 프로젝트에서 이 패키지를 사용하려면:

### 5.1 프로젝트에 `.npmrc` 파일 생성

```bash
@boostbrothers:registry=https://npm.pkg.github.com/
//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
```

### 5.2 환경변수 설정

```bash
export GITHUB_TOKEN=ghp_your_token_here
```

### 5.3 패키지 설치

```bash
pnpm add @boostbrothers/react-native-naver-map
# or
npm install @boostbrothers/react-native-naver-map
# or
yarn add @boostbrothers/react-native-naver-map
```

## 주의사항

- GitHub Personal Access Token은 비밀번호처럼 안전하게 관리하세요
- 토큰을 git에 커밋하지 마세요 (`.npmrc` 파일의 `${GITHUB_TOKEN}`은 환경변수를 참조합니다)
- Organization 멤버만 패키지를 다운로드할 수 있습니다 (Public repository라도 마찬가지)
- 팀 멤버들도 각자 GitHub Token을 생성하여 사용해야 합니다

## 버전 업데이트

다음 버전을 배포하려면:

1. `package.json`의 `version` 수정
2. 변경사항 커밋
3. `pnpm build` 실행
4. `pnpm publish` 실행

또는 release-it 사용:

```bash
pnpm release
```

