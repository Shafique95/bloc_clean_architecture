class CounterState {
  final int counter;
  CounterState(this.counter);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CounterState &&
            runtimeType == other.runtimeType &&
            counter == other.counter;
  }

  @override
  int get hashCode => counter.hashCode;
}
