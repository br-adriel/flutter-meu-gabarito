import 'package:flutter/material.dart';

class AuthFormButtons extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onSignup;

  const AuthFormButtons({
    super.key,
    required this.onLogin,
    required this.onSignup,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilledButton(
          onPressed: onLogin,
          child: const Text("Entrar"),
        ),
        const SizedBox(width: 8),
        OutlinedButton(
          onPressed: onSignup,
          child: const Text("Criar conta"),
        )
      ],
    );
  }
}
