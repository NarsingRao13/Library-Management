import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class BookData {
  final String id;
  final Book book;

  BookData({required this.id, required this.book});

  factory BookData.fromJson(QueryDocumentSnapshot<Object?> json) {
    return BookData(
      id: json['id'],
      book: Book.fromJson(json['book']),
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   if (this.book != null) {
  //     data['book'] = this.book!.toJson();
  //   }
  //   return data;
  // }
}

class Book {
  final String author;
  final String title;
  final String genre;
  final bool? availability;
  final String image;
  final double? rating;
  final Timestamp? bookedDate;
  final Timestamp? returnDate;

  Book({
    required this.author,
    required this.title,
    required this.genre,
    this.availability,
    required this.image,
    this.rating,
    this.bookedDate,
    this.returnDate,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        author: json['author'],
        title: json['title'],
        genre: json['genre'],
        availability: json['availability'] ?? true,
        image: json['image'],
        rating: json['rating'],
        bookedDate: json['bookedDate'],
        returnDate: json['returnDate']);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['author'] = this.author;
  //   data['title'] = this.title;
  //   data['genre'] = this.genre;
  //   data['availability'] = this.availability;
  //   data['image'] = this.image;
  //   data['rating'] = this.rating;
  //   return data;
  // }
}
