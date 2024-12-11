# 답례왕

## 프로젝트 소개

- 세상에 완벽한 공짜는 없다 되돌려 줘야 다시 돌아오고 그게 바로 인생.. 인건지 저도 잘 모르겠습니다..?
- 받은 선물을 기록하고 답례 내용을 등록합니다.
- 먼저 배풀 수도 있는 것이니 준 선물도 역시 등록이 가능합니다.
- 경조사의 출입금에 대해서도 관리되도록 할 생각입니다.

<br>

## 팀원 구성

<div align="center">

| **조한규** |
| :------: |
| [<img src="siba.png" height=50 width=50> <br/> @hangyuCho](https://github.com/hangyuCho) | 

</div>

<br>

## 1. 개발 환경

- Front : Flutter
- Back-end : -
- 버전 및 이슈관리 : Github, Github Issues, Github Project
- 협업 툴 : Discord
- 서비스 배포 환경 : linode
- 디자인 : -
<br>

## 2. 브랜치 전략

### 브랜치 전략
- Git-flow 전략을 기반으로 main, develop 브랜치와 feature 보조 브랜치를 운용했습니다.
- main, develop, Feat 브랜치로 나누어 개발을 하였습니다.
    - **main** 브랜치는 배포 단계에서만 사용하는 브랜치입니다.
    - **develop** 브랜치는 개발 단계에서 git-flow의 master 역할을 하는 브랜치입니다.
    - **Feat** 브랜치는 기능 단위로 독립적인 개발 환경을 위하여 사용하고 merge 후 각 브랜치를 삭제해주었습니다.

<br>

## 3. 프로젝트 구조

```
/lib
├── core                  
│   ├── error_handling.dart   # 공통 에러 처리
│   └── constants.dart        # 공통 상수
├── features
│   ├── counter
│   │   ├── data
│   │   │   ├── counter_model.dart             # 데이터 모델
│   │   │   ├── local_data_source.dart         # 로컬 데이터 소스
│   │   │   └── counter_repository_impl.dart   # Repository 구현
│   │   ├── domain
│   │   │   ├── entities
│   │   │   │   └── counter.dart               # 엔티티
│   │   │   ├── repositories
│   │   │   │   └── counter_repository.dart    # Repository 인터페이스
│   │   │   └── usecases
│   │   │   │   └── increment_counter.dart     # Use Case
│   │   ├── presentation
│   │   │   ├── providers
│   │   │   │   └── counter_provider.dart      # Riverpod Provider
│   │   │   └── pages
│   │   │       └── counter_page.dart          # UI 화면
├── main.dart             # 앱 진입점
```

<br>