import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  final renameTC = TextEditingController();

  GabaritoActions({super.key});

  @override
  Widget build(BuildContext context) {
    Gabaritos store = Provider.of<MainStore>(context).gabaritos;

    useEffect(() {
      renameTC.text = store.gabarito?.nome ?? '';
      return null;
    });

    return Row(
      children: [
        Observer(
          builder: (context) => Expanded(
            child: FilledButton(
              onPressed: () {
                if (store.isCorrectionModeEnabled) {
                  store.disableCorrectionMode();
                  return;
                }
                store.enableCorrectionMode();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(store.isCorrectionModeEnabled
                      ? Icons.list_alt_outlined
                      : Icons.check_box_outlined),
                  const SizedBox(width: 4),
                  Text(
                    store.isCorrectionModeEnabled ? 'Responder' : 'Corrigir',
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Tooltip(
          message: 'Renomear',
          child: FilledButton(
            style: filledButtonStyle,
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
                            store.renameGabarito(
                                store.gabarito?.id ?? '-', renameTC.text),
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
            child: const Icon(Icons.drive_file_rename_outline_outlined),
          ),
        ),
        const SizedBox(width: 4),
        Tooltip(
          message: 'Apagar',
          child: FilledButton(
            style: filledButtonStyle.copyWith(
              backgroundColor: MaterialStatePropertyAll(Colors.red[700]),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Observer(
                  builder: (context) => AlertDialog(
                    title: store.isLoading
                        ? const Text('Apagando gabarito...')
                        : Text(
                            'Apagar gabarito "${store.gabarito?.nome ?? ''}"?'),
                    content: store.isLoading
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                            ],
                          )
                        : const Text('Essa ação não pode ser desfeita'),
                    actions: store.isLoading
                        ? null
                        : [
                            cancelButton(context),
                            FilledButton(
                              onPressed: () {
                                handlePromise(
                                  store.deleteGabarito(
                                      store.gabarito?.id ?? '-'),
                                  context,
                                  store,
                                );
                              },
                              style: deleteFilledButtonStyle,
                              child: const Text('Apagar'),
                            ),
                          ],
                  ),
                ),
              );
            },
            child: const Icon(Icons.delete_outline),
          ),
        ),
      ],
    );
  }
}
