import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';

InputDecoration textFieldInputDecoration(
  String labelText, {
  bool isValid = true,
}) {
  return InputDecoration(
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    labelText: labelText,
    fillColor: isValid ? primary[50] : Colors.red[50],
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
    labelStyle: TextStyle(color: isValid ? primary : Colors.red[900]),
  );
}
