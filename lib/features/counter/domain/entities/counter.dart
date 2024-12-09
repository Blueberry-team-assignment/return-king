class Counter {
  final int value;

  // 생성자
  Counter(this.value);

  Counter increment() {
    return Counter(value + 1);
  }

  Counter decrement() {
    if (value > 0) {
      return Counter(value - 1);
    }
    return this;
  }
}