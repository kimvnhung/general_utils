import 'dart:async';

class Comparator<T> {
  final T _expectedResult;
  final Completer _completer = Completer();
  bool get isCompleted => _completer.isCompleted;

  Comparator(this._expectedResult);

  Future<void> get waitForResult => _completer.future;

  void compare(T actualResult) {
    if (actualResult == _expectedResult) {
      _completer.complete();
    }
  }
}
