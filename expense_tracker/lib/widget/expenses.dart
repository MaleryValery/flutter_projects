import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registredExpenses = [
    Expense(
        amount: 19.99,
        title: 'Flutter course',
        date: DateTime.now(),
        category: Categorys.work),
    Expense(
        amount: 9.99,
        title: 'lauch',
        date: DateTime.now(),
        category: Categorys.food),
    Expense(
        amount: 29.99,
        title: 'cheir',
        date: DateTime.now(),
        category: Categorys.furniche),
    Expense(
        amount: 5.99,
        title: 'cinema',
        date: DateTime.now(),
        category: Categorys.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(onAddExpense: _updateExpensesList);
        });
  }

  void _updateExpensesList(Expense newExpens) {
    setState(() {
      _registredExpenses.add(newExpens);
    });
  }

  void _removeExpense(Expense newExpens) {
    final expenseIndex = _registredExpenses.indexOf(newExpens);
    setState(() {
      _registredExpenses.remove(newExpens);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          duration: const Duration(seconds: 3),
          content: const Text('Expense deleted'),
          action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                setState(() {
                  _registredExpenses.insert(expenseIndex, newExpens);
                });
              }),
        ),
      );
    });
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    Widget mainContent = const Center(
      child: Text('No expenses, you can add some'),
    );

    if (_registredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expensesList: _registredExpenses, onRemoveItem: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registredExpenses)),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
