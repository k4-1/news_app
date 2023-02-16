part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const NEWS = _Paths.NEWS;
  static const SETTINGS = _Paths.SETTINGS;
  static const WEB = _Paths.WEB;
  static const TOPICS = _Paths.TOPICS;
  static const STATISTICS = _Paths.STATISTICS;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const NEWS = '/news';
  static const SETTINGS = '/settings';
  static const WEB = '/web';
  static const TOPICS = '/topics';
  static const STATISTICS = '/statistics';
}
