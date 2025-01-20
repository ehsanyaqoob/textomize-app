import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:textomize/core/exports.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: AssetImage('assets/png/Ellipse.png'),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        simplifyText(
                          text: "John Doe",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        SizedBox(height: 4.h),
                        simplifyText(
                          text: "john.doe@example.com",
                          fontSize: 14.sp,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Pinterest-Style Grid
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
                    onTap: option['onTap'],
                  );
                },
              ),
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
            simplifyText(
              text: title,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

// Account Options Data
final List<Map<String, dynamic>> accountOptions = [
  {
    'icon': Icons.settings,
    'title': "Settings",
    'onTap': () {
      // Navigate to settings screen
    },
  },
  {
    'icon': Icons.notifications,
    'title': "Notifications",
    'onTap': () {
      // Navigate to notifications screen
    },
  },
  {
    'icon': Icons.help_outline,
    'title': "Help & Support",
    'onTap': () {
      // Navigate to help and support screen
    },
  },
  {
    'icon': Icons.exit_to_app,
    'title': "Logout",
    'onTap': () {
      // Handle logout functionality
    },
  },
];
