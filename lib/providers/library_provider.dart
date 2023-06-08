import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:library_management/models/category_data.dart';

class LibraryProvider extends ChangeNotifier {
  List<CategoryData> categories = [];

  CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection("categories");

  void addCategory(CategoryData category) {
    categories.add(category);
  }

  void getDocs() async {
    await categoriesCollection.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        CategoryData c = CategoryData(name: doc['name'], id: doc["id"]);
        addCategory(c);
      }
    });
    notifyListeners();
  }
}
