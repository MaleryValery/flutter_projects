import 'package:flutter/material.dart';

import 'priority_model.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.todo, required this.priority});

  final String todo;
  final Priority priority;
  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(context) {
    final text = widget.todo;
    final priority = widget.priority;
    final icon = priorityIcons[priority];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Icon(icon),
        const SizedBox(
          width: 20,
        ),
        Text(text),
      ]),
    );
  }
}
