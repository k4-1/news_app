import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/modules/web/widgets/publisher_headline.dart';
import 'package:technical_test/app/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/web_controller.dart';

class BrowseView extends GetView<BrowseController> {
  const BrowseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: kCyanCornflowerBlueColor,
          leading: BackButton(
            onPressed: () {
              Get.back();
            },
          ),
          title: PublisherHeadline(
            controller: controller,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: controller.progress.value,
              color: Colors.red,
              backgroundColor: kWhiteColor,
            ),
            Expanded(
              child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: controller.homectrl.newsLink.value,
                  onProgress: (value) {
                    controller.progressIndicator(value);
                    if (value == 100 &&
                        controller.homectrl.fiveArticle.value == true) {
                      Get.snackbar(
                        "Friendly Notice",
                        "Congratulations, you have viewed 5 articles!",
                        colorText: kWhiteColor,
                        backgroundColor: kDarkColor,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                    if (value == 100 &&
                        controller.homectrl.tenArticle.value == true) {
                      Get.snackbar(
                        "Friendly Notice",
                        "Wow, you are an avid news reader!",
                        colorText: kWhiteColor,
                        backgroundColor: kDarkColor,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                    if (value == 100) {
                      Get.snackbar(
                        "Friendly Notice",
                        "Ads from the publisher's website",
                        colorText: kWhiteColor,
                        backgroundColor: kDarkColor,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
