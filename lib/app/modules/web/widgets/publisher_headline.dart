import 'package:flutter/material.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/modules/web/controllers/web_controller.dart';

class PublisherHeadline extends StatelessWidget {
  final BrowseController controller;
  const PublisherHeadline({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              height: 5.0.hp,
              width: 10.0.wp,
              decoration: BoxDecoration(
                color: kAzureishWhiteColor,
                borderRadius: BorderRadius.circular(3.0.wp),
                image: DecorationImage(
                  image: NetworkImage(
                    controller.homectrl.publisherImage.value,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 3.0.wp),
            Expanded(
              child: Text(
                controller.homectrl.publisherName.value,
                style: Theme.of(context).textTheme.headline3,
                maxLines: 2,
              ),
            ),
          ],
        ));
  }
}
