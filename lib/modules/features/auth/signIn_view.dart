import 'package:textomize/core/exports.dart';
import '../../../controllers/signin_cont.dart';
import '../forgot/forgot_view.dart';
import 'signUp_view.dart';

class SignInView extends StatefulWidget {
  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final SignInController signInController = Get.put(SignInController());
  final RxBool visiblePassword = false.obs;
  final RxBool isChecked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "Sign In",
        centerTitle: true,
     
      ),
      body: Obx(() {
        // Show loader if isLoading is true
        if (signInController.isLoading.value) {
          return SimplifyLoader();
        }
        return SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                simplifyText(
                  text: "Hello there 👋",
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
                SizedBox(height: 20.h),
                simplifyText(
                  text: "Please enter your email & password to sign in.",
                  fontSize: 16.sp,
                  color: AppColors.greyColor,
                ),
                SizedBox(height: 40.h),
                SimplifyTextFormField(
                  controller: signInController.emailController,
                  hint: "Email",
                  title: 'Email',
                  inputType: TextInputType.emailAddress,
                  prefix: const Icon(Icons.email),
                ),
                SizedBox(height: 20),
                SimplifyTextFormField(
                  controller: signInController.passwordController,
                  hint: "Password",
                  title: 'Password',
                  isObscure: !visiblePassword.value,
                  prefix: const Icon(Icons.lock),
                  suffix: IconButton(
                    icon: Icon(
                      visiblePassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.greyColor,
                      size: 25,
                    ),
                    onPressed: () {
                      visiblePassword.value = !visiblePassword.value;
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(() => CustomCheckbox(
                              value: isChecked.value,
                              onChanged: (bool newValue) {
                                isChecked.value = newValue;
                              },
                              activeColor: Colors.blue,
                              checkColor: Colors.white,
                              size: 32.0,
                              borderRadius: BorderRadius.circular(12),
                            )),
                        SizedBox(width: 10.w),
                        simplifyText(
                            text: "Remember me",
                            fontSize: 14.sp,
                            color: AppColors.greyColor),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(ForgotPassword());
                      },
                      child: simplifyText(
                        text: "Forgot Password?",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                SimplifyButton(
                  title: "Sign In",
                  onTap: () {
                    signInController
                        .signIn(); // This triggers the sign-in process
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.greyColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or continue with",
                        style:
                            TextStyle(fontSize: 14, color: AppColors.greyColor),
                      ),
                    ),
                    Expanded(child: Divider(color: AppColors.greyColor)),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialIconButton(assetPath: 'assets/png/google.png'),
                    SocialIconButton(assetPath: 'assets/png/apple.png'),
                    SocialIconButton(assetPath: 'assets/png/facebook.png'),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    simplifyText(
                      text: "Don't have an account? ",
                      fontSize: 14,
                      color: AppColors.greyColor,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(SignUpView()),
                      child: simplifyText(
                        text: "Sign Up",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class SocialIconButton extends StatelessWidget {
  final String assetPath;

  const SocialIconButton({required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add social login functionality here
      },
      child: Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(assetPath),
        ),
      ),
    );
  }
}
