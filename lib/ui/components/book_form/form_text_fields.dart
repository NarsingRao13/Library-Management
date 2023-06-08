import 'package:flutter/material.dart';
import './form_dropdown_items.dart';

void main() {
  runApp(const MyCustomForm());
}

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
              child: Text(
                "Book Form",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.cyan.shade900,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: MyHomePage(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.cyan.shade900),
                padding: MaterialStateProperty.all(const EdgeInsets.all(18)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 26)),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
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
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
