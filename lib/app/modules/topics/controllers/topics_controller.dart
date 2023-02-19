import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/modules/home/controllers/home_controller.dart';

class TopicsController extends GetxController {
  //TODO: Implement TopicsController
  var homeCtrl = Get.find<HomeController>();
  final getStorage = GetStorage();
  var isTrending = ''.obs;
  var isNews = ''.obs;
  void onInit() {
    super.onInit();
    var readTrending = getStorage.read('isTrending');
    var readNews = getStorage.read('isNews');
    isNews.value = (readNews == null) ? '' : getStorage.read('isNews');
    isTrending.value =
        (readTrending == null) ? '' : getStorage.read('isTrending');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    homeCtrl.updateTab();
    homeCtrl.updateTabLength();
  }

  void isTrendingChecked() {
    var read = getStorage.read('isTrending');
    if (read == 'off' || read == null) {
      getStorage.write('isTrending', 'on');
      isTrending.value = 'on';
      Get.snackbar(
        "Friendly Notice",
        "You are now following Trending",
        colorText: kWhiteColor,
        backgroundColor: kDarkColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    if (read == 'on') {
      getStorage.write('isTrending', 'off');
      isTrending.value = 'off';
      Get.snackbar(
        "Friendly Notice",
        "You are now unfollowing Trending",
        colorText: kWhiteColor,
        backgroundColor: kDarkColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void isNewsChecked() {
    var read = getStorage.read('isNews');
    if (read == 'off' || read == null) {
      getStorage.write('isNews', 'on');
      isNews.value = 'on';
      Get.snackbar(
        "Friendly Notice",
        "You are now following News",
        colorText: kWhiteColor,
        backgroundColor: kDarkColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    if (read == 'on') {
      getStorage.write('isNews', 'off');
      isNews.value = 'off';
      Get.snackbar(
        "Friendly Notice",
        "You are now unfollowing News",
        colorText: kWhiteColor,
        backgroundColor: kDarkColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
