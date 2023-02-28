import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          bottomNavigationBar: MotionTabBar(
            initialSelectedTab: "Home",
            useSafeArea: true,
            labels: const [
              "Home",
              "Country",
            ],
            icons: const [
              Icons.home,
              Icons.public,
            ],
            badges: const [
              null,
              null,
            ],
            tabSize: 50,
            tabBarHeight: 55,
            textStyle: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            tabIconColor: Colors.blue[600],
            tabIconSize: 22.0,
            tabIconSelectedSize: 22.0,
            tabSelectedColor: Colors.blue[900],
            tabIconSelectedColor: Colors.white,
            tabBarColor: Colors.white,
            onTabItemSelected: (int value) {
              controller.selectedTabIndex.value = value;
            },
          ),
          body: controller.screens[controller.selectedTabIndex.value],
        );
      },
    );
  }
}
