import 'package:textomize/core/exports.dart';
import '../../../controllers/signUp_con.dart' as signUpCon;
import 'signIn_view.dart';

class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final signUpCon.SignUpController signUpController = Get.put(signUpCon.SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "Sign Up",
        centerTitle: true,
        onLeadingPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              simplifyText(
                textAlign: TextAlign.center,
                text: "Please fill in the details to create your account.",
                fontSize: 16.sp,
                color: AppColors.greyColor,
              ),
              SizedBox(height: 20.h),
              // Name Field
              SimplifyTextFormField(
                controller: signUpController.nameController,
                hint: "Full Name",
                title: 'Full Name',
                inputType: TextInputType.name,
                prefix: Icon(
                  Icons.person,
                ),
              ),
              SizedBox(height: 20),
              // Email Field
              SimplifyTextFormField(
                controller: signUpController.emailController,
                hint: "Email",
                title: 'Email',
                inputType: TextInputType.emailAddress,
                prefix: Icon(
                  Icons.email,
                ),
              ),
              SizedBox(height: 20),
              // Phone Field
              SimplifyTextFormField(
                controller: signUpController.phoneNumberController,
                hint: "Phone Number",
                title: 'Phone Number',
                inputType: TextInputType.phone,
                prefix: Icon(
                  Icons.phone,
                ),
              ),
              SizedBox(height: 20),
              // Password Field
              SimplifyTextFormField(
                controller: signUpController.passwordController,
                hint: "Password",
                title: 'Password',
                isObscure: true,
                prefix: Icon(
                  Icons.lock,
                ),
                suffix: IconButton(
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.greyColor,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: 10.h),
              // Terms and Conditions Checkbox
              Row(
                children: [
                  CustomCheckbox(
              value: isChecked, // Pass the current checkbox value
              onChanged: (bool newValue) {
                setState(() {
                  isChecked = newValue; // Update the checkbox value
                });
              },
              activeColor: AppColors.primaryColor, // Custom active color
              checkColor: AppColors.white, // Custom check color
              size: 32.0, // Custom size
              borderRadius: BorderRadius.circular(12), // Custom border radius
            ),
           
                  SizedBox(width: 10.w),
                  simplifyText(
                    text: "I accept the terms & conditions",
                    fontSize: 14.sp,
                    color: AppColors.greyColor,
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Sign Up Button
              SimplifyButton(
                title: "Sign Up",
                onTap: () {
                  signUpController.signUp();
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
                      style: TextStyle(fontSize: 14, color: AppColors.greyColor),
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
                    text: "Already have an account? ",
                    fontSize: 14,
                    color: AppColors.greyColor,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(SignInView()),
                    child: simplifyText(
                      text: "Sign In",
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
      ),
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
        height: 50,
        width: 50,
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
