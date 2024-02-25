import 'package:flutter/material.dart';
import 'package:meu_gabarito/classes/gabarito.dart';
import 'package:meu_gabarito/store/gabaritos/gabaritos.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/button_styles.dart';
import 'package:provider/provider.dart';

class GabaritoActions extends StatelessWidget {
  final Gabarito gabarito;

  const GabaritoActions(this.gabarito, {super.key});

  @override
  Widget build(BuildContext context) {
    Gabaritos store = Provider.of<MainStore>(context).gabaritos;

    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.check_box_outlined),
                SizedBox(width: 4),
                Text('Corrigir'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FilledButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.drive_file_rename_outline_outlined),
                SizedBox(width: 4),
                Text('Renomear'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red[700]),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Apagar gabarito "${gabarito.nome}"?'),
                  content: const Text('Essa ação não pode ser desfeita'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                    FilledButton(
                      onPressed: () {
                        int count = 0;
                        store.deleteGabarito(gabarito.id!).then((_) {
                          Navigator.of(context).popUntil((_) => count++ >= 2);
                        }).catchError((_) {
                          store.errors.map((err) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(err)),
                            );
                          });
                          Navigator.of(context).pop();
                        });
                      },
                      style: deleteFilledButtonStyle,
                      child: const Text('Apagar'),
                    ),
                  ],
                ),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.delete_outline),
                SizedBox(width: 4),
                Text('Apagar'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
