import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/utils/colors_manager.dart';

abstract class ThemeManager {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.white,
      primary: ColorsManager.white,
      secondary: ColorsManager.black,
        onPrimary:  ColorsManager.white,
        onSecondary: ColorsManager.black
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorsManager.black ,

    ),
    dividerTheme: DividerThemeData(
        color: ColorsManager.white,
        thickness: 1.5,
        endIndent: 10
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.white,
      actionsIconTheme: IconThemeData(
        color: ColorsManager.black,
        opticalSize: 24,
        applyTextScaling: true,
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.inter(
        color: ColorsManager.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
        labelMedium: GoogleFonts.inter(
            fontSize: 30.sp ,
            fontWeight: FontWeight.w600,
            color: ColorsManager.white
        ),
        displayMedium:  GoogleFonts.inter(
            fontSize: 26.sp ,
            fontWeight: FontWeight.w700,
            color: ColorsManager.black
        ),
      displaySmall: GoogleFonts.inter(
          fontSize: 26.sp ,
          fontWeight: FontWeight.w700,
          color: ColorsManager.white
      ),
    ),
    // iconTheme: IconThemeData(
    //   color: ColorsManager.black,
    //   opticalSize: 24,
    //   applyTextScaling: true,
    // ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.black,
      primary: ColorsManager.black,
      secondary: ColorsManager.white,

    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorsManager.black ,

    ),
    dividerTheme: DividerThemeData(
      color: ColorsManager.white,
      thickness: 1.5,
      endIndent: 10
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.black,
      actionsIconTheme: IconThemeData(
        color: ColorsManager.white,
        opticalSize: 24,
        applyTextScaling: true,
      ),
      iconTheme: IconThemeData(
        color: ColorsManager.white,
        opticalSize: 24,
        applyTextScaling: true,
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.inter(
        color: ColorsManager.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 30.sp ,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black
      ),
      displayMedium:  GoogleFonts.inter(
          fontSize: 26.sp ,
          fontWeight: FontWeight.w700,
          color: ColorsManager.black
      ),
      displaySmall: GoogleFonts.inter(
          fontSize: 26.sp ,
          fontWeight: FontWeight.w700,
          color: ColorsManager.white
      )
    ),
    // iconTheme: IconThemeData(
    //   color: ColorsManager.white,
    //   opticalSize: 24,
    //   applyTextScaling: true,
    // ),

  );

}