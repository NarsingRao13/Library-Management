import 'package:flutter/material.dart';
import 'package:library_management/models/category_data.dart';
import 'package:provider/provider.dart';
import '../../../providers/library_provider.dart';

class FormDropdown extends StatelessWidget {
  const FormDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CategoryData> catDropdownData =
        context.read<LibraryProvider>().categories;
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
            value: catDropdownData[0].name,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: catDropdownData.map((CategoryData items) {
              return DropdownMenuItem(
                value: items.name,
                child: Text(
                  items.name,
                  style: const TextStyle(color: Colors.blue),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              context.read<LibraryProvider>().selectedDropdownValue = newValue;
            },
          ),
        ],
      ),
    );
  }
}
