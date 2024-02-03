import 'package:flutter/material.dart';
import 'package:meu_gabarito/store/auth/auth.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/themes/styles/textfield_styles.dart';
import 'package:meu_gabarito/widgets/errors_list.dart';
import 'package:provider/provider.dart';

class UpdateEmailBottomSheet extends StatefulWidget {
  const UpdateEmailBottomSheet({super.key});

  @override
  State<UpdateEmailBottomSheet> createState() => _UpdateEmailBottomSheetState();
}

class _UpdateEmailBottomSheetState extends State<UpdateEmailBottomSheet> {
  var emailTC = TextEditingController();
  var passwordTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<MainStore>(context).auth;

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              "Alterar email",
              style: titleTextStyle,
            ),
            auth.errors.isNotEmpty
                ? ErrorsList(errors: auth.errors)
                : const SizedBox(
                    height: 12,
                  ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              controller: emailTC,
              decoration: textFieldInputDecoration("Novo email"),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 4),
            TextField(
              controller: passwordTC,
              decoration: textFieldInputDecoration("Senha atual"),
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 4),
            FilledButton(
              onPressed: () async {
                auth.updateEmail(emailTC.text, passwordTC.text).then((_) {
                  if (auth.errors.isEmpty) {
                    Navigator.of(context).pop();
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          "Um link de confirmação foi enviado para o seu novo email."),
                    ),
                  );
                });
              },
              child: const Text("Atualizar"),
            ),
          ],
        ),
      ),
    );
  }
}
