# TimFresh_Assignment

> 프로젝트 기간 2023.11.17 ~ 2023.12.01 (14일)
> 기능 구현 기간 2023.11.18 ~ 2023.11.26 (8일) <br>
> [ReadMe](https://hackmd.io/pC_8DRs9QRexV3T6mabpuA)

# 📋 목차
- [🔎 프로젝트 소개](#-프로젝트-소개)
- [📺 프로젝트 실행화면](#-프로젝트-실행화면)
- [🗂 App 구조](#-app-구조)
- [⁇ 고민한 점](#-고민한-점)
- [📋 과제요구사항관리](#-과제요구사항관리)

## 🔎 프로젝트 소개
> 팀프레시 API를 사용한 과제입니다.

### iOS 요구사항 
- [x] Swift로 작성해 주세요.
- [x] 뷰 구성은 SwiftUI로 그려주세요.
- [x] MVVM 패턴을 이용해 주세요.
- [x] 이미지 로딩 라이브러리는 Kingfisher을 이용해 주세요.
- [x] Moya를 통한 API 콜과 파싱을 진행해 주세요.
- [x] DI를 적용한 경우 가산점이 있습니다.
- [x] 클린아키텍처를 적용한 경우 가산점이 있습니다.

## 📺 프로젝트 실행화면

|카테고리 탭화면|나머지 탭화면|카테고리 View 미개발된 기능|
|--|--|--|
|<img src="https://hackmd.io/_uploads/B1ZkRNDHT.png" width="250">|<img src="https://hackmd.io/_uploads/SJk9h4vSa.png" width="250">|<img src="https://hackmd.io/_uploads/H1cN6VDH6.png" width="250">|

|Pagination|카테고리 하위목록 및 SearchValue 선택|
|--|--|
|<img src="https://hackmd.io/_uploads/S18dxrwra.gif" width="250">|<img src="https://hackmd.io/_uploads/H1ooxSwra.gif" width="250">|

|LaunchScreen|상품명 토글|카테고리 대분류 조회 실패|
|--|--|--|
|<img src="https://hackmd.io/_uploads/r1fDhEPSa.png" width="250">|<img src="https://hackmd.io/_uploads/rJW7yBwrT.gif" width="250">|<img src="https://hackmd.io/_uploads/r1aBCEPB6.png" width="250">|

|퀵 메뉴 조회 실패|카테고리 하위목록 조회 실패|카테고리 상품목록 조회 실패|
|--|--|--|
|<img src="https://hackmd.io/_uploads/SkaQ0VDHp.png" width="250">|<img src="https://hackmd.io/_uploads/BkPM6Evr6.png" width="250">|<img src="https://hackmd.io/_uploads/HJipnEwrT.png" width="250">|

---

## 🗂 App 구조

### 기술스택

- SwiftUI
- Combine
- CleanArchitecture + MVVM
- Unit Test

### 외부 라이브러리 

- [Moya](https://github.com/Moya/Moya)
- [KingFisher](https://github.com/onevcat/Kingfisher)

### Version

- **Xcode 15.0.1**
- **iOS 17.0**

### Commit Convention

- Karma

### 🗺️ DI Container

> Clean Architecture로 분리한 Layer들을 ViewModel까지 주입하여 RootView에서 생성하기 위한 여러 고민들이 있었습니다. 그 중 가장 중요하게 생각한 부분은 Category 대분류 List가 나오는 View에서 Detail로 화면 전환이 일어날 때입니다. UIKit에서는 Coordinator 패턴을 사용하여 화면 전환을 할 때, 각 Coordinator를 주입해주면 되었습니다. 하지만 SwiftUI는 View 위에 View가 그려지는 방식으로 어떻게 Coordinator와 유사한 객체를 만들어서 DI Container를 효율적으로 만들 수 있을 지에 대해 고민하였습니다. 

#### Flow Router

> [참고 Repository - Flow Router](https://github.com/mui-z/GithubRepoSearcher-FlowRouter) - iOS 16이상 <br>

> SwiftUI에서는 Flow Router 객체를 만들어 사용하면 AView의 ViewModel과 ADetailView의 ViewModel을 주입할 수 있습니다.

## ⁇ 고민한 점

### MVVM, Clean Architecture

<img width="1765" alt="스크린샷 2023-11-11 10 51 47" src="https://hackmd.io/_uploads/SkDvGHvBT.png">

- 클린 아키텍처의 핵심 개념인 의존성 역전 원칙과 인터페이스를 활용하여 각 레이어를 분리하고, 각 레이어 사이의 의존성을 최소화했습니다. MVVM은 뷰, 뷰 모델, 모델로 구성되어 있으며, 각 역할에 따라 책임을 명확하게 분리했습니다.
이러한 클린 아키텍처와 MVVM의 조합을 통해 프로젝트는 유지 보수성과 확장성을 높이며, 테스트 용이성을 제공합니다. 또한, 코드의 가독성과 재사용성을 향상시키고, 애플리케이션의 비즈니스 로직과 UI를 분리하여 개발 과정을 단순화했습니다. 

### Dependency Direction

<img src="https://i.imgur.com/O7ISX8z.png" width="1500">

**Layers**

> **Domain Layer** = Entities + Use Cases + Repositories Interfaces <br>
> **Data Repositories Layer** = Repositories Implementations + API (Network) <br>
> **Presentation Layer (MVVM)** = ViewModels + Views + Model

- Domain Layer에 다른 레이어(예: Presentation — UIKit, Data Layer — Mapping Codable)가 포함되지 않도록 처리했습니다. 
- Presentation Layer에 Domain Entity를 맵핑하기 위한 Mapper 타입, Model 타입을 구현하여 Domain인과의 의존성을 최소화 시켰습니다.

## 📋 과제요구사항관리

<img width="1225" alt="스크린샷 2023-11-11 13 14 44" src="https://hackmd.io/_uploads/S1ImGBwBT.png">

> GitHub issue 이미지

- 구현할 feature, test에 대한 내용을 Github의 issues에 정리했습니다. 진행할 업무를 정리하고, 우선순위를 정하기 위함입니다. 
- 진행하는 issue들 별로 Todo, In Progress, Done을 통해 Feature History를 관리했습니다.

<img width="1227" alt="스크린샷 2023-11-11 13 15 03" src="https://hackmd.io/_uploads/rJRhbHvra.png">

> GitHub branch 이미지

- Branch를 issue별로 분기 처리하여 관리하였습니다.

**Git Flow**

각 Branch의 구현 후, develop 브랜치에 Merge하고 최종적으로 main Branch에 Merge하는 방식으로 과제를 수행하였습니다. 