import 'package:get/get.dart';
import 'package:textomize/core/exports.dart';

class SplashController extends GetxController {
  var isVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    _startSplashScreen();
  }

  Future<void> _startSplashScreen() async {
    await Future.delayed(Duration(seconds: 2));
    isVisible.value = true;
    await Future.delayed(Duration(seconds: 3));
    Get.offAll(() => Boarding());
  }
}
