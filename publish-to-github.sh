#!/bin/bash

# GitHub npm registry 배포 스크립트

set -e

echo "🚀 GitHub npm Registry에 배포를 시작합니다..."

# GITHUB_TOKEN 확인
if [ -z "$GITHUB_TOKEN" ]; then
  echo ""
  echo "❌ GITHUB_TOKEN 환경변수가 설정되지 않았습니다."
  echo ""
  echo "다음 단계를 따라 진행하세요:"
  echo "1. GitHub Personal Access Token 생성: https://github.com/settings/tokens"
  echo "2. 'write:packages' 권한 선택"
  echo "3. 생성된 토큰을 환경변수로 설정:"
  echo ""
  echo "   export GITHUB_TOKEN=ghp_your_token_here"
  echo ""
  echo "4. 이 스크립트를 다시 실행:"
  echo ""
  echo "   ./publish-to-github.sh"
  echo ""
  exit 1
fi

# 현재 버전 확인
CURRENT_VERSION=$(node -p "require('./package.json').version")
echo "📦 현재 버전: v$CURRENT_VERSION"

# Git status 확인
if [[ -n $(git status -s) ]]; then
  echo ""
  echo "⚠️  커밋되지 않은 변경사항이 있습니다."
  read -p "계속 진행하시겠습니까? (y/N): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

# 빌드 실행
echo ""
echo "🔨 빌드를 실행합니다..."
pnpm build

# 배포 실행
echo ""
echo "📤 GitHub npm registry에 배포합니다..."
pnpm publish --no-git-checks

echo ""
echo "✅ 배포가 완료되었습니다!"
echo ""
echo "패키지 확인: https://github.com/boostbrothers/react-native-naver-map/packages"
echo ""
echo "설치 방법:"
echo "  pnpm add @boostbrothers/react-native-naver-map"
echo ""

