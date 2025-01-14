
import 'package:textomize/core/exports.dart';
import 'package:textomize/modules/features/auth/signIn_view.dart';

class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController profileController = Get.put(ProfileController());

  // TextEditingControllers to avoid recreating them in Obx
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with values from the controller
    nameController.text = profileController.name.value;
    phoneController.text = profileController.phone.value;
    dobController.text = profileController.dob.value;

    // Listen to changes in reactive variables
    profileController.name.listen((value) {
      nameController.text = value;
    });
    profileController.phone.listen((value) {
      phoneController.text = value;
    });
    profileController.dob.listen((value) {
      dobController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Complete Your Profile',
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              simplifyText(
                text: 'Complete your profile',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 8.h),
              simplifyText(
                text: 'Don’t worry, only you can see your personal data. No one else will be able to see it.',
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              SizedBox(height: 24.h),
              SimplifyTextFormField(
                controller: nameController,
                onChanged: profileController.updateName,
                title: 'Full Name',
                hint: 'Enter your full name',
              ),
              SizedBox(height: 16.h),
              SimplifyTextFormField(
                controller: phoneController,
                onChanged: profileController.updatePhone,
                inputType: TextInputType.phone,
                title: 'Phone Number',
                hint: '+1 000 000 000',
              ),
              SizedBox(height: 16.h),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: profileController.gender.value.isEmpty
                      ? null
                      : profileController.gender.value,
                  onChanged: profileController.updateGender,
                  items: ['Male', 'Female', 'Other']
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: simplifyText(text: gender),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
                    profileController.updateDob(formattedDate);
                  }
                },
                child: AbsorbPointer(
                  child: SimplifyTextFormField(
                    controller: dobController,
                    title: 'Date of Birth',
                    hint: 'MM/DD/YYYY',
                    suffix: Icon(Icons.calendar_today),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              
              SimplifyButton(
                onTap: () {
                  Get.to(SignInView());
                },
                title: 'Skip',
                fillColor: true,
              ),
              SizedBox(height: 20.h,),
              SimplifyButton(
                onTap: () {
                  if (profileController.isFormValid()) {
                    Get.snackbar(
                      'Profile Completed',
                      'Your profile details have been saved!',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.snackbar(
                      'Incomplete Details',
                      'Please fill all fields before continuing.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                  }
                },
                title: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers
    nameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    super.dispose();
  }
}
