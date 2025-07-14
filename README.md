# 📱 환율 계산기 앱 - ExchangeRatesApp

실시간 환율 데이터를 기반으로 **금액을 계산하고**, **즐겨찾는 통화 정보를 관리하며**, **등락을 표시하는** 실전 중심의 환율 계산기 앱입니다.

## 🔍 프로젝트 개요

- 외부 Open API로부터 실시간 환율 정보를 받아옵니다.
- 환율 리스트를 UI에 표시하고, 사용자 입력 금액을 다른 통화로 변환합니다.
- 즐겨찾기 기능과 이전 환율 비교를 통해 상승/하락 여부도 제공합니다.
- 앱 종료 후 재시작 시 마지막 화면 상태를 복원합니다.

## ✨ 주요 기능

| 기능 | 설명 |
|------|------|
| ✅ 환율 리스트 | Open API를 통해 실시간 환율 데이터를 받아와 UITableView에 표시 |
| ✅ 환율 계산기 | 환율 데이터를 기반으로 입력 금액을 계산 |
| ✅ 즐겨찾기 | ⭐ 버튼 클릭 시 즐겨찾기에 추가/삭제 및 CoreData 저장 |
| ✅ 등락 표시 | 이전 환율과 비교하여 🔼/🔽 표시 (CoreData 캐싱 기반) |
| ✅ 검색 기능 | 통화 코드 또는 국가명을 실시간 필터링 |
| ✅ 마지막 화면 복원 | 앱 종료 후 재시작 시 마지막 화면 복원 |
| ✅ 다크모드 대응 | systemBackground, label 등 시스템 컬러 사용 |
| ✅ AutoLayout | SnapKit 사용. 다양한 디바이스 및 방향 대응 |
| ❌ 메모리 이슈 디버깅 | 미진행 (Retain Cycle 추정 이슈 없음) |
| ❌ Clean Architecture | 미적용 (MVVM + UseCase + Store 구조로 운영) |

## 🧱 프로젝트 구조
```plaintext
ExchangesApp/
├── App/
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   └── Resources/
│       ├── CurrencyNames.json
│       └── LaunchScreen.storyboard
│
├── Core/
│   ├── Models/
│   │   ├── CurrencyError.swift
│   │   ├── CurrencyItem.swift
│   │   └── ExchangeRate.swift
│   ├── Services/
│   │   ├── CurrencyNameService.swift
│   │   └── ExchangeRateService.swift
│   ├── Stores/
│   │   ├── AppStateStore.swift
│   │   ├── CurrencyStore.swift
│   │   └── FavoriteStore.swift
│   └── UseCases/
│       └── ExchangeRateUseCase.swift
│
├── Persistence/
│   ├── AppState+CoreDataClass.swift
│   ├── AppState+CoreDataProperties.swift
│   ├── FavoriteCurrency+CoreDataClass.swift
│   ├── FavoriteCurrency+CoreDataProperties.swift
│   ├── StoredCurrency+CoreDataClass.swift
│   ├── StoredCurrency+CoreDataProperties.swift
│   └── ExchangesApp.xcdatamodeld
│
├── Presentation/
│   ├── Calculator/
│   │   ├── CalculatorView.swift
│   │   ├── CalculatorViewController.swift
│   │   └── CalculatorViewModel.swift
│   └── ExchangeRate/
│       ├── ExchangeRateCell.swift
│       ├── ExchangeRateView.swift
│       ├── ExchangeRateViewController.swift
│       └── ExchangeRateViewModel.swift
│
├── Shared/
│   ├── Extensions/
│   │   └── UIViewController+Alert.swift
│   ├── Protocols/
│   │   └── ViewModelProtocol.swift
│   └── Utilities/
│       └── AlertFactory.swift
│
└── Info.plist
```

✅ 역할 기반 디렉토리로 분리하여 가독성 및 유지보수성 향상!



## 🛠 기술 스택
	•	UIKit / SnapKit: 레이아웃 구성
	•	Alamofire: 네트워크 통신
	•	Codable: JSON 파싱
	•	CoreData: 환율/즐겨찾기 캐싱
	•	MVVM 아키텍처
	•	Dark Mode 대응: system 색상 활용



## 📦 설치 및 실행 방법
1. Xcode 15 이상에서 프로젝트 열기
2. 패키지 매니저로 Alamofire, SnapKit 설치
3. 실행 (iOS 16 이상 시뮬레이터 권장)

## 🧾 API 출처
	•	https://open.er-api.com/v6/latest/USD

