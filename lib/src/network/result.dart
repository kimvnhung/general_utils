class Result<T> {
  Result({
    this.dynamicMessage,
    this.result,
    this.code = 200,
  });
  final T? result;
  final int? code;
  bool get success => result != null;
  final dynamic dynamicMessage;
  String get message {
    try {
      if (dynamicMessage is List) {
        return dynamicMessage.first;
      }
      return dynamicMessage ?? 'Unknown';
    } catch (e) {
      return dynamicMessage.toString();
    }
  }
}
