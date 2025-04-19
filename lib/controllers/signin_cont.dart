
import 'package:textomize/core/exports.dart';
import '../core/storage_services.dart';
import '../modules/features/home/navbar/NavBar.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool rememberMe = false.obs;

  void signIn() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (!_isValidEmail(email)) {
      Get.snackbar(
        'Invalid Email',
        'Please enter a valid email address',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (password.isEmpty) {
      Get.snackbar(
        'Error',
        'Password cannot be empty',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (password.length < 6) {
      Get.snackbar(
        'Weak Password',
        'Password must be at least 6 characters long',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoading.value = true;

    // Simulate API Call
    await Future.delayed(Duration(seconds: 2), () async {
      isLoading.value = false;

      // If login is successful, store the user session and their preference (rememberMe)
      if (rememberMe.value) {
        // Save login status if 'Remember Me' is checked
        await StorageService.setLoggedIn(true);
      }

      Get.snackbar(
        'Success',
        'You have successfully signed in!',
        snackPosition: SnackPosition.TOP,
      );

      // Navigate to the NavBar screen
      Get.to(() => NavBarNavigation());
    });
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
