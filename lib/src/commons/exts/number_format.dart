import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

extension DisplayInt on int {
  String cf({String locale = 'vi_VN'}) {
    return NumberFormat.currency(locale: locale, symbol: '').format(this);
  }
}

extension DisplayDouble on double {
  String cf({String locale = 'vi_VN'}) {
    return NumberFormat.currency(locale: locale, symbol: '').format(this);
  }

  String lo(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final format = NumberFormat.decimalPattern(
      '${locale.languageCode}_${locale.countryCode}',
    );
    return format.format(this);
  }
}
