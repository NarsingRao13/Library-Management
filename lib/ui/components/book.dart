import 'package:flutter/material.dart';
import 'package:library_management/ui/components/book_bottomsheet.dart';
import '../../models/form_model.dart';

class Book extends StatefulWidget {
  const Book({super.key});
  @override
  State<Book> createState() {
    return _Book();
  }
}

class _Book extends State<Book> {
  void _openAddBook() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => BookBottomSheet(onAddBook: (FormModal formModal) {}));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _openAddBook,
      child: const Text('Books'),
    );
  }
}
