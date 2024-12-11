#### 디렉토리 구조
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