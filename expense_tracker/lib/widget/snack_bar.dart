import 'package:flutter/material.dart';

void showSnackBarFunction(
    context, void Function(void Function()) returnDeleted) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.amberAccent,
      duration: const Duration(seconds: 3),
      content: const Text('Expense deleted'),
      action: SnackBarAction(label: 'Undo', onPressed: () => returnDeleted),
    ),
  );
}
