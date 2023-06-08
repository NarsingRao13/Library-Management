import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:library_management/providers/json_data_provider.dart';
import 'package:library_management/ui/components/home_all_widget/head_part.dart';
import 'package:library_management/ui/components/home_all_widget/home_body_part.dart';
import 'package:provider/provider.dart';

import 'package:loading_indicator/loading_indicator.dart';

const List<Color> _kDefaultRainbowColors = const [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection("categories");
  void initState() {
    final productProvider = Provider.of<DataProvider>(context, listen: false);
    productProvider.storeData();
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    await getDocs();
  }

  Future getDocs() async {
    categoriesCollection.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["name"] ?? "Empty Data");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider =
        Provider.of<DataProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            HeadProduct(),
            SizedBox(
              height: 23,
            ),
            HomeBody()
          ],
        ));
  }
}
