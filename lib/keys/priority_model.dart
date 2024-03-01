import 'package:flutter/material.dart';

enum Priority {
  urgent,
  normal,
  low,
}

const priorityIcons = {
  Priority.urgent: Icons.alarm,
  Priority.normal: Icons.list,
  Priority.low: Icons.move_down,
};
