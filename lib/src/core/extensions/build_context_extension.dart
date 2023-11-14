import 'dart:math';
import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/utils/color.dart';

extension BuildContextExtension on BuildContext{

  void unFocusKeyboard() => FocusScope.of(this).unfocus();

  dynamic get getArguments => ModalRoute.of(this)?.settings.arguments;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  Size get screenSize => MediaQuery.of(this).size;

  double get minScreenSize => min(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);

  double get maxScreenSize => max(MediaQuery.of(this).size.height, MediaQuery.of(this).size.width);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  TextStyle get buttonTextStyle =>
      Theme.of(this).textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.bold,
        color: kWhite,
        fontSize: 12,
      );

  TextStyle get outlinedButtonTextStyle =>
      Theme.of(this).textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
        fontSize: 12,
      );
}