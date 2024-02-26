import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meu_gabarito/widgets/logo_appbar.dart';
import 'package:meu_gabarito/widgets/new_test_template_floating_button.dart';
import 'package:meu_gabarito/widgets/recent_gabaritos.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
      floatingActionButton: const NewTestTemplateFloatingButton(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SvgPicture.asset(
                'assets/img/illustration-study.svg',
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            const RecentGabaritos(padding: EdgeInsets.all(16)),
          ],
        ),
      ),
    );
  }
}
