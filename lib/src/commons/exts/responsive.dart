import 'package:flutter/material.dart';

const Size DESKTOP_MINIMUM_SIZE = Size(1366, 860);
const Size TABLET_SIZE = Size(1024, 1366);
const Size SMALL_TABLET_SIZE = Size(768, 1024);
const Size MOBILE_SIZE = Size(430, 932);

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? smallTablet,
    T? tablet,
    T? desktop,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= DESKTOP_MINIMUM_SIZE.width
        ? (desktop ?? tablet ?? smallTablet ?? defaultVal)
        : wd >= TABLET_SIZE.width
            ? (tablet ?? smallTablet ?? defaultVal)
            : wd >= SMALL_TABLET_SIZE.width
                ? (smallTablet ?? defaultVal)
                : defaultVal;
  }

  Size designSize() {
    return orientation<Size>(
      MOBILE_SIZE,
      landscape: DESKTOP_MINIMUM_SIZE,
    );
  }

  Size defaultSize() {
    return MOBILE_SIZE;
  }

  T orientation<T>(
    T defaultValue, {
    T? landscape,
  }) {
    final size = MediaQuery.of(this).size;
    return size.width >= size.height
        ? (landscape ?? defaultValue)
        : defaultValue;
  }
}
