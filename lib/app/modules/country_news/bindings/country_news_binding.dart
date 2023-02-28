import 'package:get/get.dart';

import '../controllers/country_news_controller.dart';

class CountryNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryNewsController>(
      () => CountryNewsController(),
    );
  }
}
