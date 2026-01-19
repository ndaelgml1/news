import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/routes_manager.dart';
import 'package:news/core/utils/theme_manager.dart';
import 'package:news/ui/home/homeScreen.dart';
import 'package:news/ui/splash%20screen/splash_screen.dart';

void main() {
  runApp(const News());
}
class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_ , child) {
         return MaterialApp(
           debugShowCheckedModeBanner: false,
            theme: ThemeManager.lightTheme,
            darkTheme: ThemeManager.darkTheme,
            themeMode: ThemeMode.dark,
            routes: {
              Routes.splashScreen: (context) => SplashScreen(),
              Routes.home : (_)=>Homescreen(),
            },
            initialRoute: Routes.splashScreen,
          );
        }
    );
  }
}


