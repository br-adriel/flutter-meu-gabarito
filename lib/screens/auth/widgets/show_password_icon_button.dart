import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';

class ShowPasswordIconButton extends StatelessWidget {
  final bool showPassword;
  final VoidCallback onPressed;

  const ShowPasswordIconButton(
      {super.key, required this.onPressed, required this.showPassword});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        showPassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: primary,
      ),
      tooltip: showPassword ? 'Ocultar senha' : 'Mostrar senha',
    );
  }
}
