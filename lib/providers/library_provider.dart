import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:library_management/models/book_data.dart';
import 'package:library_management/models/category_data.dart';

class LibraryProvider extends ChangeNotifier {
  List<CategoryData> categories = [];
  List<BookData> books = [];

  CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection("categories");
  CollectionReference booksCollection =
      FirebaseFirestore.instance.collection("books");

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

  void addBook() {}

  void fetchBooks() async {
    await booksCollection.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        BookData book = BookData(
          id: doc.id,
          book: Book(
              author: doc['author'],
              availability: doc['availability'],
              genre: doc['genre'],
              image: doc['image'],
              title: doc['title']),
        );
        books.add(book);
      }
    });
    notifyListeners();
  }
}
