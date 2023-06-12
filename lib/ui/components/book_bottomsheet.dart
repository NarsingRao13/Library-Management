import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_management/models/book_data.dart';
import 'package:library_management/providers/library_provider.dart';
import 'package:provider/provider.dart';

import '../../models/form_model.dart';

class BookBottomSheet extends StatefulWidget {
  final String bookName;
  final BookData data;
  const BookBottomSheet({
    super.key,
    required this.onAddBook,
    required this.data,
    required this.bookName,
  });
  final void Function(FormModal formModal) onAddBook;
  @override
  State<BookBottomSheet> createState() => BookBottomSheetState();
}

class BookBottomSheetState extends State<BookBottomSheet> {
  final TextEditingController _textFieldController1 =
      TextEditingController(text: "sd");
  String text = "";
  final TextEditingController _textFieldController2 =
      TextEditingController(text: "text");
  DateTime? _selectedDate;
  bool showSaveButton = false;

  @override
  void dispose() {
    _textFieldController1.dispose();
    _textFieldController2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    setState(() {
      text = widget.data.book.title;
    });
    super.initState();
  }

  void _saveBookData(context) async {
    toggleBook();
    Navigator.pop(context);
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    print("pickedDate $pickedDate");
    setState(() {
      showSaveButton = true;
      _selectedDate = pickedDate;
    });
  }

  void toggleBook() {
    log("Hey");
    print("Pressed");
    if (_selectedDate == null) {
      return;
    }

    Timestamp returnDateTimestamp = Timestamp.fromDate(_selectedDate!);
    Timestamp bookedDateTimestamp = Timestamp.fromDate(DateTime.now());

    Provider.of<LibraryProvider>(context, listen: false).reserveBook(
      BookData(
        id: widget.data.id,
        book: Book(
            author: widget.data.book.author,
            title: widget.data.book.title,
            genre: widget.data.book.genre,
            image: widget.data.book.image,
            bookedDate: bookedDateTimestamp,
            returnDate: returnDateTimestamp),
      ),
    );

    Provider.of<LibraryProvider>(context, listen: false).updateBook(
      BookData(
        id: widget.data.id,
        book: Book(
            author: widget.data.book.author,
            title: widget.data.book.title,
            genre: widget.data.book.genre,
            image: widget.data.book.image,
            availability: false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Text(
                _selectedDate == null
                    ? 'When do you want to return the book?'
                    : formatter.format(_selectedDate!),
                style: const TextStyle(fontSize: 15),
              ),
              IconButton(
                onPressed: _presentDatePicker,
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
          if (!showSaveButton)
            const Text(
              "*Please select the return date",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.red),
            ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                  onPressed: () =>
                      showSaveButton ? _saveBookData(context) : null,
                  child: const Text('Save'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
