import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formaterDate = DateFormat.yMMMd();
const uuid = Uuid();

enum Categorys { furniche, travel, leisure, work, food }

const categoryIcons = {
  Categorys.food: Icons.lunch_dining,
  Categorys.travel: Icons.flight_takeoff,
  Categorys.leisure: Icons.movie,
  Categorys.work: Icons.computer,
  Categorys.furniche: Icons.chair,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categorys category;

  String get formatedDate {
    return formaterDate.format(date);
  }
}
