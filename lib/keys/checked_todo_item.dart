import 'package:flutter/material.dart';
import 'package:todo_app/keys/priority_model.dart';

class CheckedTodoItem extends StatefulWidget {
  const CheckedTodoItem(
      {super.key, required this.todo, required this.priority});
  final String todo;
  final Priority priority;

  @override
  State<CheckedTodoItem> createState() => _CheckedTodoItemState();
}

class _CheckedTodoItemState extends State<CheckedTodoItem> {
  bool _checked = false;

  void handleChengeCheck(bool? prev) {
    setState(() {
      _checked = prev ?? false;
    });
  }

  @override
  Widget build(context) {
    final text = widget.todo;
    final priority = widget.priority;
    final icon = priorityIcons[priority];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CheckboxListTile(
        value: _checked,
        onChanged: handleChengeCheck,
        title: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 20,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
