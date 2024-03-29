import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_gabarito/themes/styles/bottom_sheet_styles.dart';
import 'package:meu_gabarito/themes/styles/button_styles.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:meu_gabarito/themes/styles/list_tile_styles.dart';
import 'package:meu_gabarito/themes/styles/textfield_styles.dart';

ThemeData defaultTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primary),
  textTheme: GoogleFonts.exo2TextTheme(),
  primarySwatch: primary,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primary,
    selectionColor: primary[100],
    selectionHandleColor: primary,
  ),
  cardTheme: const CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(style: filledButtonStyle),
  outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
  textButtonTheme: TextButtonThemeData(style: textButtonStyle),
  listTileTheme: roundedListTile,
  floatingActionButtonTheme: floatingButtonThemeData,
  inputDecorationTheme: inputDecorationTheme,
  bottomSheetTheme: bottomSheetThemeData,
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
