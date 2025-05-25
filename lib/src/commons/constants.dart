import 'dart:ui';

class Constants {
  static const Size desktopMinimumSize = Size(1366, 860);
  static const Size tabletSize = Size(1024, 1366);
  static const Size smallTabletSize = Size(768, 1024);
  static const Size mobileSize = Size(430, 932);

  static const Size landscapeDesktopMinimumSize = Size(860, 1366);
  static const Size landscapeTabletSize = Size(1366, 1024);
  static const Size landscapeSmallTabletSize = Size(1024, 768);
  static const Size landscapeMobileSize = Size(932, 430);

  static Size forceDesignSize = Size.zero;
  static Size landscapeForceDesignSize = Size.zero;
}
