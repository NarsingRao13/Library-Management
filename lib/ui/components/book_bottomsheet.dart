import 'package:flutter/material.dart';

import '../../models/form_model.dart';

class BookBottomSheet extends StatefulWidget {
  const BookBottomSheet({super.key, required this.onAddBook});
  final void Function(FormModal formModal) onAddBook;
  @override
  State<BookBottomSheet> createState() {
    return BookBottomSheetState();
  }
}

class BookBottomSheetState extends State<BookBottomSheet> {
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _textFieldController1.dispose();
    _textFieldController2.dispose();
    super.dispose();
  }

  void _saveBookData() async {
    if (_textFieldController1.text.trim().isEmpty ||
        _textFieldController2.text.trim().isEmpty ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('please enter all the fields'),
          content: const Text('please enter a valid content'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    await Future.delayed(Duration(seconds: 2));

    widget.onAddBook(FormModal(
      bookTitle: _textFieldController1.text,
      date: _selectedDate!,
    ));
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
      child: Column(
        children: [
          TextField(
            controller: _textFieldController2,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: 'Book',
            ),
          ),
          Row(
            children: [
              Text(_selectedDate == null
                  ? 'No date selected'
                  : formatter.format(_selectedDate!)),
              IconButton(
                onPressed: _presentDatePicker,
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                onPressed: _saveBookData,
                child: const Text('Save'),
              ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Next...')),
            ],
          )
        ],
      ),
    );
  }
}
