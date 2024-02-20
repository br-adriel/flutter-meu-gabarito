import 'package:flutter/material.dart';
import 'package:meu_gabarito/widgets/logo_appbar.dart';
import 'package:meu_gabarito/widgets/new_test_template_floating_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LogoAppBar(),
      floatingActionButton: NewTestTemplateFloatingButton(),
    );
  }
}
