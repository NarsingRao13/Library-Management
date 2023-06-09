import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_management/providers/json_data_provider.dart';
import 'package:library_management/providers/library_provider.dart';
import 'package:library_management/ui/components/home_all_widget/head_part.dart';
import 'package:library_management/ui/components/home_all_widget/home_body_part.dart';
import 'package:provider/provider.dart';

const List<Color> kDefaultRainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection("categories");

  @override
  void initState() {
    final productProvider = Provider.of<DataProvider>(context, listen: false);
    productProvider.storeData();
    initialize();
    context.read<LibraryProvider>().getDocs();
    context.read<LibraryProvider>().fetchBooks();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Library Management",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Column(
        children: [
          HeadProduct(),
          SizedBox(
            height: 23,
          ),
          HomeBody()
        ],
      ),
    );
  }
}
