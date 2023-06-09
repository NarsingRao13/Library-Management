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
            childAspectRatio: 0.90,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CardWidget(
                image: booksData[index].book.image,
                name: booksData[index].book.title,
                bookAuthor: booksData[index].book.author,
                isAvailable: booksData[index].book.availability ?? true,
              ),
            );
          },
          itemCount: booksData.length,
        ),
      ),
    );
  }
}
