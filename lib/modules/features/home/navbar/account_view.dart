import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textomize/core/exports.dart';
import 'package:textomize/screens/help_support.dart';
import 'package:textomize/screens/notify_view.dart';
import 'dart:io';

import 'package:textomize/screens/settings_view.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _nameController =
      TextEditingController(text: "John Doe");
  final TextEditingController _emailController =
      TextEditingController(text: "john.doe@example.com");

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _saveProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile updated successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : AssetImage('assets/png/Ellipse.png')
                              as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.camera_alt,
                              size: 18.sp, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              SimplifyTextFormField(
                controller: _nameController,
                hint: 'enter name',
                prefix: Icon(Icons.person),
              ),
              SizedBox(
                height: 20.h,
              ),
              SimplifyTextFormField(
                controller: _emailController,
                hint: 'enter email',
                prefix: Icon(Icons.email),
              ),
              SizedBox(height: 24.h),

              MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                physics: NeverScrollableScrollPhysics(),
                itemCount: accountOptions.length,
                itemBuilder: (context, index) {
                  final option = accountOptions[index];
                  return _PinterestCard(
                    icon: option['icon'],
                    title: option['title'],
                    onTap: () =>
                        option['onTap'](), 
                  );
                },
              ),

              SizedBox(height: 24.h),
              SimplifyButton(
                onTap: _saveProfile,
                title: "Save Profile",
                fillColor: true,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

// Pinterest Card for Options
class _PinterestCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _PinterestCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.blue, size: 28.sp),
            SizedBox(height: 12.h),
            Text(title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}final List<Map<String, dynamic>> accountOptions = [
  {
    'icon': Icons.settings,
    'title': "Settings",
    'onTap': () {
      print("Navigating to Settings");
      Get.to(() => SettingsView());
    }
  },
  {
    'icon': Icons.notifications,
    'title': "Notifications",
    'onTap': () {
      print("Navigating to Notifications");
      Get.to(() => NotificationsView());
    }
  },
  {
    'icon': Icons.help_outline,
    'title': "Help & Support",
    'onTap': () {
      print("Navigating to Help & Support");
      Get.to(() => HelpSupportView());
    }
  },
  {'icon': Icons.exit_to_app, 'title': "Logout", 'onTap': () => print("Logout pressed")},
];
