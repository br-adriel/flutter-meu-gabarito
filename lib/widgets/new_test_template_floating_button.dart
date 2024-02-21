import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/create_gabarito.dart';

class NewTestTemplateFloatingButton extends StatelessWidget {
  const NewTestTemplateFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) => const CreateGabaritoScreen(),
      ),
      tooltip: "Novo gabarito",
      child: const Icon(Icons.add),
    );
  }
}
