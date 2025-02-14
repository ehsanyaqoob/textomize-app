import 'package:textomize/core/exports.dart';
import '../core/storage_services.dart';
import '../modules/splash/splash_view.dart';
import '../modules/features/home/navbar/NavBar.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.white,
            ),
          ),
          title: 'Textomize',
          home: _getInitialScreen(), // Decide initial screen
        );
      },
    );
  }

  Widget _getInitialScreen() {
    return StorageService.isLoggedIn() ? NavBarNavigation() : SplashScreen();
  }
}
