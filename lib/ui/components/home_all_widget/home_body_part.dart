import 'package:flutter/material.dart';
import 'package:library_management/models/json_data_model.dart';
import 'package:library_management/providers/iterable_data_provider.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    IterableData data = context.read<IterableData>();

    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 100,
                height: 130,
                decoration: BoxDecoration(
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    // ignore: prefer_const_constructors
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.3,
                      spreadRadius: 0.0,
                      offset: const Offset(0, .1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const ListTile(
                  title: Text('hii'),
                ),
              ),
            );
          },
          itemCount: data.iterableData.length,
        ),
      ),
    );
  }
}
