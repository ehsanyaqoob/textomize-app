import 'package:textomize/core/exports.dart';

import '../modules/features/home/home_view.dart';
class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool rememberMe = false.obs; 

  void signIn() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    
    isLoading.value = true;

    // Simulate API Call
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar(
        'Success',
        'You have successfully signed in!',
        snackPosition: SnackPosition.BOTTOM,
      );

              Get.to(HomeView());

    });
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
