import 'package:textomize/core/exports.dart';

class SignUpController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  var isPasswordVisible = false.obs;
  var termsAccepted = false.obs;

  // Function to validate the email format
  bool isValidEmail(String email) {
    String pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  // Function to validate password strength (example: minimum 8 characters)
  bool isValidPassword(String password) {
    return password.length >= 8;
  }

  void signUp() {
    if (nameController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (!isValidEmail(emailController.text)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email address',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (!isValidPassword(passwordController.text)) {
      Get.snackbar(
        'Error',
        'Password should be at least 8 characters',
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
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate to login or desired screen
      Get.offAllNamed('/signin');
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
