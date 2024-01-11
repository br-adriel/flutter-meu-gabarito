import 'package:flutter/material.dart';

class ErrorsList extends StatelessWidget {
  final List<String> errors;

  const ErrorsList({super.key, required this.errors});

  @override
  Widget build(BuildContext context) {
    if (errors.isEmpty) return Container();
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.red[100],
      ),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      child: Column(
          children: errors
              .map((er) => Text(
                    er,
                    style: TextStyle(
                      color: Colors.red[900],
                    ),
                  ))
              .toList()),
    );
  }
}
