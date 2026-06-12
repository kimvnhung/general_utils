import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension Capitalize on String? {
  String capitalizeFirstLetter() {
    if (this == null) return "";
    List<String> words = this?.split(" ") ?? [];

    for (int i = 0; i < words.length; i++) {
      if (words[i].length > 2) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      } else {
        words[i] = words[i].toUpperCase();
      }
    }

    return words.join(" ");
  }
}

extension ParseLocalizedDouble on String? {
  double? toLocalizedDouble(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final format = NumberFormat.decimalPattern(
      '${locale.languageCode}_${locale.countryCode}',
    );

    try {
      return format.parse(this ?? '').toDouble();
    } catch (e) {
      return null;
    }
  }
}
