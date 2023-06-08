import 'package:flutter/material.dart';
import 'package:library_management/providers/library_provider.dart';
import 'package:provider/provider.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  void initState() {
    context.read<LibraryProvider>().fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text("hey")],
    );
  }
}
