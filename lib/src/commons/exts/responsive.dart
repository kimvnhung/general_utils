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
    if (_forceDesignSize() != Size.zero) {
      return _forceDesignSize();
    }

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

  Size _forceDesignSize() {
    return orientation<Size>(
      Constants.forceDesignSize,
      landscape: Constants.landscapeForceDesignSize,
    );
  }

  Size _mobileSize() {
    return orientation<Size>(
      Constants.mobileSize,
      landscape: Constants.landscapeMobileSize,
    );
  }

  Size _tabletSize() {
    return orientation<Size>(
      Constants.tabletSize,
      landscape: Constants.landscapeTabletSize,
    );
  }

  Size _smallTabletSize() {
    return orientation<Size>(
      Constants.smallTabletSize,
      landscape: Constants.landscapeSmallTabletSize,
    );
  }

  Size _desktopSize() {
    return orientation<Size>(
      Constants.desktopMinimumSize,
      landscape: Constants.landscapeDesktopMinimumSize,
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
