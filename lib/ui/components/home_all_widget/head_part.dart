// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:library_management/models/json_data_model.dart';
import 'package:library_management/providers/iterable_data_provider.dart';
import 'package:library_management/providers/json_data_provider.dart';
import 'package:provider/provider.dart';

class HeadProduct extends StatefulWidget {
  const HeadProduct({super.key});

  @override
  State<StatefulWidget> createState() {
    return HeadProductState();
  }
}

class HeadProductState extends State<HeadProduct> {
  var touchId;
  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider =
        Provider.of<DataProvider>(context, listen: true);
    final iterableProvider = Provider.of<IterableData>(context, listen: true);
    print("==== ${dataProvider.mappedData}");
    print("setData=${iterableProvider.iterableData}");
    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                setState(() {
                  touchId = index;
                });
                iterableProvider.setData(dataProvider.mappedData[index].books);
              },
              child: Container(
                height: 190,
                width: 80,
                decoration: BoxDecoration(
                    color: touchId == index ? Colors.deepPurple : Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        // child:
                        child: CircleAvatar(
                          radius: 48, // Image radius
                          backgroundImage: NetworkImage(
                              dataProvider.mappedData[index].cImage.toString()),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: dataProvider.mappedData.length,
      ),
    );
  }
}
