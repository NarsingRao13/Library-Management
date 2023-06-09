import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:library_management/models/book_data.dart';
import 'package:library_management/models/category_data.dart';

class LibraryProvider extends ChangeNotifier {
  List<CategoryData> categories = [];
  List<BookData> books = [];

  CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection("categories");
  CollectionReference booksCollection =
      FirebaseFirestore.instance.collection("books");

  void getDocs() async {
    categories = [];
    await categoriesCollection.get().then(
      (QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          CategoryData category =
              CategoryData(name: doc['name'], id: doc["id"]);
          categories.add(category);
        }
      },
    );
    notifyListeners();
  }

  void addBook(
      {required String title,
      required String author,
      required String image,
      required String genre,
      required bool availability}) async {
    final newBook = <String, dynamic>{
      "title": title,
      "author": author,
      "availability": availability,
      "genre": genre,
      "image": image
    };

    await booksCollection
        .add(newBook)
        .then(
          (DocumentReference doc) => {
            print('DocumentSnapshot added with ID: ${doc.id}'),
            fetchBookWithId(id: doc.id)
          },
        )
        .onError(
          (error, stackTrace) => {
            log("Failed to add new book"),
            log('$error'),
          },
        );
  }

  void fetchBookWithId({required String id}) async {
    await booksCollection.doc(id).get().then(
      (document) {
        BookData book = BookData(
          id: document.id,
          book: Book(
              author: document['author'],
              availability: document['availability'],
              genre: document['genre'],
              image: document['image'],
              title: document['title']),
        );
        books.add(book);
        print(
          'data  == ${document.data()}',
        );
      },
    );
    notifyListeners();
  }

  void fetchBooks() async {
    books = [];
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
