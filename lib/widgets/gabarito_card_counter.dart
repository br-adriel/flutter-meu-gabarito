import 'package:flutter/material.dart';

class GabaritoCardCounter extends StatelessWidget {
  final String text;
  final int value;
  final int total;

  const GabaritoCardCounter(
      {super.key,
      required this.text,
      required this.total,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value.toString(),
              style: const TextStyle(fontSize: 28),
            ),
            Text('/$total')
          ],
        ),
        Text(text),
      ],
    );
  }
}
