import 'package:flutter/material.dart';
import 'package:todo_app/keys/checked_todo_item.dart';

import 'priority_model.dart';

class Todo {
  const Todo(this.todo, this.priority);

  final String todo;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() => _KeysState();
}

class _KeysState extends State<Keys> {
  var _order = 'asc';
  final todoList = [
    const Todo('Learn Flutter', Priority.urgent),
    const Todo('Practice Flutter', Priority.normal),
    const Todo('Explore over Flutter course', Priority.low),
  ];

  List<Todo> get _getOrderedList {
    final sortedList = List.of(todoList);
    sortedList.sort((a, b) {
      final afterCompare = a.todo.compareTo(b.todo);
      return _order == 'asc' ? afterCompare : -afterCompare;
    });
    return sortedList;
  }

  handleChangeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
              onPressed: handleChangeOrder,
              icon: _order == 'asc'
                  ? const Icon(Icons.arrow_downward)
                  : const Icon(Icons.arrow_upward),
              label:
                  Text('Sort ${_order == 'asc' ? 'ascending' : 'descending'}')),
        ),
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final item in _getOrderedList)
              CheckedTodoItem(
                key: ValueKey(item.todo),
                todo: item.todo,
                priority: item.priority,
              ),
          ],
        ))
      ],
    );
  }
}
