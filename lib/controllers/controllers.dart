import 'package:flutter/services.dart';
import 'package:textomize/core/exports.dart';
import 'package:textomize/modules/features/home/tools/all_tools.dart';
import 'package:textomize/modules/features/home/tools/compress_pdf.dart';
import 'package:textomize/modules/features/home/tools/e_sign_pdf.dart';
import 'package:textomize/modules/features/home/tools/merge_pdf.dart';
import 'package:textomize/modules/features/home/tools/protect_pdf.dart';

import 'dart:async';

import 'package:textomize/modules/features/home/tools/scan_qr_code.dart';
import 'package:textomize/modules/features/home/tools/split_pdf.dart';
import 'package:textomize/modules/features/home/tools/watermark_view.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var phone = ''.obs;
  var dob = ''.obs;
  var gender = ''.obs;

  void updateGender(String? newGender) {
    if (newGender != null) {
      gender.value = newGender;
    }
  }

  void updateName(String value) => name.value = value;
  void updatePhone(String value) => phone.value = value;
  void updateDob(String value) => dob.value = value;

  bool isFormValid() {
    return name.value.isNotEmpty &&
        phone.value.isNotEmpty &&
        gender.value.isNotEmpty &&
        dob.value.isNotEmpty;
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

/// Controller for signup view
bool isConfirmPasswordVisible = false;
  var visiblePassword = true.obs;

  // Toggle visibility method
  showHidePassword() {
    visiblePassword.value = !visiblePassword.value;
  }

final TextEditingController searchController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController CnicController = TextEditingController();
final TextEditingController resetEmailController = TextEditingController();
final TextEditingController resetPasswordController = TextEditingController();
final TextEditingController newPasswordController = TextEditingController();
final TextEditingController confirmNewPasswordController =
    TextEditingController();
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

class SignUpController extends GetxController {
  // Observable fields for each dropdown value
  var selectedRegType = ''.obs;
  var selectedOptionType = ''.obs;
  var selectedCurrentMailing = ''.obs;
  var selectedPermanentMailing = ''.obs;
  var selectedNomineeType = ''.obs;
  var selectedPlotType = ''.obs;

  // Controllers for text fields
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var nomineeNameController = TextEditingController();
  var nameController = TextEditingController();
  var cnicController = TextEditingController();
  var dobController = TextEditingController();
  var fatherController = TextEditingController();
  var spouseController = TextEditingController();
  var permanentAddressController = TextEditingController();

  // New controllers added for missing fields
  var regTypeController = TextEditingController();
  var currentMailingController = TextEditingController();
  var nomineeController = TextEditingController();

  // Observable properties for gender and marital status
  var selectedGender = ''.obs;
  var selectedMaritalStatus = ''.obs;

  final departmentController = TextEditingController();
  final designationController = TextEditingController();
  final plotTypeController = TextEditingController();
  final optionTypeController = TextEditingController();
  final employeenoController = TextEditingController();
  final employeenameController = TextEditingController();
  final employeecnicController = TextEditingController();
  final passwordController = TextEditingController();
  var payscaleController = TextEditingController();

  // Define observable variables to update UI for designation, department, and pay scale
  var designationType = ''.obs;
  var departmentType = ''.obs;
  var payScaleType = ''.obs;

  // Method to update designation type
  void onChangedesignationType(String value) {
    designationType.value = value;
    designationController.text = value; // Update the text controller
  }

  // Method to update department type
  void onChangedepartmentType(String value) {
    departmentType.value = value;
    departmentController.text = value; // Update the text controller
  }

  // Method to update pay scale type
  void onChangepayScale(String value) {
    payScaleType.value = value;
    payscaleController.text = value; // Update the text controller
  }

  // Visibility state for password field
  var isPasswordVisible = false.obs;

  // Track progress
  var currentStep =
      3.obs; // Adjust the starting step as needed (3 for third form)
  var isSubmitted = false.obs; // Track submission status

  // Remember me checkbox state
  var rememberMe = false.obs;

  // Update methods for each field
  void onChangeRegType(String value) {
    selectedRegType.value = value;
  }

  void onChangeOptionType(String value) {
    selectedOptionType.value = value;
  }

  void onChangeCurrentMailing(String value) {
    selectedCurrentMailing.value = value;
  }

  void onChangePermanentMailing(String value) {
    selectedPermanentMailing.value = value;
  }

  void onChangeNomineeType(String value) {
    selectedNomineeType.value = value;
  }

  void onChangePlotType(String value) {
    selectedPlotType.value = value;
  }

  // Clean up the controllers when not needed
  @override
  void onClose() {
    nameController.dispose();
    cnicController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    nomineeNameController.dispose();
    regTypeController.dispose(); // Dispose of new controllers
    currentMailingController.dispose();
    nomineeController.dispose();
    passwordController.dispose();
    departmentController.dispose();
    designationController.dispose();
    plotTypeController.dispose();
    super.onClose();
  }

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Function to toggle "Remember Me" checkbox
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  // Add Pay Scale options if needed
  List<String> payScaleOptions = ['Option 1', 'Option 2', 'Option 3'];

  // Optional method to fetch pay scale options (if from an API or dynamic source)
  void fetchPayScaleOptions() {
    // Replace with your logic for fetching the pay scale options
    payScaleOptions = ['Updated Option 1', 'Updated Option 2'];
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
