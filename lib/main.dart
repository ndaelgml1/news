import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/routes_manager.dart';
import 'package:news/core/utils/theme_manager.dart';
import 'package:news/ui/search/search_page.dart';
import 'package:news/ui/home/homeScreen.dart';
import 'package:news/ui/search/widgets/search_state.dart';
import 'package:news/ui/splash%20screen/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'core/DI/di.dart';
import 'core/utils/language/language_state.dart';
import 'core/utils/theme/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const News(),
    ),
  );
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {

              return BlocBuilder<ThemeCubit, int>(
                builder: (context, state) {
                  return MaterialApp(
                    locale: context.locale ,
                    debugShowCheckedModeBanner: false,
                    theme: ThemeManager.lightTheme,
                    darkTheme: ThemeManager.darkTheme,
                    themeMode: state == 1
                        ? ThemeMode.dark
                        : ThemeMode.light,

                    supportedLocales: context.supportedLocales,
                    localizationsDelegates:
                    context.localizationDelegates,

                    routes: {
                      Routes.splashScreen: (context) => SplashScreen(),
                      Routes.home: (_) => Homescreen(),
                      Routes.searchScreen : (_) => BlocProvider(
                          create:  (_) => getIt<Search>(),
                        child: SearchScreen(),
                      ),
                    },
                    initialRoute: Routes.splashScreen,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}