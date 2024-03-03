import 'package:flutter/material.dart';
import 'package:meu_gabarito/classes/questao.dart';
import 'package:meu_gabarito/enums/alternativa.dart';

class QuestaoCorrigidaInfo extends StatelessWidget {
  final Questao questao;

  const QuestaoCorrigidaInfo(this.questao, {super.key});

  @override
  Widget build(BuildContext context) {
    bool correct = questao.alternativaSelecionada == questao.alternativaCorreta;

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                correct ? Colors.green : Colors.red,
              ),
            ),
            onPressed: () {},
            child: Text(
              questao.alternativaSelecionada == null
                  ? '-'
                  : Alternativa
                      .values[questao.alternativaSelecionada!.index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
