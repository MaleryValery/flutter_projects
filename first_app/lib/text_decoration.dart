import 'package:flutter/material.dart';

class TextDecoration extends StatelessWidget {
  const TextDecoration(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Color.fromARGB(255, 255, 232, 161),
      ),
    );
  }
}
