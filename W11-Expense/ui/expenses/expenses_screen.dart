import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_form.dart';
import 'expense_item.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void onAddClicked(BuildContext context) async {
    final result = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(child: ExpenseForm()),
    );

    // TODO YOUR CODE HERE
    if (result != null) {
      setState(() {
        _expenses.add(result);
      });
    }

  }
  // to remove and then undo the remove
  void _removeWithUndo(BuildContext context, int index, Expense removedExpense) {
      setState(() {
        _expenses.removeAt(index);
      });

      final messenger = ScaffoldMessenger.of(context);
      messenger.clearSnackBars();
      messenger.showSnackBar(
        SnackBar(
          content: Text('Removed "${removedExpense.title}"'),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: 'UNDO',
            onPressed: () {
              setState(() {
                final insertIndex = index.clamp(0, _expenses.length);
                _expenses.insert(insertIndex, removedExpense);
              });
            },
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {onAddClicked(context)},
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _expenses.isEmpty
          ? const Center(
              child: Text(
                'No expenses yet. Start adding  some!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
        itemCount: _expenses.length,
        itemBuilder: (context, index) { //=> ExpenseItem(expense: _expenses[index]),
        final expense = _expenses[index];

        return Dismissible(
              key: ValueKey('${expense.title}_${expense.date.toIso8601String()}'),
              direction: DismissDirection.endToStart, // swipe from right to left
              background: Container(
                color: Colors.red[400],
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              // to undo the remove
              onDismissed: (direction) {
                _removeWithUndo(context, index, expense);
              },
              child:  ExpenseItem(expense: expense),
          );
        }
    ),
    );
  }
}

