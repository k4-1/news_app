import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_test/app/modules/home/controllers/home_controller.dart';

class StatisticsController extends GetxController {
  //TODO: Implement StatisticsController
  final homeCtrl = Get.find<HomeController>();
  final getStorage = GetStorage();
  final count = 0.obs;
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

  void increment() => count.value++;
}
