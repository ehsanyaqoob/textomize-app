import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
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
    RecentFilesSection(recentFiles: recentFiles),
    // FilesView(),
    PremiumView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0; // Navigate to Home tab
          });
          return false; // Prevent exiting the app
        }
        return false; // Stay on Home and prevent back press
      },
      child: Scaffold(
        extendBody: true, // Make the bottom nav bar floating
        appBar: _currentIndex == 0
            ? AppBar(
                title: HomeAppBar(),
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
              )
            : null,
        body: SafeArea(
          child: _pages[_currentIndex],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          height: 60,
          backgroundColor: Colors.transparent, 
          color: AppColors.primaryColor,
          buttonBackgroundColor: AppColors.primaryColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          items: [
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.folder, size: 30, color: Colors.white),
            Icon(Icons.star, size: 30, color: Colors.white),
            Icon(Icons.account_circle, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
