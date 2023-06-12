import 'package:flutter/material.dart';
import 'package:library_management/providers/library_provider.dart';
import 'package:library_management/ui/components/home_all_widget/card_wiget.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final booksData = context.watch<LibraryProvider>().books;

    return Container(
      // decoration: BoxDecoration(border: Border.all(width: 2)),
      child: SizedBox(
        height: 500,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardWidget(
                data: booksData[index],
              ),
            );
          },
          itemCount: booksData.length,
        ),
      ),
    );
  }
}
