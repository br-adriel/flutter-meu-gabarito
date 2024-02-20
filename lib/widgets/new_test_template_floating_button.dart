import 'package:flutter/material.dart';
import 'package:meu_gabarito/screens/create_test_template.dart';

class NewTestTemplateFloatingButton extends StatelessWidget {
  const NewTestTemplateFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) => const CreateTestTemplateScreen(),
      ),
      tooltip: "Novo gabarito",
      child: const Icon(Icons.add),
    );
  }
}
