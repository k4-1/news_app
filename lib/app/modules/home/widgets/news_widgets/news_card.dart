import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/modules/home/controllers/home_controller.dart';
import 'package:technical_test/app/routes/app_pages.dart';

class NewsCard extends StatelessWidget {
  final int index;
  final HomeController controller;
  final String topic;
  final String publisherName;
  final String updated;
  final String imageUrl;
  final String publisherImage;
  final String link;
  const NewsCard({
    Key? key,
    required this.index,
    required this.controller,
    required this.topic,
    required this.publisherName,
    required this.updated,
    required this.imageUrl,
    required this.publisherImage,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.cardPublisherName(publisherName);
        controller.cardPublisherImage(publisherImage);
        controller.cardLink(link);
        controller.increment();
        controller.click();
        controller.lastRead(
            topic, updated, imageUrl, publisherName, publisherImage);
        Get.toNamed(Routes.WEB);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(3.0.wp),
          child: Row(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0.wp),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 14.0.hp,
                      width: 24.0.wp,
                      decoration: BoxDecoration(
                        color: kCyanCornflowerBlueColor,
                        borderRadius: BorderRadius.circular(3.0.wp),
                        image: DecorationImage(
                          image: NetworkImage(
                            imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 5.0.hp,
                        width: 10.0.wp,
                        decoration: BoxDecoration(
                          color: kAzureishWhiteColor,
                          borderRadius: BorderRadius.circular(3.0.wp),
                          image: DecorationImage(
                            image: NetworkImage(
                              publisherImage,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 3.0.wp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      publisherName,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      topic,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: 1.0.hp),
                    Text(
                      updated,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
