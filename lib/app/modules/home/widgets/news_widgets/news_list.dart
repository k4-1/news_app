import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/model/news_model.dart';
import 'package:technical_test/app/modules/home/controllers/home_controller.dart';
import 'package:technical_test/app/modules/home/widgets/news_widgets/news_card.dart';

class NewsList extends StatelessWidget {
  // final HomeController controller;
  final controller = Get.find<HomeController>();
  final RxList<News> fetchData;
  NewsList(this.fetchData);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: CustomScrollView(
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverPadding(
            padding: EdgeInsets.all(2.0.wp),
            sliver: Obx(
              () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final childCount = fetchData.length;
                    final hasSeparator = index != childCount - 1;
                    final double bottom = hasSeparator ? 0.1.hp : 0.0.hp;
                    final child = NewsCard(
                      index: index,
                      controller: controller,
                      topic:
                          (fetchData.isEmpty) ? '' : fetchData[index].newsTitle,
                      publisherName: (fetchData.isEmpty)
                          ? ''
                          : fetchData[index].publisherName,
                      updated:
                          (fetchData.isEmpty) ? '' : fetchData[index].updated,
                      imageUrl:
                          (fetchData.isEmpty) ? '' : fetchData[index].imageUrl,
                      publisherImage: (fetchData.isEmpty)
                          ? ''
                          : fetchData[index].publisherImageUrl,
                      link: (fetchData.isEmpty) ? '' : fetchData[index].link,
                    );

                    return Container(
                      margin: EdgeInsets.only(bottom: bottom),
                      child: child,
                    );
                  },
                  childCount: fetchData.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
