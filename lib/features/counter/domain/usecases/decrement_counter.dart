class DecrementCounter {
  Future<int> call(int currentValue) async {
    if (currentValue > 0) {
      return currentValue - 1;
    }
    return currentValue; // 0이하로 내려가지 않도록
  }
}
