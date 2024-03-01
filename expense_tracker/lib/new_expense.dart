import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:intl/intl.dart';

final formater = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final Function(Expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpensState();
}

class _NewExpensState extends State<NewExpense> {
  final _textController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Categorys selectedCategory = Categorys.food;

  @override
  void dispose() {
    _textController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _cleadTextField() {
    _textController.clear();
    _amountController.clear();
    Navigator.pop(context);
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submiteExpenseData() {
    final amount = double.tryParse(_amountController.text);
    final isAmountInvalid = amount == null || amount <= 0;

    if (_textController.text.trim().isEmpty ||
        isAmountInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid value'),
          content: Text('Please fill in all of the filds'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Ok'),
            )
          ],
        ),
      );
      return;
    }

    final newExpens = Expense(
        title: _textController.text,
        amount: amount,
        date: _selectedDate!,
        category: selectedCategory);

    widget.onAddExpense(newExpens);
    _cleadTextField();
  }

  @override
  Widget build(context) {
    final keybordSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constrains) {
      final width = constrains.maxWidth;
      return SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keybordSpace + 16.0),
              child: Column(children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          controller: _textController,
                          maxLength: 50,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            label: Text('Expense title'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          maxLength: 50,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Expense Amount'),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    autofocus: true,
                    controller: _textController,
                    maxLength: 50,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text('Expense title'),
                    ),
                  ),
                if (width >= 600)
                  Row(
                    children: [
                      DropdownButton(
                          value: selectedCategory,
                          items: Categorys.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) return;

                            setState(() {
                              selectedCategory = value;
                            });
                          }),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_selectedDate != null
                                ? formater.format(_selectedDate!)
                                : 'Select date'),
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: const Icon(Icons.calendar_month),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          maxLength: 50,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Expense Amount'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_selectedDate != null
                                ? formater.format(_selectedDate!)
                                : 'Select date'),
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: const Icon(Icons.calendar_month),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                const SizedBox(
                  height: 16,
                ),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: _cleadTextField,
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: _submiteExpenseData,
                        child: const Text('Submit'),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                          value: selectedCategory,
                          items: Categorys.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) return;

                            setState(() {
                              selectedCategory = value;
                            });
                          }),
                      const Spacer(),
                      TextButton(
                        onPressed: _cleadTextField,
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: _submiteExpenseData,
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
              ]),
            ),
          ),
        ),
      );
    });
  }
}
