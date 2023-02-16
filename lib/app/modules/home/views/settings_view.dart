import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/constants/text_strings.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/modules/home/controllers/home_controller.dart';
import 'package:technical_test/app/modules/home/widgets/news_widgets/news_card.dart';
import 'package:technical_test/app/modules/home/widgets/news_widgets/news_list.dart';
import 'package:technical_test/app/modules/home/widgets/setting_widgets/settings_card.dart';
import 'package:technical_test/app/routes/app_pages.dart';

class SettingsView extends GetView<HomeController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Settings',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(3.0.wp),
          child: Column(
            children: const [
              SettingsCard(
                title: kTopic,
                routes: Routes.TOPICS,
              ),
              SettingsCard(
                title: kStatistic,
                routes: Routes.STATISTICS,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
