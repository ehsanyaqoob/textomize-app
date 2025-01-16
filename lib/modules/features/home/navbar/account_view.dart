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
      
      body: Padding(
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
                    backgroundImage: AssetImage('assets/images/profile_pic.png'), // Placeholder image
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

            // Account Options
            Expanded(
              child: ListView(
                children: [
                  _AccountOptionCard(
                    icon: Icons.settings,
                    title: "Settings",
                    onTap: () {
                      // Navigate to settings screen
                    },
                  ),
                  _AccountOptionCard(
                    icon: Icons.notifications,
                    title: "Notifications",
                    onTap: () {
                      // Navigate to notifications screen
                    },
                  ),
                  _AccountOptionCard(
                    icon: Icons.help_outline,
                    title: "Help & Support",
                    onTap: () {
                      // Navigate to help and support screen
                    },
                  ),
                  _AccountOptionCard(
                    icon: Icons.exit_to_app,
                    title: "Logout",
                    onTap: () {
                      // Handle logout functionality
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _AccountOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 4,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
        ),
        title: simplifyText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        onTap: onTap,
      ),
    );
  }
}
