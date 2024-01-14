import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/auth/login.dart';
import 'package:meu_gabarito/store/auth/auth.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<MainStore>(context).auth;

    return TextButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Sair"),
            content: const Text("Deseja sair da sua conta?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancelar"),
              ),
              FilledButton(
                  onPressed: () {
                    auth.logout();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  child: const Text("Sair")),
            ],
          );
        },
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.red[50]),
      ),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Sair',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
