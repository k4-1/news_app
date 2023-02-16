import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_test/app/model/news_model.dart';
import 'package:technical_test/app/modules/home/controllers/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowseController extends GetxController {
  //TODO: Implement WebController
  late WebViewController controller;
  final homectrl = Get.find<HomeController>();
  RxDouble progress = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void progressIndicator(int value) {
    var progressValue = value / 100;
    progress.value = progressValue;
  }
}
