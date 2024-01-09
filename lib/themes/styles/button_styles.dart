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

ButtonStyle outlineButtonStyle = const ButtonStyle(
  side: MaterialStatePropertyAll(BorderSide(color: primary)),
  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
  foregroundColor: MaterialStatePropertyAll(primary),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  padding: MaterialStatePropertyAll(
    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
);
