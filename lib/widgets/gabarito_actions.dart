import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meu_gabarito/classes/gabarito.dart';
import 'package:meu_gabarito/store/gabaritos/gabaritos.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/button_styles.dart';
import 'package:meu_gabarito/validators/required.dart';
import 'package:provider/provider.dart';

Widget cancelButton(BuildContext context) => TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text('Cancelar'),
    );

void handlePromise(Future<void> promise, BuildContext context, Gabaritos store,
    {int popAmout = 2}) {
  int count = 0;
  promise.then((_) {
    Navigator.of(context).popUntil((_) => count++ >= popAmout);
  }).catchError((_) {
    store.errors.map((err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err)),
      );
    });
    Navigator.of(context).pop();
  });
}

class GabaritoActions extends HookWidget {
  final Gabarito gabarito;
  final renameTC = TextEditingController();

  GabaritoActions(this.gabarito, {super.key});

  @override
  Widget build(BuildContext context) {
    Gabaritos store = Provider.of<MainStore>(context).gabaritos;

    useEffect(() {
      renameTC.text = gabarito.nome!;
      return null;
    });

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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Renomear gabarito'),
                  content: TextFormField(
                    controller: renameTC,
                    validator: validateRequired,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Colors.white,
                    ),
                  ),
                  actions: [
                    cancelButton(context),
                    FilledButton(
                      onPressed: () {
                        if (validateRequired(renameTC.text) == null) {
                          handlePromise(
                            store.renameGabarito(gabarito.id!, renameTC.text),
                            context,
                            store,
                            popAmout: 1,
                          );
                        }
                      },
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              );
            },
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
                    cancelButton(context),
                    FilledButton(
                      onPressed: () {
                        handlePromise(
                          store.deleteGabarito(gabarito.id!),
                          context,
                          store,
                        );
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
