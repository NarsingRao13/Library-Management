// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
  int touchId = 0;
  @override
  Widget build(BuildContext context) {
    // DataProvider dataProvider =
    //     Provider.of<DataProvider>(context, listen: true);
    final dataProvider = context.watch<DataProvider>();
    // final iterableProvider = Provider.of<IterableData>(context, listen: false);
    final iterableProvider = context.read<IterableData>();

    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            // padding: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  setState(() {
                    touchId = index;
                  });
                  iterableProvider
                      .setData(dataProvider.mappedData[index].books);
                },
                child: Container(
                  height: 190,
                  width: 70,
                  decoration: BoxDecoration(
                    color: touchId == index ? Colors.deepPurple : Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // child:
                        child: CircleAvatar(
                          radius: 48, // Image radius
                          backgroundImage: NetworkImage(
                            dataProvider.mappedData[index].cImage.toString(),
                          ),
                        ),
                      ),
                      Text(
                        dataProvider.mappedData[index].cna,
                        style: TextStyle(
                          color: touchId == index ? Colors.white : Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
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
