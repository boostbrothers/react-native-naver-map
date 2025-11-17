<p align="center">
  <a href="https://rnnavermap.mjstudio.net">
    <img width="160px" src="https://raw.githubusercontent.com/mym0404/image-archive/master/202404241422605.webp"><br/>
  </a>
  <h1 align="center">React Native Naver Map</h1>
  <p align="center">
  <a href="https://www.npmjs.com/package/@mj-studio/react-native-naver-map"><img src="https://img.shields.io/npm/dm/@mj-studio/react-native-naver-map.svg?style=flat-square" alt="NPM downloads"></a>
  <a href="https://www.npmjs.com/package/@mj-studio/react-native-naver-map"><img src="https://img.shields.io/npm/v/@mj-studio/react-native-naver-map.svg?style=flat-square" alt="NPM version"></a>
  <img src="https://img.shields.io/badge/Android_SDK-3.23.0-2ea44f?style=flat-square" alt="Android SDK version">
  <img src="https://img.shields.io/badge/iOS_SDK-3.23.0-3522ff?style=flat-square" alt="iOS SDK version">
  <a href="/LICENSE"><img src="https://img.shields.io/npm/l/@mj-studio/react-native-naver-map.svg?style=flat-square" alt="License"></a>
  <h3 align="center">Bring Naver Map to Your React Fingertips</h3>
  </p>
</p>

- [Documentation](https://rnnavermap.mjstudio.net)

<img src="https://raw.githubusercontent.com/mym0404/image-archive/master/202404240329848.gif" width="400" alt="preview">

> [!IMPORTANT]
> `2.4.x` 버전부터 [AI NAVER API에서 제공되던 지도 API가 아닌 새롭게 출시된 Maps 단독 상품](https://www.ncloud.com/support/notice/all/1930?searchKeyword=map&page=1)이 지원됩니다.

## Installation

This is a fork of [@mj-studio/react-native-naver-map](https://github.com/mym0404/react-native-naver-map) with InfoWindow support.

### Install from GitHub npm registry

First, configure npm to use GitHub registry for `@boostbrothers` packages. Create or update `.npmrc` in your project root:

```bash
@boostbrothers:registry=https://npm.pkg.github.com/
//npm.pkg.github.com/:_authToken=${GITHUB_TOKEN}
```

Then install the package:

```bash
npm install @boostbrothers/react-native-naver-map
# or
yarn add @boostbrothers/react-native-naver-map
# or
pnpm add @boostbrothers/react-native-naver-map
```

> [!NOTE]
> You need a GitHub Personal Access Token with `read:packages` permission. 
> Create one at: https://github.com/settings/tokens

## What's New in This Fork

### InfoWindow Support ✨

This fork adds full support for InfoWindow (information popup) on markers and coordinates:

```tsx
import { NaverMapInfoWindow } from '@boostbrothers/react-native-naver-map';

// Display InfoWindow at coordinates
<NaverMapInfoWindow
  latitude={37.5666102}
  longitude={126.9783881}
  text="서울시청"
  textSize={14}
  textColor="black"
  backgroundColor="white"
/>

// Attach InfoWindow to marker
<NaverMapMarkerOverlay
  identifier="marker1"
  latitude={37.5666102}
  longitude={126.9783881}
/>
<NaverMapInfoWindow
  identifier="marker1"
  latitude={37.5666102}
  longitude={126.9783881}
  text="마커 정보"
  isOpen={true}
  fontWeight="bold"
  borderRadius={10}
  borderColor="#4263eb"
/>
```

Features:
- ✅ Full styling support (text, colors, borders, padding) on both Android & iOS
- ✅ Marker attachment
- ✅ Open/Close control
- ✅ Custom positioning and alignment


## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the
development workflow.

## License

MIT
