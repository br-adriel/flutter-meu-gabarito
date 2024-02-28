import 'package:flutter/material.dart';
import 'package:meu_gabarito/classes/questao.dart';
import 'package:meu_gabarito/enums/alternativa.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/widgets/questao_corrigida_info.dart';
import 'package:meu_gabarito/widgets/questao_options.dart';

class QuestaoCard extends StatelessWidget {
  final Questao questao;

  const QuestaoCard(this.questao, {super.key});

  @override
  Widget build(BuildContext context) {
    String? correctAlternative;
    if (questao.alternativaCorreta != null &&
        questao.alternativaCorreta != questao.alternativaSelecionada) {
      correctAlternative =
          Alternativa.values[questao.alternativaCorreta!.index].name;
    }
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
                  'Questão ${questao.numero.toString()}',
                  style: title2TextStyle,
                ),
              ),
            ),
            correctAlternative != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Correta: $correctAlternative'),
                    ),
                  )
                : Container(),
            const SizedBox(height: 8),
            questao.corrigida == null || questao.corrigida! == false
                ? QuestaoOptions(questao)
                : QuestaoCorrigidaInfo(questao),
          ],
        ),
      ),
    );
  }
}
