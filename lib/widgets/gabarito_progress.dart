import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';

class GabaritoProgress extends StatelessWidget {
  final double taxaCorrecao;
  final double taxaAcerto;
  final double minHeight;

  final _radius = const BorderRadius.all(Radius.circular(8));

  const GabaritoProgress(
      {super.key,
      required this.taxaAcerto,
      required this.taxaCorrecao,
      this.minHeight = 24});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LinearProgressIndicator(
          value: taxaCorrecao,
          minHeight: minHeight,
          borderRadius: _radius,
          color: primary[200],
        ),
        LinearProgressIndicator(
          minHeight: minHeight,
          value: taxaAcerto,
          borderRadius: _radius,
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
