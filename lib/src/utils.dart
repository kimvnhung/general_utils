import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/services.dart';

class Utils {
  static Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com').timeout(
        const Duration(seconds: 60),
        onTimeout: () => [],
      );
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  static String? timeStringFromMilis(int? milliseconds) {
    if (milliseconds == null) {
      return null;
    }
    return DateFormat("hh:mm dd/MM/yyyy")
        .format(DateTime.fromMillisecondsSinceEpoch(milliseconds));
  }

  static Future<String> generateGuestId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      // return unique id on android
      return androidInfo.serialNumber;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? '';
    }
  }

  static String generateToken() {
    const int tokenLength = 13;
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    String token = '';

    for (int i = 0; i < tokenLength; i++) {
      int randomIndex = random.nextInt(chars.length);
      token += chars[randomIndex];
    }

    return token;
  }

  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return "${packageInfo.version}+${packageInfo.buildNumber}";
  }

  static Future<bool> isAssetPathValid(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (e) {
      return false;
    }
  }
}
