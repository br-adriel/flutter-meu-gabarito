import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:meu_gabarito/themes/styles/button_styles.dart';

ThemeData defaultTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primary),
  textTheme: GoogleFonts.exo2TextTheme(),
  primarySwatch: primary,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primary,
    selectionColor: primary[100],
    selectionHandleColor: primary,
  ),
  filledButtonTheme: FilledButtonThemeData(style: filledButtonStyle),
  outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
  textButtonTheme: TextButtonThemeData(style: textButtonStyle),
);
