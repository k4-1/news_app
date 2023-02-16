import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/core/constants/text_strings.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/routes/app_pages.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final String routes;
  const SettingsCard({
    Key? key,
    required this.title,
    required this.routes,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.0.hp,
      child: InkWell(
        onTap: () {
          Get.toNamed(routes);
        },
        child: Card(
          color: kAzureishWhiteColor,
          child: Padding(
            padding: EdgeInsets.all(3.0.wp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
