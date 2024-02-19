import 'package:flutter/material.dart';
import 'package:meu_gabarito/store/auth/auth.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/themes/styles/textfield_styles.dart';
import 'package:meu_gabarito/widgets/errors_list.dart';
import 'package:provider/provider.dart';

class UpdatePasswordBottomSheet extends StatefulWidget {
  const UpdatePasswordBottomSheet({super.key});

  @override
  State<UpdatePasswordBottomSheet> createState() =>
      _UpdatePasswordBottomSheetState();
}

class _UpdatePasswordBottomSheetState extends State<UpdatePasswordBottomSheet> {
  var oldPasswordTC = TextEditingController();
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
              "Alterar senha",
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
              controller: oldPasswordTC,
              decoration: textFieldInputDecoration("Senha atual"),
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 4),
            TextField(
              controller: passwordTC,
              decoration: textFieldInputDecoration("Nova senha"),
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 4),
            FilledButton(
              onPressed: () async {
                auth
                    .updatePassword(oldPasswordTC.text, passwordTC.text)
                    .then((value) => Navigator.of(context).pop())
                    .catchError((e) {});
              },
              child: const Text("Atualizar"),
            ),
          ],
        ),
      ),
    );
  }
}
