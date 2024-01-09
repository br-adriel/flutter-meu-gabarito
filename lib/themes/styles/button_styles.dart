import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';

ButtonStyle filledButtonStyle = const ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(primary),
  foregroundColor: MaterialStatePropertyAll(Colors.white),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  padding: MaterialStatePropertyAll(
    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
);

ButtonStyle outlineButtonStyle = ButtonStyle(
  side: const MaterialStatePropertyAll(BorderSide(color: primary)),
  backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
  foregroundColor: const MaterialStatePropertyAll(primary),
  overlayColor: MaterialStatePropertyAll(primary[50]),
  shape: const MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  padding: const MaterialStatePropertyAll(
    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
);
