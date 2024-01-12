import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/screens/auth/validators/login_form.dart';
import 'package:meu_gabarito/screens/auth/widgets/auth_card.dart';
import 'package:meu_gabarito/screens/auth/widgets/auth_form_buttons.dart';
import 'package:meu_gabarito/screens/auth/widgets/show_password_icon_button.dart';
import 'package:meu_gabarito/store/auth/auth.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/button_styles.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/themes/styles/textfield_styles.dart';
import 'package:meu_gabarito/widgets/errors_list.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<MainStore>(context).auth;

    void login() {
      _isEmailValid = validateEmailField(_emailController.text) is! String;
      _isEmailValid =
          validatePasswordField(_passwordController.text) is! String;
      if (_formKey.currentState!.validate()) {
        auth.login(_emailController.text, _passwordController.text);
      }
    }

    void register() {
      _isEmailValid = validateEmailField(_emailController.text) is! String;
      _isEmailValid =
          validatePasswordField(_passwordController.text) is! String;
      if (_formKey.currentState!.validate()) {
        auth.signup(_emailController.text, _passwordController.text);
      }
    }

    void resetPassword() async {
      await auth.resetPassword(_emailController.text).then((_) {
        if (auth.errors.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Um email de redefinição de senha foi enviado para o endereço de email da sua conta.",
              ),
            ),
          );
        }
      });
    }

    return AuthCard(
      image: "assets/img/study-girl-book.jpg",
      child: Observer(
        builder: (context) => auth.isLoading
            ? const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "meuGabarito",
                    style: logoTextStyle,
                  ),
                  const Text("Continue seus estudos de qualquer lugar"),
                  const SizedBox(height: 16),
                  Observer(
                    builder: (_) => auth.errors.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: ErrorsList(errors: auth.errors),
                          )
                        : Container(),
                  ),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\s'))
                          ],
                          onChanged: (value) {
                            setState(() {
                              _isEmailValid =
                                  validateEmailField(value) is! String;
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
                              _isPasswordValid =
                                  validatePasswordField(value) is! String;
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
                          onEditingComplete: login,
                        ),
                        const SizedBox(height: 2),
                        TextButton(
                          onPressed: resetPassword,
                          style: linkButtonStyle,
                          child: const Text("Esqueci a senha"),
                        ),
                        const SizedBox(height: 8),
                        AuthFormButtons(onLogin: login, onSignup: register),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
