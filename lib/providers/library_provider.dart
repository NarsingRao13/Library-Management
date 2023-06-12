import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:library_management/models/book_data.dart';
import 'package:library_management/models/category_data.dart';

class LibraryProvider extends ChangeNotifier {
  List<CategoryData> categories = [];
  List<BookData> books = [];
  List<BookData> history = [];
  String selectedCatName = "";
  String? selectedDropdownValue;

  CollectionReference categoriesCollection =
      FirebaseFirestore.instance.collection("categories");
  CollectionReference booksCollection =
      FirebaseFirestore.instance.collection("books");
  CollectionReference historyCollection =
      FirebaseFirestore.instance.collection("history");

  void updateSelectedCatName(String name) {
    selectedCatName = name;
    // final booksValue = books.where((item) => item.book.title == name).toList();
    // books = booksValue;
    notifyListeners();
  }

  void getDocs() async {
    categories = [];
    await categoriesCollection.get().then(
      (QuerySnapshot querySnapshot) {
        final catData = querySnapshot.docs;
        updateSelectedCatName(catData[0]['name']);
        final data = catData.map((e) => CategoryData.fromJson(e)).toList();
        categories = data;
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
          (DocumentReference doc) => {fetchBookWithId(id: doc.id)},
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
      },
    );
    notifyListeners();
  }

  void fetchBooks() async {
    books = [];
    await booksCollection.get().then(
      (QuerySnapshot querySnapshot) {
        final booksData = querySnapshot.docs;
        final data = booksData
            .map(
              (e) => BookData(
                id: e.id,
                book: Book(
                  author: e['author'],
                  availability: e['availability'],
                  genre: e['genre'],
                  image: e['image'],
                  title: e['title'],
                ),
              ),
            )
            .toList();
        books = data;
      },
    );
    notifyListeners();
  }

  void updateBook(BookData oldBookData) async {
    final newBook = <String, dynamic>{
      "title": oldBookData.book.title,
      "author": oldBookData.book.author,
      "availability": oldBookData.book.availability,
      "genre": oldBookData.book.genre,
      "image": oldBookData.book.image
    };

    await booksCollection.doc(oldBookData.id).update(newBook).then(
          (_) => {
            print("Success"),
            fetchBooks(),
          },
        );
    notifyListeners();
  }

  void fetchHistoryWithId({required String id}) async {
    await historyCollection.doc(id).get().then(
      (document) {
        BookData book = BookData(
          id: document.id,
          book: Book(
            author: document['author'],
            genre: document['genre'],
            image: document['image'],
            title: document['title'],
            bookedDate: document['bookedDate'],
            returnDate: document['returnDate'],
          ),
        );
        history.add(book);
      },
    );
    notifyListeners();
  }

  void fetchHistory() async {
    history = [];
    await historyCollection.get().then(
      (QuerySnapshot querySnapshot) {
        final historyData = querySnapshot.docs;
        final data = historyData
            .map(
              (e) => BookData(
                id: e.id,
                book: Book(
                  author: e['author'],
                  genre: e['genre'],
                  image: e['image'],
                  title: e['title'],
                  bookedDate: e['bookedDate'],
                  returnDate: e['returnDate'],
                ),
              ),
            )
            .toList();
        history = data;
      },
    );
    notifyListeners();
  }

  void reserveBook(BookData bookData) async {
    final newBook = <String, dynamic>{
      "title": bookData.book.title,
      "author": bookData.book.author,
      "genre": bookData.book.genre,
      "image": bookData.book.image,
      "bookedDate": bookData.book.bookedDate,
      "returnDate": bookData.book.returnDate
    };

    await historyCollection
        .add(newBook)
        .then(
          (DocumentReference doc) => {
            fetchHistory(),
          },
        )
        .onError(
          (error, stackTrace) => {
            log("Failed to add new book"),
            log('$error'),
          },
        );
    notifyListeners();
  }
}
