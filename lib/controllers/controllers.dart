import 'package:flutter/services.dart';
import 'package:textomize/core/exports.dart';
import 'package:textomize/modules/features/home/tools/watermark_view.dart';
import 'dart:async';
import '../modules/features/home/tools/all_tools.dart';
import '../modules/features/home/tools/compress_pdf.dart';
import '../modules/features/home/tools/e_sign_pdf.dart';
import '../modules/features/home/tools/merge_pdf.dart';
import '../modules/features/home/tools/protect_pdf.dart';
import '../modules/features/home/tools/scan_qr_code.dart';
import '../modules/features/home/tools/split_pdf.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var phone = ''.obs;
  var dob = ''.obs;
  var gender = ''.obs;
  var profileImage = ''.obs; // Added profile image

  void updateName(String value) => name.value = value;
  void updatePhone(String value) => phone.value = value;
  void updateDob(String value) => dob.value = value;
  void updateGender(String value) => gender.value = value;
  void updateProfileImage(String path) =>
      profileImage.value = path; // Update profile image

  bool isFormValid() {
    return name.isNotEmpty &&
        phone.isNotEmpty &&
        dob.isNotEmpty &&
        gender.isNotEmpty;
  }
}

final List<Map<String, dynamic>> tools = [
  {'label': 'Scan Code', 'icon': Icons.qr_code, 'view': ScanQrCodeView()},
  {'label': 'Watermark', 'icon': Icons.water, 'view': WaterMarkView()},
  {'label': 'eSign PDF', 'icon': Icons.edit, 'view': ESignPDFView()},
  {'label': 'Split PDF', 'icon': Icons.splitscreen, 'view': SplitPdfView()},
  {'label': 'Merge PDF', 'icon': Icons.merge_type, 'view': MergePDFView()},
  {'label': 'Protect PDF', 'icon': Icons.lock, 'view': ProtectPDFView()},
  {'label': 'Compress PDF', 'icon': Icons.compress, 'view': CompressPDFView()},
  {'label': 'All Tools', 'icon': Icons.grid_view, 'view': AllToolsView()},
];

/// Checkbox state variables
bool rememberMe = false;
bool isSigningUp = false;

// Observable variables
var isSignedIn = false.obs;
var isLoading = false.obs;
bool isChecked = false;

class ForgotPasswordController extends GetxController {
  // Text controllers
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Password visibility toggles
  var isNewPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  // Toggle password visibility
  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  @override
  void onClose() {
    // Dispose of controllers to prevent memory leaks
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    resetPasswordController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

bool isConfirmPasswordVisible = false;

final TextEditingController resetPasswordController = TextEditingController();
final TextEditingController newPasswordController = TextEditingController();
final TextEditingController confirmNewPasswordController =
    TextEditingController();
final TextEditingController passwordController = TextEditingController();

final TextEditingController searchController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController CnicController = TextEditingController();
final TextEditingController resetEmailController = TextEditingController();

final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

final List<Color> appColors = [
  Color(0xFFE57373),
  Color(0xFF81C784),
  Color(0xFF64B5F6),
  Color(0xFFFFD54F),
  Color(0xFFBA68C8),
  Color(0xFF4DB6AC),
  Color(0xFFFF8A65),
  Color(0xFFAED581),
];

final List<Map<String, String>> recentFiles = [
  {
    'title': 'Job Application Letter',
    'date': '12/30/2023 09:41',
  },
  {
    'title': 'Requirements Document',
    'date': '12/29/2023 10:20',
  },
  {
    'title': 'Recommendation Letter',
    'date': '12/28/2023 14:56',
  },
];

final List<String> designationType = [
  'Inspecter',
  'Sub Insp',
  'ASI',
];

final List<String> departmentType = [
  'Sindth Police',
  'Lahore Police',
  'Islamabad Police',
];

final List<String> PayScaleType = [
  'Inspecter',
  'Sub Insp',
  'ASI',
];
final List<String> registrationTypes = [
  'Self',
  'Family',
  'Shuhada',
];

final List<String> optionTypes = [
  'Plot',
  'Flat',
];
final List<String> plotTypes = ['500', '250', '150', 'Flat'];
final List<String> currentmailingTypes = ['Islamabad', 'lahore', 'karachi'];
final List<String> permanentmailingTypes = ['Islamabad', 'lahore', 'karachi'];

final List<String> nomineeTypes = [
  'Self',
  'Wife',
  'Son',
  'Daughter',
  'Husband',
];

final List<String> payScaleOptions = [
  '16',
  '18',
  '20',
  '21',
  '22',
];

// Custom bottom sheet widget for reuse
class CustomBottomSheet extends StatelessWidget {
  final Widget? header;
  final Widget? content;
  final Widget? footer;

  const CustomBottomSheet({
    Key? key,
    this.header,
    this.content,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (header != null) header!,
          if (content != null) content!,
          if (footer != null) footer!,
        ],
      ),
    );
  }
}

class OtpTimerController extends GetxController {
  RxInt secondsRemaining = 60.obs; // Countdown from 60 seconds
  Timer? _timer;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        timer.cancel();
        // Perform action when timer expires (e.g., re-send OTP)
      }
    });
  }

  void resetTimer() {
    secondsRemaining.value = 60;
    _timer?.cancel();
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

class PakistaniPhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-numeric characters
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Ensure the number does not exceed 11 digits
    if (newText.length > 11) {
      newText = newText.substring(0, 11);
    }

    // Format the phone number: 03##-#######
    if (newText.length >= 4) {
      newText = newText.substring(0, 4) + '-' + newText.substring(4);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CNICInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-numeric characters
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Format the CNIC: #####-#######-#
    if (newText.length > 5) {
      newText = newText.substring(0, 5) + '-' + newText.substring(5);
    }
    if (newText.length > 13) {
      newText = newText.substring(0, 13) + '-' + newText.substring(13, 14);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
