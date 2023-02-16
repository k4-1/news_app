import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:technical_test/app/core/constants/text_strings.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/modules/home/controllers/home_controller.dart';

class GreetingTime extends StatelessWidget {
  final HomeController controller;

  const GreetingTime({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.greetingLogic();
    return Obx(
      () => Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              controller.title.value,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(height: 0.5.hp),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              controller.subTitle.value,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
