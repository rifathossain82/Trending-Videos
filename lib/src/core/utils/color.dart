import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xFF3898FC);
Color kScaffoldBackgroundColor = const Color(0xFFE2E8F0);

Color successColor = Colors.green;
Color failedColor = Colors.red;
Color warningColor = Colors.orange;

Color kWhite = Colors.white;
Color kRed = Colors.red;
Color kRedLight = const Color(0xFFf36d58);
Color kRedMedium = const Color(0xFFff4f5a);
Color kRedDeep = const Color(0xFFF71B24);
Color kBlack = Colors.black;
Color kBlackLight = const Color(0xFF1A202C);
Color kBlackMedium = const Color(0xFF404040);
Color kBlue = const Color(0xFF3879E9);
Color kBlueMedium = const Color(0xFF2F5BE0);
Color kBlueLight = const Color(0xFFC7D0EC);
Color kBlueDark = const Color(0xFF243E8B);
Color kGrey = const Color(0xFF9EA1B6);
Color kGreyMedium = const Color(0xFFCBD5E0);
Color kGreyLight = const Color(0xFFe7e7e6);
Color kGreen = const Color(0xFF1CAF5E);
Color kOrange = const Color(0xFFFFA800);
Color kOrangeLight = const Color(0xFFFF6A6A);
Color kDeepOrange = const Color(0xFFFF5F2D);
Color kDefaultScaffoldBgColor = const Color(0xFFeeeeef);

Color kShadowColor = const Color(0xFF616161).withOpacity(0.18);
Color kItemShadowColor = const Color(0xFF000000).withOpacity(0.10);
Color kItemBlueShadowColor = const Color(0xFFEFF3FF);
Color kGreyTextColor = const Color(0xFFA5A5A5);
Color kDividerColor = const Color(0xFFE8ECF2);
Color kBlueGrey = const Color(0xFF7D8FAB);
Color? kDarkBlueGrey = Colors.blueGrey[900];
Color kHighlightColor = const Color.fromRGBO(56, 152, 252, .2);

Color kShimmerBaseColor = Colors.grey.shade300;
Color kShimmerHighlightColor = Colors.grey.shade100;

Map<int, Color> materialColor = const {
  50: Color.fromRGBO(56, 152, 252, .1),
  100: Color.fromRGBO(56, 152, 252, .2),
  200: Color.fromRGBO(56, 152, 252, .3),
  300: Color.fromRGBO(56, 152, 252, .4),
  400: Color.fromRGBO(56, 152, 252, .5),
  500: Color.fromRGBO(56, 152, 252, .6),
  600: Color.fromRGBO(56, 152, 252, .7),
  700: Color.fromRGBO(56, 152, 252, .8),
  800: Color.fromRGBO(56, 152, 252, .9),
  900: Color.fromRGBO(56, 152, 252, 1),
};

MaterialColor kPrimarySwatchColor = MaterialColor(
  0xFF3898FC,
  materialColor,
);
