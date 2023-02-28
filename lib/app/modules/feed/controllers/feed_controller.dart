import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/services/api/all_news_services.dart';
import '../../../data/api/news_model.dart';

class FeedController extends GetxController {
  static FeedController get instance => Get.put(FeedController());
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
    searchController.dispose();
  }

  final TextEditingController searchController = TextEditingController();
  var searchResultText = "\"Apple\"".obs;

  String getText() {
    searchResultText.value =
        searchController.text.isEmpty ? "\"Apple\"" : searchController.text;
    return searchResultText.value;
  }

  AllNews? allNews;
  var isLoading = false.obs;

  void fetchAllNews(String? keyword) async {
    isLoading.value = true;
    allNews = await AllNewsServices.fetchAllNews(keyword);
    isLoading.value = false;
  }
}
