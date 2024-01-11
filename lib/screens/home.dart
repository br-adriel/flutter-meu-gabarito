import 'package:flutter/material.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<MainStore>(context).auth;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: const Text("meuGabarito"),
        titleTextStyle: appBarLogoTextStyle,
        actions: [
          IconButton(
            onPressed: auth.logout,
            icon: const Icon(Icons.output_rounded),
            color: Colors.white,
            tooltip: "Sair",
          ),
        ],
      ),
    );
  }
}
