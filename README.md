# 🔔 UserNotificationKit

## ⭐️ Overview

* 앱에 UserNotifications 프레임워크의 Local Notification 기능을 손쉽게 추가할 수 있습니다.

* Notification 정보를 하나의 구조체 타입으로 관리할 수 있습니다.

* 사용자에게 Notification을 발송하고 연관된 이벤트를 처리할 수 있습니다.

## 📰 Related Articles

UserNotificationKit의 개발과정 및 의도는 다음의 블로그 게시물에서 확인하실 수 있습니다.

### 1️⃣ iOS 앱 설계 퓨전 레시피 연재

* [13부 - User Notification](https://singularis7.tistory.com/101)

* [14부 - Local Notification Action](https://singularis7.tistory.com/102)

### 2️⃣ 기술 참조 자료

* [singularis7's Life Note](https://singularis7.tistory.com)

## 🖼️ UML Diagram

| ![UserNotificationKit_UML](https://github.com/smart8612/UserNotificationKit/assets/25794814/ef9de542-6ca1-4510-8604-5acaf9254fd3) |
| :----------------------------------------------------------: |

## 🛠️ Used Technology

#### 도구

`#Xcode` `#Swift` `#UserNotifications`

#### 모델링

`#Protocol-Oriented Programming`

#### 비동기 API 및 동시성

`#Grand Central Dispatch(GCD)`

## ⚙️ Installation

### Swift Package Manager

* Apple 플랫폼의 응용프로그램을 개발하는 프로젝트에서는 Xcode UI를 통해 UserNotificationKit에 대한 의존성을 추가하실 수 있습니다.
* SPM 패키지 프로젝트를 통해 개발 중이어도 `Package.swift` 파일을 수정하여 UserNotificationKit에 대한 의존성을 추가하실 수 있습니다.

#### Xcode UI를 활용한 의존성 추가법 (권장)

1. Xcode의 메뉴바에서 Project Settings를 선택합니다.
2. Project Settings의 하위 메뉴 중 Swift Packages를 선택합니다.
3. Swift Packages 창에서 UserNotificationKit를 추가합니다.

#### Package.swift를 활용한 의존성 추가법

1. 다음의 dependency를 Package.swift에 추가합니다.

```swift
.package(url: "https://github.com/smart8612/UserNotificationKit", branch: "main")
```

2. UserNotificationKit를 사용하고 싶은 target에 의존성을 추가합니다.

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PACKAGE_NAME",
    platforms: [ .iOS(.v14) ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "YOUR_PACKAGE_NAME",
            targets: ["YOUR_PACKAGE_NAME"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/smart8612/UserNotificationKit", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "YOUR_PACKAGE_NAME",
            dependencies: ["UserNotificationKit"]),
    ]
)
```

## 📖 API Documentation

Xcode의 DocC 컴파일러를 활용해 API 도큐멘트를 빌드할 수 있습니다. Build Documentation 기능을 통해 API의 세부 설명을 확인해보세요!

* 단축키: <kbd>control</kbd> + <kbd>shift</kbd> + <kbd>command</kbd> + <kbd>d</kbd>

## 🤼 연관 프로젝트

UserNotificationKit와 연관된 샘플 프로젝트를 다음의 Repository에서 확인하실 수 있습니다.

* 📱 Restaurant Order Application : [OrderApp Toy Project](https://github.com/smart8612/OrderApp-Toy-Project)
