import 'package:flutter/material.dart';
import 'package:library_management/models/json_data_model.dart';
import 'package:library_management/providers/iterable_data_provider.dart';
import 'package:library_management/ui/components/home_all_widget/card_wiget.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    IterableData data = context.read<IterableData>();

    return SingleChildScrollView(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
              height: 580,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  // ignore: prefer_const_constructors
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CardWidget(
                      image: data.iterableData[index].bookImage,
                      name: data.iterableData[index].bookName,
                      isAvailable: data.iterableData[index].available,
                    ),
                  );
                },
                itemCount: data.iterableData.length,
              ))
        ],
      ),
    );
  }
}
