import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/core/constants/text_strings.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/modules/topics/widgets/check_box.dart';

import '../controllers/topics_controller.dart';

class TopicsView extends GetView<TopicsController> {
  const TopicsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BackButton(
                color: kDarkColor,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      kTopic,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  SizedBox(height: 5.0.hp),
                  Row(
                    children: [
                      Expanded(
                          child: CheckBox(
                        controller: controller,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
