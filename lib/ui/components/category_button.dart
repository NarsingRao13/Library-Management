import 'package:flutter/material.dart';
import 'package:library_management/models/category_data.dart';

class CategoryButton extends StatelessWidget {
  final CategoryData buttonData;
  const CategoryButton({super.key, required this.buttonData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        child: Text(
          buttonData.name ?? "",
          style: const TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}
