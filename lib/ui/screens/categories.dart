import 'package:flutter/material.dart';
import 'package:library_management/providers/library_provider.dart';
import 'package:library_management/ui/components/category_button.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    context.read<LibraryProvider>().getDocs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cats = context.watch<LibraryProvider>().categories;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (cats.isEmpty)
            const SizedBox()
          else
            Container(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: cats
                      .map(
                        (e) => CategoryButton(buttonData: e),
                      )
                      .toList(),
                ),
              ),
            )
        ],
      ),
    );
  }
}
