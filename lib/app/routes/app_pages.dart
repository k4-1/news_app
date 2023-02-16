import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/news_view.dart';
import '../modules/statistics/bindings/statistics_binding.dart';
import '../modules/statistics/views/statistics_view.dart';
import '../modules/topics/bindings/topics_binding.dart';
import '../modules/topics/views/topics_view.dart';
import '../modules/web/bindings/web_binding.dart';
import '../modules/web/views/web_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.WEB,
      page: () => const BrowseView(),
      binding: WebBinding(),
    ),
    GetPage(
      name: _Paths.TOPICS,
      page: () => const TopicsView(),
      binding: TopicsBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICS,
      page: () => const StatisticsView(),
      binding: StatisticsBinding(),
    ),
  ];
}
