import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_gabarito/store/gabaritos/gabaritos.dart';
import 'package:meu_gabarito/store/main.dart';
import 'package:meu_gabarito/themes/styles/text_styles.dart';
import 'package:meu_gabarito/themes/styles/textfield_styles.dart';
import 'package:meu_gabarito/validators/gabarito.dart';
import 'package:meu_gabarito/validators/required.dart';
import 'package:provider/provider.dart';

class CreateGabaritoScreen extends StatefulWidget {
  const CreateGabaritoScreen({super.key});

  @override
  State<CreateGabaritoScreen> createState() => _CreateGabaritoScreenState();
}

class _CreateGabaritoScreenState extends State<CreateGabaritoScreen> {
  var nameTC = TextEditingController();
  var sizeTC = TextEditingController();
  var startTC = TextEditingController(text: '1');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Gabaritos gabaritos = Provider.of<MainStore>(context).gabaritos;

    submitForm() {
      if (formKey.currentState!.validate()) {
        gabaritos
            .createGabarito(
          nameTC.text,
          int.parse(sizeTC.text),
          int.parse(startTC.text),
        )
            .then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Gabarito criado com sucesso')),
          );
          gabaritos.getGabaritos();
          Navigator.of(context).pop();
        }).catchError((_) {
          gabaritos.errors.map(
            (err) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(err)),
            ),
          );
        });
      }
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Observer(
              builder: (context) => gabaritos.isSaving
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Form(
                      key: formKey,
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
                            decoration: textFieldInputDecoration(
                                'Quantidade de questões'),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            validator: validateSize,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: startTC,
                            decoration: const InputDecoration(
                              helperText:
                                  'Indique o número da primeira questão',
                              label: Text('Índice'),
                            ),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            validator: validateIndex,
                            onEditingComplete: submitForm,
                          ),
                          const SizedBox(height: 8),
                          FilledButton(
                            onPressed: submitForm,
                            child: const Text('Salvar'),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
