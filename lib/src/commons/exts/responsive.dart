import 'package:flutter/material.dart';
import 'package:general_utils/src/commons/constants.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? smallTablet,
    T? tablet,
    T? desktop,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= _desktopSize().width
        ? (desktop ?? tablet ?? smallTablet ?? defaultVal)
        : wd >= _tabletSize().width
            ? (tablet ?? smallTablet ?? defaultVal)
            : wd >= _smallTabletSize().width
                ? (smallTablet ?? defaultVal)
                : defaultVal;
  }

  Size designSize() {
    return responsive<Size>(
      defaultSize(),
      smallTablet: _smallTabletSize(),
      tablet: _tabletSize(),
      desktop: _desktopSize(),
    );
  }

  Size defaultSize() {
    return _mobileSize();
  }

  Size _mobileSize() {
    return orientation<Size>(
      Constants.MOBILE_SIZE,
      landscape: Constants.LANDSCAPE_MOBILE_SIZE,
    );
  }

  Size _tabletSize() {
    return orientation<Size>(
      Constants.TABLET_SIZE,
      landscape: Constants.LANDSCAPE_TABLET_SIZE,
    );
  }

  Size _smallTabletSize() {
    return orientation<Size>(
      Constants.SMALL_TABLET_SIZE,
      landscape: Constants.LANDSCAPE_SMALL_TABLET_SIZE,
    );
  }

  Size _desktopSize() {
    return orientation<Size>(
      Constants.DESKTOP_MINIMUM_SIZE,
      landscape: Constants.LANDSCAPE_DESKTOP_MINIMUM_SIZE,
    );
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
