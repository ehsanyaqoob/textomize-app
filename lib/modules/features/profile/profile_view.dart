
import 'package:textomize/core/exports.dart';
import 'package:textomize/modules/features/auth/signIn_view.dart';

class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController profileController = Get.put(ProfileController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    nameController.text = profileController.name.value;
    phoneController.text = profileController.phone.value;
    dobController.text = profileController.dob.value;

    profileController.name.listen((value) => nameController.text = value);
    profileController.phone.listen((value) => phoneController.text = value);
    profileController.dob.listen((value) => dobController.text = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(title: 'Complete Your Profile', centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            _buildProfilePictureSection(),
            SizedBox(height: 20.h),
            _buildProfileFormSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePictureSection() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/avatar.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileFormSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFormHeader(),
            SizedBox(height: 24.h),
            _buildNameField(),
            SizedBox(height: 16.h),
            _buildPhoneField(),
            SizedBox(height: 16.h),
            _buildGenderDropdown(),
            SizedBox(height: 16.h),
            _buildDateOfBirthField(),
            SizedBox(height: 32.h),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        simplifyText(
          text: 'Complete your profile',
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 8.h),
        simplifyText(
          text: 'Only you can see your personal data.',
          fontSize: 14.sp,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildNameField() {
    return SimplifyTextFormField(
      controller: nameController,
      onChanged: profileController.updateName,
      title: 'Full Name',
      hint: 'Enter your full name',
    );
  }

  Widget _buildPhoneField() {
    return SimplifyTextFormField(
      controller: phoneController,
      onChanged: profileController.updatePhone,
      inputType: TextInputType.phone,
      title: 'Phone Number',
      hint: '+1 000 000 000',
    );
  }

  Widget _buildGenderDropdown() {
    return Obx(
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
    );
  }

  Widget _buildDateOfBirthField() {
    return GestureDetector(
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
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: SimplifyButton(
            onTap: () => Get.to(SignInView()),
            title: 'Skip',
            fillColor: false,
          ),
        ),
        SizedBox(width: 16.h),
        Expanded(
          child: SimplifyButton(
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
        ),
      ],
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    super.dispose();
  }
}