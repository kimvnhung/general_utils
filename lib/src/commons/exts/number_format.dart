import 'package:easy_localization/easy_localization.dart';

extension DisplayInt on int {
  String cf({String locale = 'vi_VN'}) {
    return NumberFormat.currency(locale: locale, symbol: '').format(this);
  }
}

extension DisplayDouble on double {
  String cf({String locale = 'vi_VN'}) {
    return NumberFormat.currency(locale: locale, symbol: '').format(this);
  }
}
