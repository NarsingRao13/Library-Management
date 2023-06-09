import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/library_provider.dart';

class FormDropdown extends StatefulWidget {
  const FormDropdown({Key? key}) : super(key: key);

  @override
  _MyDropdownPageState createState() => _MyDropdownPageState();
}

class _MyDropdownPageState extends State<FormDropdown> {
  String dropdownvalue = 'Comedy';
  var items = [
    'Fantasy',
    'Adventure',
    'Comedy',
    'Horror',
    'Devotional',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(15),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(15),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            dropdownColor: Colors.white,
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: const TextStyle(color: Colors.blue),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
              context.read<LibraryProvider>().selectedDropdownValue = newValue;
            },
          ),
        ],
      ),
    );
  }
}
