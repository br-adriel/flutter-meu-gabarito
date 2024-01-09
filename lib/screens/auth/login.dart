import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/auth/widgets/auth_card.dart';
import 'package:meu_gabarito/screens/auth/widgets/show_password_icon_button.dart';
import 'package:meu_gabarito/themes/styles/button_styles.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/themes/styles/textfield_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return AuthCard(
      image: "assets/img/study-girl-book.jpg",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "meuGabarito",
            style: logoTextStyle,
          ),
          const Text("Continue seus estudos de qualquer lugar"),
          const SizedBox(height: 16),
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: textFieldInputDecoration("Email"),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: textFieldInputDecoration("Senha").copyWith(
                    suffixIcon: ShowPasswordIconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      showPassword: _showPassword,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.go,
                  obscureText: !_showPassword,
                ),
                const SizedBox(height: 2),
                TextButton(
                  onPressed: () {},
                  style: linkButtonStyle,
                  child: const Text("Esqueci a senha"),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: const Text("Entrar"),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text("Criar conta"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
