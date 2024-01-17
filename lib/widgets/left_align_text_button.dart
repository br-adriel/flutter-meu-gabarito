import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/button_styles.dart';

class LeftAlignTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const LeftAlignTextButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: textButtonStyle.copyWith(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
