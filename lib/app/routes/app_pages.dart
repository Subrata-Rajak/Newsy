import 'package:get/get.dart';

import '../modules/country/bindings/country_binding.dart';
import '../modules/country/views/country_view.dart';
import '../modules/country_news/bindings/country_news_binding.dart';
import '../modules/country_news/views/country_news_view.dart';
import '../modules/feed/bindings/feed_binding.dart';
import '../modules/feed/views/feed_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FEED,
      page: () => const FeedView(),
      binding: FeedBinding(),
    ),
    GetPage(
      name: _Paths.COUNTRY,
      page: () => CountryView(),
      binding: CountryBinding(),
    ),
    GetPage(
      name: _Paths.COUNTRY_NEWS,
      page: () => const CountryNewsView(),
      binding: CountryNewsBinding(),
    ),
  ];
}
