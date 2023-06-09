import 'package:flutter/material.dart';
import 'package:library_management/providers/iterable_data_provider.dart';
import 'package:library_management/ui/components/home_all_widget/card_wiget.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<IterableData>();

    return SizedBox(
      height: 480,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CardWidget(
              image: data.iterableData[index].bookImage,
              name: data.iterableData[index].bookName,
              bookAuthor: data.iterableData[index].bookAuthor,
              isAvailable: data.iterableData[index].available,
            ),
          );
        },
        itemCount: data.iterableData.length,
      ),
    );
  }
}
