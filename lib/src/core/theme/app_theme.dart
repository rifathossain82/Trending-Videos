import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trending_videos/src/core/utils/color.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: kPrimarySwatchColor,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kScaffoldBackgroundColor,
      foregroundColor: kBlack,
      elevation: 0.0,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 20,
        color: kBlack,
        fontWeight: FontWeight.w700,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        /// Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (light icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kPrimaryColor,
      foregroundColor: kWhite,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(Typography.blackCupertino),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(kPrimaryColor),
      checkColor: MaterialStatePropertyAll(kWhite),
      side: BorderSide(color: kGrey),
    ),
    cardTheme: CardTheme(
      color: kWhite,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    iconTheme: IconThemeData(
      color: kGrey,
    ),
  );


  static void setDarkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: kScaffoldBackgroundColor,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  static void setLightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // For Android (light icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  static void enableInitialThemeSetting(){
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  /// to hide top and bottom, both status bar
  static void hideStatusBar(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }
}
