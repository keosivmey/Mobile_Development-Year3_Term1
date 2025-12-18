import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category? _selectedCategory = Category.food;
  DateTime? _selectedDate;
  final DateFormat _dateFormatter = DateFormat.yMd();

  //form for date picker
  Future<void> _selectDate() async {
    final now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate == null) return; // if user cancell
    setState(() {
      _selectedDate = pickedDate; 
    });
  }

  @override
  void dispose() {

    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void onCreate() {
    //  1 Build an expense from the user input
    final title = _titleController.text.trim();
    final amount = double.tryParse(_amountController.text) ?? 0;

    // TODO YOUR CODE HERE
    if (title.isEmpty) {
      _showErrorDialog('Invalid Input', 'The title cannot be empty.');
      return;
    }
    if (amount == null || amount <= 0) {
      _showErrorDialog('Invalid Amount', 'Please enter a valid number greater than 0.');
      return;
    }

    final newExpense = Expense(
          title: title,
          amount: amount,
          date: _selectedDate!,
          category: _selectedCategory!
    );
    Navigator.pop(context, newExpense);
  }
  
  void _showErrorDialog(String title, String message) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
  }
  
  void onCancel() {
    // Close the modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          children: [
            SizedBox(
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'title'),
                maxLength: 50,
              ),
            ),
            SizedBox(
              child: TextFormField(
                controller: _amountController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: 'amount', prefixText: '\$'),
              ),
            ),  
            const SizedBox(height: 20),

            //dropdown for category
            DropdownButtonFormField<Category>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
              ),
              items: Category.values.map((cat) {
                // Display uppercase
                final label = cat.name.toUpperCase();
                return DropdownMenuItem<Category>(
                  value: cat,
                  child: Text(label),
                );
              }).toList(),
              onChanged: (cat) {
                setState(() {
                  _selectedCategory = cat!;
                });
              },
            ),
            const SizedBox(height: 20),        
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : _dateFormatter.format(_selectedDate!),
                    style: TextStyle(
                      color: _selectedDate == null ? Colors.grey[600] : null,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Pick date',
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _selectDate,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onCancel,
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onCreate,
                    child: const Text("Create"),
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}
