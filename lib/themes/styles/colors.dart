import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE2EEEE),
  100: Color(0xFFB7D4D5),
  200: Color(0xFF87B8B9),
  300: Color(0xFF579C9D),
  400: Color(0xFF338688),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF0D696B),
  700: Color(0xFF0B5E60),
  800: Color(0xFF085456),
  900: Color(0xFF044243),
});
const int _primaryPrimaryValue = 0xFF0F7173;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFF78FCFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFF12FAFF),
  700: Color(0xFF00F2F7),
});
const int _primaryAccentValue = 0xFF45FBFF;
