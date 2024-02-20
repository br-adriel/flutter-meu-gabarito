import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';

InputDecoration textFieldInputDecoration(
  String labelText, {
  bool isValid = true,
  String? helperText,
}) {
  return InputDecoration(
    labelText: labelText,
    fillColor: isValid ? primary[50] : Colors.red[50],
    labelStyle: TextStyle(color: isValid ? primary : Colors.red[900]),
    helperText: helperText,
  );
}

var inputDecorationTheme = InputDecorationTheme(
  border: const UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  enabledBorder: const UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  errorBorder: const UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  focusedBorder: const UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  disabledBorder: const UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
  labelStyle: const TextStyle(color: primary),
  filled: true,
  fillColor: primary[50],
);
