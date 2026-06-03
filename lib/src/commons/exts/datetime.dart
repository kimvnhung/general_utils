import 'package:easy_localization/easy_localization.dart';

extension Datetime2Now on DateTime? {
  String diff() {
    if (this == null) return "";
    final now = DateTime.now();
    final difference = now.difference(this!);

    if (difference.inDays > 0) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hours ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minutes ago";
    } else {
      return "just now";
    }
  }

  String comparablePresent() {
    if (this == null) return "";
    final now = DateTime.now();

    // Same week
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));
    if (this!.day == now.day &&
        this!.month == now.month &&
        this!.year == now.year) {
      // Return starting of today
      return now
          .toLocal()
          .copyWith(
              hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0)
          .toString();
    } else if (this!.day == now.subtract(const Duration(days: 1)).day &&
        this!.month == now.month &&
        this!.year == now.year) {
      // Return starting of yesterday
      return now
          .subtract(const Duration(days: 1))
          .toLocal()
          .copyWith(
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0,
          )
          .toString();
    } else if (this!.isAfter(weekStart) &&
        this!.isBefore(weekEnd.add(Duration(days: 1)))) {
      // Return starting of this week
      return weekStart
          .toLocal()
          .copyWith(
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0,
          )
          .toString();
    }

    // Same month
    if (this!.year == now.year && this!.month == now.month) {
      // Return end of this month
      return now
          .toLocal()
          .copyWith(
            day: DateTime(now.year, now.month + 1, 0).day,
            hour: 23,
            minute: 59,
            second: 59,
            millisecond: 999,
            microsecond: 999,
          )
          .toString();
    }

    // Return end of the month
    return this!
        .toLocal()
        .copyWith(
          day: DateTime(this!.year, this!.month + 1, 0).day,
          hour: 23,
          minute: 59,
          second: 59,
          millisecond: 999,
          microsecond: 999,
        )
        .toString();
  }

  /// Returns a human-friendly label for the date.
  ///
  /// - Today → `'today'.tr()`
  /// - Tomorrow → `'tomorrow'.tr()`
  /// - Yesterday → `'yesterday'.tr()`
  /// - Otherwise → `dd/MM/yyyy`
  String dateLabel() {
    if (this == null) return "";
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final d = DateTime(this!.year, this!.month, this!.day);
    if (d == today) return 'today'.tr();
    if (d == today.add(const Duration(days: 1))) return 'tomorrow'.tr();
    if (d == today.subtract(const Duration(days: 1))) return 'yesterday'.tr();
    return DateFormat('dd/MM/yyyy').format(this!);
  }

  String present() {
    if (this == null) return "";
    final now = DateTime.now();
    final localTime = this!.toLocal();

    // Same week
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));
    if (localTime.day == now.day &&
        localTime.month == now.month &&
        localTime.year == now.year) {
      return "today".tr();
    } else if (localTime.day == now.subtract(const Duration(days: 1)).day &&
        localTime.month == now.month &&
        localTime.year == now.year) {
      return "yesterday".tr();
    } else if (localTime.isAfter(weekStart) &&
        localTime.isBefore(weekEnd.add(Duration(days: 1)))) {
      return "thisWeek".tr();
    }

    // Same month
    if (localTime.year == now.year && localTime.month == now.month) {
      return "thisMonth".tr();
    }

    // Over this month
    final monthName = [
      "january".tr(),
      "february".tr(),
      "march".tr(),
      "april".tr(),
      "may".tr(),
      "june".tr(),
      "july".tr(),
      "august".tr(),
      "september".tr(),
      "october".tr(),
      "november".tr(),
      "december".tr()
    ][localTime.month - 1];
    return "$monthName, ${localTime.year}";
  }
}
