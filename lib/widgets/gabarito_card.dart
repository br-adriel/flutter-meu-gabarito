import 'package:flutter/material.dart';
import 'package:meu_gabarito/classes/gabarito.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/widgets/gabarito_card_counter.dart';
import 'package:meu_gabarito/widgets/gabarito_progress.dart';

class GabaritoCard extends StatelessWidget {
  final Gabarito gabarito;
  final VoidCallback? onTap;

  const GabaritoCard(this.gabarito, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(gabarito.nome!, style: titleTextStyle),
              Text(
                '${gabarito.tamanho} quest${gabarito.tamanho == 1 ? 'ão' : 'ões'}',
              ),
              Row(
                children: [
                  Expanded(
                    child: GabaritoProgress(
                      taxaAcerto: gabarito.porcentagemCorretas,
                      taxaCorrecao: gabarito.porcentagemCorrigidas,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GabaritoCardCounter(
                    text: 'Acertos',
                    total: gabarito.contagemCorrigidas!,
                    value: gabarito.contagemCorretas!,
                  ),
                  const SizedBox(width: 12),
                  GabaritoCardCounter(
                    text: 'Corrigidas',
                    total: gabarito.tamanho!,
                    value: gabarito.contagemCorrigidas!,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
