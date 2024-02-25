import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/widgets/gabarito_card_counter.dart';
import 'package:meu_gabarito/widgets/gabarito_progress.dart';

class GabaritoStats extends StatelessWidget {
  final int tamanho;
  final int corrigidas;
  final int acertos;
  final double taxaCorrecao;
  final double taxaAcerto;

  const GabaritoStats({
    super.key,
    required this.tamanho,
    required this.acertos,
    required this.corrigidas,
    required this.taxaAcerto,
    required this.taxaCorrecao,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$tamanho quest${tamanho == 1 ? 'ão' : 'ões'}',
                style: titleTextStyle,
              ),
              Row(
                children: [
                  GabaritoCardCounter(
                    text: 'Acertos',
                    total: corrigidas,
                    value: acertos,
                  ),
                  const SizedBox(width: 8),
                  GabaritoCardCounter(
                    text: 'Corrigidas',
                    total: tamanho,
                    value: corrigidas,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        GabaritoProgress(taxaAcerto: taxaAcerto, taxaCorrecao: taxaCorrecao),
      ],
    );
  }
}
