import 'dart:async';

class CounterBloc {
  int value = 0;
  StreamController<int> valueController = StreamController<int>();

  void increment() {
    value++;
    valueController.sink.add(value);
  }

  Stream<int> getStream() {
    return valueController.stream;
  }

  void dispose() {
    valueController.close();
  }
}
