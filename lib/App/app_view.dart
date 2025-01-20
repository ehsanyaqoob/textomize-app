import 'package:textomize/core/exports.dart';
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
              backgroundColor: AppColors.white
            )
            
          ),
          title: 'Textomize',
          
          home: SplashScreen(),
        );
      },
    );
  }
}
