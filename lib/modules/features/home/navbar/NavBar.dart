import 'package:textomize/core/exports.dart';
import 'package:textomize/modules/features/home/home_appbar.dart';
import 'package:textomize/modules/features/home/navbar/account_view.dart';
import 'package:textomize/modules/features/home/navbar/home_view.dart';
import 'package:textomize/modules/features/home/navbar/premium/premium_view.dart';

import 'files_view.dart';

class NavBarNavigation extends StatefulWidget {
  @override
  State<NavBarNavigation> createState() => _NavBarNavigationState();
}

class _NavBarNavigationState extends State<NavBarNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    FilesView(),
    PremiumView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              title: HomeAppBar(),
              automaticallyImplyLeading: false,
            )
          : null,
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        unselectedFontSize: 14.0,
        selectedFontSize: 15.0,
        unselectedItemColor: AppColors.greyColor,
        selectedItemColor: AppColors.primaryColor,
        mouseCursor: SystemMouseCursors.click,
        iconSize: 26.0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Files',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Premium',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
