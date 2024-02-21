import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/themes/styles/textfield_styles.dart';
import 'package:meu_gabarito/validators/gabarito.dart';
import 'package:meu_gabarito/validators/required.dart';

class CreateGabaritoScreen extends StatefulWidget {
  const CreateGabaritoScreen({super.key});

  @override
  State<CreateGabaritoScreen> createState() => _CreateGabaritoScreenState();
}

class _CreateGabaritoScreenState extends State<CreateGabaritoScreen> {
  var nameTC = TextEditingController();
  var sizeTC = TextEditingController();
  var startTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Criar gabarito',
                    style: titleTextStyle,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: nameTC,
                    decoration: textFieldInputDecoration('Nome'),
                    textInputAction: TextInputAction.next,
                    validator: validateRequired,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: sizeTC,
                    decoration:
                        textFieldInputDecoration('Quantidade de questões'),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: validateSize,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: startTC,
                    decoration: const InputDecoration(
                      helperText: 'Indique o número da primeira questão',
                      label: Text('Índice'),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    validator: validateIndex,
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
