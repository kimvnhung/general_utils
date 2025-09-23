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
      // Return starting of this month
      return now
          .toLocal()
          .copyWith(
            day: 1,
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0,
          )
          .toString();
    }

    // Return starting of the month
    return this!
        .toLocal()
        .copyWith(
          day: 1,
          hour: 0,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0,
        )
        .toString();
  }

  String present() {
    if (this == null) return "";
    final now = DateTime.now();

    // Same week
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(Duration(days: 6));
    if (this!.day == now.day &&
        this!.month == now.month &&
        this!.year == now.year) {
      return "today".tr();
    } else if (this!.day == now.subtract(const Duration(days: 1)).day &&
        this!.month == now.month &&
        this!.year == now.year) {
      return "yesterday".tr();
    } else if (this!.isAfter(weekStart) &&
        this!.isBefore(weekEnd.add(Duration(days: 1)))) {
      return "thisWeek".tr();
    }

    // Same month
    if (this!.year == now.year && this!.month == now.month) {
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
    ][this!.month - 1];
    return "$monthName, ${this!.year}";
  }
}
