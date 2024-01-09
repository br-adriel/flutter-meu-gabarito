import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_gabarito/screens/auth/validators/login_form.dart';
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
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s'))
                ],
                onChanged: (value) {
                  setState(() {
                    _isEmailValid = validateEmailField(value) is! String;
                  });
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: textFieldInputDecoration(
                  "Email",
                  isValid: _isEmailValid,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: validateEmailField,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s'))
                ],
                onChanged: (value) {
                  setState(() {
                    _isPasswordValid = validatePasswordField(value) is! String;
                  });
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: textFieldInputDecoration(
                  "Senha",
                  isValid: _isPasswordValid,
                ).copyWith(
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
                textInputAction: TextInputAction.done,
                obscureText: !_showPassword,
                validator: validatePasswordField,
                onEditingComplete: () {
                  // TODO: Submit login
                },
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
                    onPressed: () {
                      // TODO: Submit login
                    },
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
        ],
      ),
    );
  }
}
