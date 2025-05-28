extension DurationFormatting on Duration? {
  /// Patterns:
  /// - `d` - days
  /// - `h` - hours
  /// - `m` - minutes
  /// - `s` - seconds
  /// - `D` - days (plural)
  /// - `H` - hours (plural)
  /// - `M` - minutes (plural)
  /// - `S` - seconds (plural)
  ///
  String format(String pattern) {
    if (this == null) return "";

    final days = this?.inDays ?? 0;
    final hours = (this?.inHours ?? 0) % 24;
    final minutes = (this?.inMinutes ?? 0) % 60;
    final seconds = (this?.inSeconds ?? 0) % 60;

    return pattern
        .replaceAll('d', days.toString())
        .replaceAll('h', hours.toString())
        .replaceAll('m', minutes.toString())
        .replaceAll('s', seconds.toString())
        .replaceAll('D', days > 1 ? 'days' : 'day')
        .replaceAll('H', hours > 1 ? 'hours' : 'hour')
        .replaceAll('M', minutes > 1 ? 'minutes' : 'minute')
        .replaceAll('S', seconds > 1 ? 'seconds' : 'second');
  }
}
