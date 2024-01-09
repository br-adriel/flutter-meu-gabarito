import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/auth/login.dart';
import 'package:meu_gabarito/themes/index.dart' as themes;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      theme: themes.defaultTheme,
    );
  }
}
