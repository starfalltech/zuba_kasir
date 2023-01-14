import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'color_value.dart';

class AppThemeData {
  static ThemeData getTheme(BuildContext context) {
    const Color primaryColor = ColorValue.primary;
    final Map<int, Color> primaryColorMap = {
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };
    final MaterialColor primaryMaterialColor =
        MaterialColor(primaryColor.value, primaryColorMap);

    return ThemeData(
        primaryColor: primaryColor,
        primarySwatch: primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(size: 6.w),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 20.sp),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600))),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: ColorValue.primary,
          unselectedItemColor: ColorValue.unSelectColor,
          selectedLabelStyle: TextStyle(fontSize: 9.sp),
          unselectedLabelStyle: TextStyle(fontSize: 9.sp),
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 8.sp,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 8.sp,
          ),
        ),
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: ColorValue.primary,
          titleTextStyle:
              GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 14.sp),
          toolbarTextStyle:
              GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 14.sp),
        ),
        textTheme: GoogleFonts.poppinsTextTheme());
  }
}
