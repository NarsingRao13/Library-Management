import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './form_dropdown_items.dart';
import 'package:library_management/providers/library_provider.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _authorController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _bookRegistration(BuildContext context) async {
    String bookName = _nameController.text;
    String bookDescription = _descriptionController.text;
    String authorName = _authorController.text;
    final String dropValue =
        context.read<LibraryProvider>().selectedDropdownValue ?? "";
    context.watch<LibraryProvider>().addBook(
          author: authorName,
          availability: true,
          genre: dropValue,
          image:
              "http://img.freepik.com/free-vector/flat-world-book-day-background_23-2148094555.jpg?size=626&ext=jpg&ga=GA1.1.985226980.1677144010&semt=ais",
          title: bookName,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 24),
              child: Text(
                "Book Form",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade500),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelStyle: TextStyle(color: Colors.blueGrey.shade900),
                labelText: 'Book Name',
                hintText: 'Book Name Read',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid name';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade500),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelStyle: TextStyle(color: Colors.blueGrey.shade900),
                labelText: 'Description',
                hintText: 'Write About Book Description...',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Write Description';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _authorController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade500),
                  borderRadius: BorderRadius.circular(15),
                ),
                labelStyle: TextStyle(color: Colors.blueGrey.shade900),
                labelText: 'Author Name',
                hintText: 'Author Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Write Author Name';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.all(0),
              child: FormDropdown(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                textStyle: const TextStyle(fontSize: 26),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _bookRegistration;
                  _nameController.clear();
                  _authorController.clear();
                  _descriptionController.clear();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data Added Successfully!'),
                    ),
                  );
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
