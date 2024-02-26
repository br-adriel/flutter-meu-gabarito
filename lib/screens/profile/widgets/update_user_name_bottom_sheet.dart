import 'package:flutter/material.dart';
import 'package:meu_gabarito/store/auth/auth.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/themes/styles/textfield_styles.dart';
import 'package:provider/provider.dart';

class UpdateUserNameBottomSheet extends StatelessWidget {
  final textController = TextEditingController();

  UpdateUserNameBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<MainStore>(context).auth;
    textController.text = auth.user?.displayName ?? '';

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "Alterar nome",
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: textController,
              decoration: textFieldInputDecoration("Nome"),
              textInputAction: TextInputAction.done,
            ),
            FilledButton(
              onPressed: () async {
                auth.updateName(textController.text.trim());
                Navigator.of(context).pop();
              },
              child: const Text("Atualizar"),
            ),
          ],
        ),
      ),
    );
  }
}
