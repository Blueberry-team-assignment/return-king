class Result<T> {
  /// 처리 결과 값
  final T? value;

  /// 결과 값 취득 Exception
  final Exception? exception;

  /// 처리 성공 시 Result를 생성
  /// value에는 null을 지정하지 않도록..
  /// 예) Result<int> success = Result.ok(100);
  Result.ok(this.value) : exception = null {
    if (value == null) {
      throw ArgumentError('Result.ok(value) is null');
    }
  }

  /// 처리 실패 시 Result를 생성
  /// error는 오류 메세지임
  /// null이 아닐 것
  /// Result<int> exception = Result.error(Exception('error'))
  Result.error(this.exception) : value = null {
    if (exception == null) {
      throw ArgumentError('Result.error(exception) is null');
    }
  }

  bool get isOk => exception == null;
  bool get isError => !isOk;

  String? get errorMessage => exception?.toString();

  T get getValue => value!;
  Exception get getError => exception!;
}
