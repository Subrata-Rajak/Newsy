import 'package:get/get.dart';
import 'package:newsy/app/data/api/news_model.dart';
import 'package:newsy/common/services/api/country_specific_news.dart';

class CountryNewsController extends GetxController {
  static CountryNewsController get instance => Get.put(CountryNewsController());

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  AllNews? allNews;
  var isLoading = false.obs;

  Future<void> getCountryNews(String countryCode) async {
    isLoading.value = true;
    print(countryCode);
    allNews = await CountryNewsServices.fetchCountryNews(countryCode);
    print(allNews!.articles.length);
    isLoading.value = false;
  }
}
