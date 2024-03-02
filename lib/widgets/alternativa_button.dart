import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/classes/questao.dart';
import 'package:meu_gabarito/enums/alternativa.dart';
import 'package:meu_gabarito/store/gabaritos/gabaritos.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:provider/provider.dart';

class AlternativaButton extends StatelessWidget {
  final Alternativa alternative;
  final Questao questao;

  const AlternativaButton({
    super.key,
    required this.alternative,
    required this.questao,
  });

  @override
  Widget build(BuildContext context) {
    Gabaritos store = Provider.of<MainStore>(context).gabaritos;

    void showSnackbarError(String err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err)),
      );
    }

    return Observer(
      builder: (context) => FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            !store.isCorrectionModeEnabled &&
                    questao.alternativaSelecionada != null &&
                    questao.alternativaSelecionada == alternative
                ? primary
                : Colors.grey[600],
          ),
        ),
        child: Text(alternative.name),
        onPressed: () {
          if (store.isCorrectionModeEnabled) {
            store
                .correctQuestao(
                  questao.id!,
                  questao.alternativaSelecionada,
                  alternative,
                )
                .catchError((_) => store.errors.map(showSnackbarError));
            return;
          }
          store
              .setAlternativa(questao.id!, alternative)
              .catchError((_) => store.errors.map(showSnackbarError));
        },
      ),
    );
  }
}
