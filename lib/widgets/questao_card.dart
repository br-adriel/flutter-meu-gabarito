import 'package:flutter/material.dart';
import 'package:meu_gabarito/classes/questao.dart';
import 'package:meu_gabarito/enums/alternativa.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';

class QuestaoCard extends StatelessWidget {
  final Questao questao;

  const QuestaoCard(this.questao, {super.key});

  @override
  Widget build(BuildContext context) {
    final questAlt = questao.alternativaSelecionada;

    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Questao ${questao.numero.toString()}',
                style: title2TextStyle,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ...Alternativa.values.map(
                (alternativa) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          questAlt != null && questAlt == alternativa
                              ? primary
                              : Colors.grey[600],
                        ),
                      ),
                      child: Text(alternativa.name),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
