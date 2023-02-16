import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidable/hidable.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/modules/home/views/news_view.dart';
import 'package:technical_test/app/modules/home/views/settings_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final pages = [
    const NewsView(),
    const SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.navBarIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => Hidable(
          preferredWidgetSize: Size.fromHeight(10.0.hp),
          controller: controller.scroll,
          child: Wrap(
            children: [
              BottomNavigationBar(
                unselectedItemColor: kDarkColor,
                selectedItemColor: kCyanCornflowerBlueColor,
                backgroundColor: kWhiteColor,
                elevation: 10,
                currentIndex: controller.navBarIndex.value,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.newspaper_sharp),
                    label: 'News',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
                onTap: (index) {
                  controller.changeNavBarIndex(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
