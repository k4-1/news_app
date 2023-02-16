import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/core/constants/text_strings.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/modules/topics/controllers/topics_controller.dart';

class CheckBox extends StatelessWidget {
  final TopicsController controller;

  const CheckBox({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: 80.0.wp,
        height: 13.0.hp,
        child: Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                elevation: 4,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  splashColor: Colors.grey.withOpacity(0.3),
                  onTap: () {
                    controller.isTrendingChecked();
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        color: (controller.isTrending.value == 'on')
                            ? kCyanCornflowerBlueColor
                            : kAzureishWhiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.all(3.0.wp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              (controller.isTrending.value == 'on')
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: kAzureishWhiteColor,
                                    )
                                  : Container(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Trending',
                                style: (controller.isTrending.value == 'on')
                                    ? Theme.of(context).textTheme.bodyText1
                                    : Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0.wp,
            ),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                elevation: 4,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  splashColor: Colors.grey.withOpacity(0.3),
                  onTap: () {
                    controller.isNewsChecked();
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        color: (controller.isNews.value == 'on')
                            ? kCyanCornflowerBlueColor
                            : kAzureishWhiteColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.all(3.0.wp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              (controller.isNews.value == 'on')
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: kAzureishWhiteColor,
                                    )
                                  : Container(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'News',
                                style: (controller.isNews.value == 'on')
                                    ? Theme.of(context).textTheme.bodyText1
                                    : Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
