import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expensesList, required this.onRemoveItem});
  final Function(Expense expense) onRemoveItem;
  final List<Expense> expensesList;

  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color:
                  Theme.of(context).colorScheme.errorContainer.withOpacity(0.5),
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
            ),
            onDismissed: (direction) => onRemoveItem(expensesList[index]),
            key: ValueKey(expensesList[index]),
            child: ExpenseItem(expensesList[index]),
          );
        });
  }
}
