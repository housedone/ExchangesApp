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

## 🧱 프로젝트 구조 및 역할
```plaintext
# 📄 파일 구조 및 역할 요약

이 문서는 `ExchangeRatesApp` 프로젝트의 각 파일이 담당하는 역할을 간략히 설명합니다.

---

## 📁 App

| 파일명 | 설명 |
|--------|------|
| `AppDelegate.swift` | CoreData 초기화 및 앱 생명주기 처리 |
| `SceneDelegate.swift` | 앱 실행 시 첫 화면 설정 및 상태 복원 |
| `CurrencyNames.json` | 통화 코드 - 국가명 매핑용 로컬 JSON 파일 |

---

## 📁 Core

### 📂 Models

| 파일명 | 설명 |
|--------|------|
| `CurrencyError.swift` | 에러 enum 정의 및 알럿 메시지 제공 |
| `CurrencyItem.swift` | UI 표시용 통화 정보 모델 (`trend`, `isFavorite` 포함) |
| `ExchangeRate.swift` | API 응답을 파싱할 Codable 모델 구조체 |

### 📂 Services

| 파일명 | 설명 |
|--------|------|
| `CurrencyNameService.swift` | 통화명 JSON 파일 디코딩 서비스 |
| `ExchangeRateService.swift` | Open API에서 환율 데이터를 받아오는 서비스 (Alamofire 사용) |

### 📂 Stores

| 파일명 | 설명 |
|--------|------|
| `AppStateStore.swift` | 마지막 화면 상태 저장/복원 CoreData 연동 |
| `CurrencyStore.swift` | 환율 캐싱, 트렌드 계산, CoreData 저장 로직 |
| `FavoriteStore.swift` | 즐겨찾기 저장 및 삭제 CoreData 연동 |

### 📂 UseCases

| 파일명 | 설명 |
|--------|------|
| `ExchangeRateUseCase.swift` | Service/Store를 조합하여 ViewModel에 데이터 제공 |

---

## 📁 Persistence

| 파일명 | 설명 |
|--------|------|
| `AppState+CoreData...` | 마지막 화면 상태용 CoreData 엔티티 |
| `FavoriteCurrency+CoreData...` | 즐겨찾기 통화 정보용 CoreData 엔티티 |
| `StoredCurrency+CoreData...` | 환율 + 등락 캐싱용 CoreData 엔티티 |
| `ExchangesApp.xcdatamodeld` | CoreData 모델링 (엔티티/속성 정의 포함) |

---

## 📁 Presentation

### 📂 Calculator

| 파일명 | 설명 |
|--------|------|
| `CalculatorView.swift` | 계산기 UI 구성 (입력 필드, 결과 레이블 포함) |
| `CalculatorViewController.swift` | 환율 계산 처리 및 화면 전환 제어 |
| `CalculatorViewModel.swift` | 입력 → 환산 계산 로직 및 상태 저장 |

### 📂 ExchangeRate

| 파일명 | 설명 |
|--------|------|
| `ExchangeRateCell.swift` | 셀 UI 정의 (코드, 이름, 환율, 즐겨찾기, 등락 표시) |
| `ExchangeRateView.swift` | 테이블뷰 + 검색바 + emptyLabel 포함 UI |
| `ExchangeRateViewController.swift` | 검색, 즐겨찾기, 화면 전환 등 뷰 로직 처리 |
| `ExchangeRateViewModel.swift` | 환율 조회, 필터링, 즐겨찾기 로직 처리 (MVVM의 VM) |

---

## 📁 Shared

### 📂 Extensions

| 파일명 | 설명 |
|--------|------|
| `UIViewController+Alert.swift` | CurrencyError에 따른 알럿 팝업 함수 확장 |

### 📂 Protocols

| 파일명 | 설명 |
|--------|------|
| `ViewModelProtocol.swift` | ViewModel 공통 프로토콜 (Action, State 등) |

### 📂 Utilities

| 파일명 | 설명 |
|--------|------|
| `AlertFactory.swift` | 재사용 가능한 AlertController 생성 유틸 |

---

## 📜 Info.plist

| 파일명 | 설명 |
|--------|------|
| `Info.plist` | 앱 기본 정보 및 설정 (권한, 번들 ID 등) |

---
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

