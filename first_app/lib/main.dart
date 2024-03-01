import 'package:flutter/material.dart';
import 'package:first_app/gradient_conteiner.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientConteiner([
          Color.fromARGB(120, 118, 20, 216),
          Color.fromRGBO(225, 70, 27, 1)
        ]),
      ),
    ),
  );
}
