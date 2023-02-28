import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsy/app/modules/country/views/country_view.dart';
import 'package:newsy/app/modules/feed/views/feed_view.dart';

import '../../feed/controllers/feed_controller.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    FeedController.instance.fetchAllNews(null);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<Widget> screens =  [
    const FeedView(),
    CountryView(),
  ];

  var selectedTabIndex = 0.obs;
}
