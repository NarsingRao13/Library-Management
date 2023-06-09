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

  void _addNewBook() {
    context.read<LibraryProvider>().addBook(
        title: "The Girl in Room 105",
        author: "Chetan Bhagat",
        image:
            "https://upload.wikimedia.org/wikipedia/en/b/b9/Girl_in_room_105.png",
        genre: "Mystery, Thriller",
        availability: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ElevatedButton(onPressed: _addNewBook, child: Text("hey"))],
    );
  }
}
