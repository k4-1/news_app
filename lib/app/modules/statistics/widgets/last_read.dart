import 'package:flutter/material.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/core/utils/extension.dart';
import 'package:technical_test/app/modules/statistics/controllers/statistics_controller.dart';

class LastRead extends StatelessWidget {
  final StatisticsController controller;
  const LastRead({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newsTopic = controller.getStorage.read('newsTopic');
    String? newsUpdated = controller.getStorage.read('newsUpdated');
    String? newsImageUrl = controller.getStorage.read('newsImageUrl');
    String? newsPublisherName = controller.getStorage.read('newsPublisherName');
    String? newsPublisherImage =
        controller.getStorage.read('newsPublisherImage');
    return Card(
      child: Padding(
        padding: EdgeInsets.all(3.0.wp),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Last Read',
                  style: Theme.of(context).textTheme.headline2,
                )),
            Row(
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
                              newsImageUrl ?? '',
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
                                newsPublisherImage ?? '',
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
                        newsPublisherName ?? '',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        newsTopic ?? '',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(height: 1.0.hp),
                      Text(
                        newsUpdated ?? '',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
