import 'package:flutter/material.dart';
import 'package:meu_gabarito/widgets/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppbar(),
    );
  }
}
