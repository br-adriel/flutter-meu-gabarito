import 'package:flutter/material.dart';

class NewTestTemplateFloatingButton extends StatelessWidget {
  const NewTestTemplateFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: "Novo gabarito",
      child: const Icon(Icons.add),
    );
  }
}
