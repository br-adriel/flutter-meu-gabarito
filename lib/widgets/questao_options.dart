import 'package:flutter/material.dart';
import 'package:meu_gabarito/classes/questao.dart';
import 'package:meu_gabarito/enums/alternativa.dart';
import 'package:meu_gabarito/widgets/alternativa_button.dart';

class QuestaoOptions extends StatelessWidget {
  final Questao questao;

  const QuestaoOptions(this.questao, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Alternativa.values
          .map(
            (alternativa) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AlternativaButton(
                  alternative: alternativa,
                  questao: questao,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
