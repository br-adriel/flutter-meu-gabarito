import 'package:flutter/material.dart';
import 'package:meu_gabarito/enums/alternativa.dart';
import 'package:meu_gabarito/store/gabaritos/gabaritos.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';
import 'package:provider/provider.dart';

class AlternativaButton extends StatelessWidget {
  final Alternativa alternative;
  final String questionId;
  final Alternativa? selectedAlternative;

  const AlternativaButton({
    super.key,
    required this.alternative,
    required this.questionId,
    required this.selectedAlternative,
  });

  @override
  Widget build(BuildContext context) {
    Gabaritos store = Provider.of<MainStore>(context).gabaritos;

    return FilledButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          selectedAlternative != null && selectedAlternative == alternative
              ? primary
              : Colors.grey[600],
        ),
      ),
      child: Text(alternative.name),
      onPressed: () {
        store.setAlternativa(questionId, alternative).catchError((_) {
          store.errors.map((err) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(err)),
            );
          });
        });
      },
    );
  }
}
