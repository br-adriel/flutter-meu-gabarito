import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/textfield_styles.dart';

class CreateTestTemplateScreen extends StatefulWidget {
  const CreateTestTemplateScreen({super.key});

  @override
  State<CreateTestTemplateScreen> createState() =>
      _CreateTestTemplateScreenState();
}

class _CreateTestTemplateScreenState extends State<CreateTestTemplateScreen> {
  var nameTC = TextEditingController();
  var sizeTC = TextEditingController();
  var startTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar gabarito')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameTC,
                decoration: textFieldInputDecoration('Nome'),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: sizeTC,
                decoration: textFieldInputDecoration('Quantidade de questões'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: startTC,
                decoration: textFieldInputDecoration('Índice do gabarito')
                    .copyWith(
                        helperText: 'Indique o número da primeira questão'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: () {},
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
