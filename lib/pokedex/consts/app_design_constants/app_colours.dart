import 'package:flutter/material.dart';

abstract class AppColours {
  static const LinearGradient gradient = LinearGradient(
    colors: [
      Colors.white,
      Color(0xFFCBAAFF),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Color primary = Colors.red;
  static const Color secondary = Colors.redAccent;
  static const Color text = Color(0xFF32303d);
  static const Color textAccent = Color(0xFFFFFFFF);
}
