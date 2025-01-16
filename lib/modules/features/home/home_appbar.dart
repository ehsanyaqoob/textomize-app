import 'package:textomize/core/exports.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.scaffoldBackgroundColor,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 30.r,
          backgroundImage: AssetImage('assets/png/Ellipse.png'),
        ),
      ),
      title: simplifyText(
        text: 'Textomize',
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: AppColors.black,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Search action triggered')),
            );
          },
        ),
      ],
    );
  }
}
