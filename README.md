# TeamIntroApp

팀원 소개를 위한 iOS 애플리케이션입니다. 팀원들의 정보를 한눈에 볼 수 있고, 각 팀원의 상세 정보를 확인할 수 있습니다.

<img width="1010" alt="image" src="https://github.com/user-attachments/assets/05d7c139-4182-4de2-8a5f-f969b9fb4fee" />

## 주요 기능

- 🎯 팀 정보 보기
- 👥 팀원 목록 보기
- 👤 팀원 상세 정보 보기
  - MBTI
  - 강점
  - 협업 스타일
  - 블로그 링크 (WebView로 보기)

## 기술 스택

- Swift
- UIKit
- Storyboard
- Model - View - Controller

## 화면 구성

1. **스플래시 화면**
   - 앱 시작 시 표시되는 화면

2. **팀원 목록 화면**
   - 팀 이미지와 팀원들의 프로필 이미지 표시
   - 각 팀원 탭 시 상세 정보로 이동

3. **팀원 상세 정보 화면**
   - 선택한 팀원의 상세 정보 표시
   - MBTI, 강점, 협업 스타일, 블로그 링크 등 포함

4. **팀 정보 화면**
   - 팀에 대한 전반적인 정보 표시

5. **블로그 웹뷰 화면**
    - 팀에 대한 전반적인 정보 표시

## 설치 및 실행

1. Xcode 설치
2. 프로젝트 클론
```bash
git clone https://github.com/TeamJustOne/TeamIntroApp.git
```
3. Xcode에서 프로젝트 열기
4. 시뮬레이터 또는 실제 기기에서 실행

## 개발 환경

- iOS 16.0 이상

## 프로젝트 구조

### 폴더 구조
```
TeamIntroApp/
├── Presentation/     # View와 Controller 역할
│   ├── ViewControllers/    # 화면별 ViewController
│   └── Storyboards/       # UI 스토리보드
├── Data/            # Model 역할
│   ├── Model/       # 데이터 모델
│   ├── Repository/  # 데이터 접근 계층
│   └── Source/      # 데이터 소스
├── Resource/        # 리소스 파일
│   ├── Assets/      # 이미지, 색상 등
└── App/             # 앱의 진입점과 설정
    ├── AppDelegate.swift
    └── SceneDelegate.swift
```

### 각 폴더별 역할

1. **Presentation 디렉토리**
   - View와 Controller 역할을 담당
   - 화면별 ViewController와 Storyboard 파일 포함
   - 사용자 인터페이스와 사용자 상호작용 처리

2. **Data 디렉토리**
   - Model 역할을 담당
   - 데이터 모델 정의
   - Repository 패턴을 통한 데이터 접근 계층 구현
   - 데이터 소스 관리

3. **Resource 디렉토리**
   - 리소스 파일들 관리
   - 이미지, 색상, 폰트 등 정적 리소스 포함

4. **App 디렉토리**
   - 앱의 진입점과 설정 관리
   - AppDelegate, SceneDelegate 등 앱 생명주기 관리

### 데이터 흐름

1. **데이터 흐름 순서**
   ```
   DataSource(JSON/RTF) -> Repository -> ViewController
   ```

2. **각 계층의 역할**
   - **DataSource**: JSON, RTF 등의 원본 데이터 소스 관리
   - **Repository**: 데이터 소스로부터 데이터를 가져와 가공
   - **ViewController**: Repository로부터 가공된 데이터를 받아 UI 표시

3. **데이터 처리 과정**
   - DataSource에서 원본 데이터(JSON/RTF) 로드
   - Repository가 DataSource로부터 데이터를 가져와 Model 객체로 변환
   - ViewController가 Repository를 통해 데이터 요청
   - 변환된 데이터를 UI에 표시

## 라이선스

이 프로젝트는 MIT 라이선스를 따릅니다. 
