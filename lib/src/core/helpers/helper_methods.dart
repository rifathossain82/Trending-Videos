import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Debug Print Utility
///
/// ## Usage
/// To log debug information, call `kPrint(data)` with the desired [data] to print.
/// The information will be displayed in the console during debugging sessions.
///
/// Example:
/// ```dart
/// kPrint("Debug information");
/// ```
void kPrint(dynamic data) {
  if (kDebugMode) {
    print(data);
  }
}



/// Converts a string representation of a color to a Flutter [Color] object.
///
/// ## Parameters
///
/// - `value`: A string representing the color. It can be in the form of '#RRGGBB'
///   or an integer value (0xAARRGGBB).
///
/// ## Returns
///
/// A [Color] object corresponding to the parsed color string. If parsing fails,
/// a default white color (0xFFFFFFFF) is returned.
///
/// ## Usage
///
/// ```dart
/// Color color1 = getStringToColor('#FF5722'); // Parses a hexadecimal color.
/// Color color2 = getStringToColor('0xFFAABBCC'); // Parses an integer color.
/// ```
Color getStringToColor(String value){
  try{
    if(value.contains('#'))
      return Color(int.parse(value.substring(1, 7), radix: 16) + 0xFF000000);
    else
      return Color(int.parse(value));
  } catch(e){
    return Color(0xFFFFFFF);
  }
}
