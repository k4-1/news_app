import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/model/news_model.dart';
import 'package:technical_test/app/modules/home/controllers/home_controller.dart';
import 'package:technical_test/app/modules/home/widgets/news_widgets/greeting_time.dart';
import 'package:technical_test/app/modules/home/widgets/news_widgets/news_card.dart';
import 'package:technical_test/app/modules/home/widgets/news_widgets/news_list.dart';

class NewsView extends GetView<HomeController> {
  const NewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(controller.getStorage.read('tabLength'));
    return Obx(() => Scaffold(
          body: Snap(
            controller: controller.scroll.bottomNavigationBar,
            child: NestedScrollView(
              floatHeaderSlivers: true,
              controller: controller.scroll,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverAppBar(
                      toolbarHeight: 12.0.hp,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      pinned: true,
                      floating: true,
                      snap: true,
                      forceElevated: innerBoxIsScrolled,
                      title: GreetingTime(
                        controller: controller,
                      ),
                      bottom: ButtonsTabBar(
                        controller: controller.tabCtrl,
                        backgroundColor: kCyanCornflowerBlueColor,
                        unselectedBackgroundColor: kAzureishWhiteColor,
                        unselectedLabelStyle: GoogleFonts.poppins(
                          fontSize: 10.0.sp,
                          fontWeight: FontWeight.bold,
                          color: kCyanCornflowerBlueColor,
                        ),
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 10.0.sp,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 9.0.wp),
                        radius: 5.0.wp,
                        tabs: controller.tabX.value,
                      ),
                    ),
                  ),
                ),
              ],
              body: TabBarView(
                controller: controller.tabCtrl,
                children: controller.tabX.map((Tab tab) {
                  final String label = tab.text!;
                  if (label == 'Trending') {
                    return NewsList(controller.fetchTrending);
                  }
                  if (label == 'News') {
                    return NewsList(controller.fetchNews);
                  }
                  return NewsList(controller.fetchLatest);
                }).toList(),
              ),
            ),
          ),
        ));
  }
}
