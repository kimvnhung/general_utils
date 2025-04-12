import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:general_utils/src/log.dart';

class MergedAssetLoader extends AssetLoader {
  MergedAssetLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    log.d('load: $path, $locale');
    final mergedMap = <String, dynamic>{};

    // path is prefix of translation folder
    // make localeFolder from path and locale
    // Example: path = 'assets/translations', locale = Locale('en', 'US')
    // localeFolder = 'assets/translations/en-US'
    final localeFolder = '$path/${locale.toLanguageTag()}';

    List<String> tempFilePaths = <String>[];
    // List all .json files in folders list then add to tempFilePaths
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    for (var key in manifestMap.keys) {
      if (key.contains('$localeFolder/') && key.contains('.json')) {
        tempFilePaths.add(key);
      }
    }

    log.d('tempFilePaths: $tempFilePaths');

    for (var filePath in tempFilePaths) {
      final fileContent = await rootBundle.loadString(filePath);
      final Map<String, dynamic> jsonMap = json.decode(fileContent);
      mergedMap.addAll(jsonMap);
    }

    return mergedMap;
  }
}
