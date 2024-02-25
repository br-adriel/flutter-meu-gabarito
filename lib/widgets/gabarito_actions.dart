import 'package:flutter/material.dart';

class GabaritoActions extends StatelessWidget {
  const GabaritoActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.check_box_outlined),
                SizedBox(width: 4),
                Text('Corrigir'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FilledButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.drive_file_rename_outline_outlined),
                SizedBox(width: 4),
                Text('Renomear'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FilledButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red[700]),
            ),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.delete_outline),
                SizedBox(width: 4),
                Text('Apagar'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
